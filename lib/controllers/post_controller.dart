import 'dart:convert';

import 'package:SeeGestMobileApp/controllers/storage_controller.dart';
import 'package:http/http.dart' as http;

class PostController {
  static Future<bool> createPost({
    required String content,
    required DateTime createdAt,
    required int iconId,
    required String location,
    required String title,
    required List<int> tagsIds,
    required double latitude,
    required double longitude,
    bool isAnonymous = false,
  }) async {
    try {
      String? token = await StorageController().getToken();
      
      if (token == null) {
        print("Error: No authentication token found");
        return false;
      }

      Map<String, dynamic> body = {
        "content": content,
        "created_at": createdAt.toIso8601String(),
        "icon_id": iconId,
        "location": location,
        "title": title,
        "tags_ids": tagsIds,
        "latitude": latitude,
        "longitude": longitude,
        "is_anonymous": isAnonymous
      };

      Map<String, String> headers = {
        "content-type": "application/json", // Poprawiłem literówkę
        "Authorization": "Bearer $token"
      };

      http.Response response = await http.post(
        Uri.parse("https://api.seegest.com/posts"),
        body: jsonEncode(body),
        headers: headers,
      );

      switch (response.statusCode) {
        case 201:
          print("Post created successfully");
          return true;
          
        case 400:
          // Błąd walidacji - sprawdź czy tag z podanym ID istnieje
          print("Error 400: Validation failed - ${response.body}");
          return false;
          
        case 401:
          // Nieautoryzowany - token może być nieprawidłowy lub wygasły
          print("Error 401: Unauthorized - invalid or expired token");
          return false;
          
        case 403:
          // Brak uprawnień
          print("Error 403: Forbidden - insufficient permissions");
          return false;
          
        case 422:
          // Błąd walidacji danych
          print("Error 422: Unprocessable Entity - validation error: ${response.body}");
          return false;
          
        case 500:
          // Błąd serwera
          print("Error 500: Internal server error");
          return false;
          
        default:
          print("Unexpected error: ${response.statusCode} - ${response.body}");
          return false;
      }
      
    } catch (e) {
      // Obsługa błędów sieciowych lub innych wyjątków
      print("Network or other error occurred: $e");
      return false;
    }
  }
}