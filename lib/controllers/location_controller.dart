import 'dart:convert';

import 'package:SeeGestMobileApp/controllers/storage_controller.dart';
import 'package:SeeGestMobileApp/models/location_suggestion.dart';
import 'package:SeeGestMobileApp/models/place_details.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class LocationController {
  static Future<LatLng> getCurrentLatLng() async {
    try {
      Position position = await Geolocator.getCurrentPosition();
      return LatLng(position.latitude, position.longitude);
    } catch (e) {
      print("Error getting location: $e");
      return LatLng(53.123482, 18.008438); // Default location
    }
  }

  static Future<String> getLocationName(double lat, double lng) async {
    String? token = await StorageController().getToken();

    if (token == null || token.isEmpty) {
      print('Brak tokenu dostępu');
      throw Exception('Brak tokenu dostępu');
    }
    try {
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      };

      Map<String, dynamic> body = {"latitude": lat, "longitude": lng};

      http.Response response = await http.post(
          Uri.parse("https://api.seegest.com/decode-location"),
          body: jsonEncode(body),
          headers: headers);
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        return data['formatted_address'];
      } else {
        print("Error getting location name: ${response.statusCode}");
        return "Nieznana lokalizacja";
      }
    } catch (e) {
      print("Error getting location name: $e");
      return "Nieznana lokalizacja";
    }
  }

  static Future<bool> requestLocationPermission(BuildContext context) async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      return await _showPermissionDialog(
        context,
        title: "Lokalizacja Wymagana",
        content:
            "Ta aplikacja potrzebuje dostępu do lokalizacji, aby móc automatycznie uzupełniać lokalizację podczas dodawania posta.",
        primaryButtonText: "Zezwól na dostęp",
        onPrimaryPressed: () async {
          final newPermission = await Geolocator.requestPermission();
          return newPermission == LocationPermission.always ||
              newPermission == LocationPermission.whileInUse;
        },
      );
    } else if (permission == LocationPermission.deniedForever) {
      return await _showPermissionDialog(
        context,
        title: "Lokalizacja Zablokowana",
        content:
            "Dostęp do lokalizacji jest trwale zablokowany. Proszę włączyć go w ustawieniach urządzenia.",
        primaryButtonText: "Otwórz Ustawienia",
        onPrimaryPressed: () async {
          await Geolocator.openAppSettings();
          return false; // User needs to manually grant permission
        },
      );
    }

    return true; // Permission already granted
  }

  static Future<bool> _showPermissionDialog(
    BuildContext context, {
    required String title,
    required String content,
    required String primaryButtonText,
    required Future<bool> Function() onPrimaryPressed,
  }) async {
    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: false, // User must tap a button
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text("Anuluj"),
            ),
            TextButton(
              onPressed: () async {
                final success = await onPrimaryPressed();
                Navigator.of(context).pop(success);
              },
              child: Text(primaryButtonText),
            ),
          ],
        );
      },
    );

    return result ?? false;
  }

  static Future<List<LocationSuggestionModel>>
      getLocationAutocompleteSuggestions(String query,
          {required double lat, required double lng}) async {
    String? token = await StorageController().getToken();

    print("token");
    if (token == null) {
      // TODO: add token handling
      return [];
    }

    Map<String, String> headers = {
      "Authorization": "Bearer $token",
      "content-type": "application/json"
    };

    Map<String, dynamic> body = {
      "query": query,
      "latitude": lat,
      "longitude": lng
    };

    http.Response response = await http.post(
        Uri.parse("https://api.seegest.com/location-autocomplete"),
        body: jsonEncode(body),
        headers: headers);

    Map<String, dynamic> predictions = jsonDecode(response.body);

    List<LocationSuggestionModel> suggestions = [];

    if (response.statusCode == 401) {
      throw Exception("Authorization error");
    }

    if (!predictions.containsKey("suggestions")) {
      return [];
    }

    for (var suggestion in predictions['suggestions']) {
      suggestions
          .add(LocationSuggestionModel.fromJson(suggestion["placePrediction"]));
    }

    return suggestions;
  }

  static Future<PlaceDetailsModel> getPlaceDetails(String placeId) async {
    final token = await StorageController().getToken();

    if (token == null) {
      // TODO: add token handling
      throw Exception("Nieprawidłowy token");
    }

    Map<String, String> headers = {
      "Authorization": "Bearer $token",
      "content-type": "application/json"
    };

    http.Response response = await http.post(
      Uri.parse("https://api.seegest.com/search-location"),
      body: jsonEncode({
        "place_id": placeId
      }),
      headers: headers
    );

    PlaceDetailsModel details = PlaceDetailsModel.fromJson(jsonDecode(response.body));

    return details;
  }
}
