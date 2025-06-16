import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:SeeGestMobileApp/classes/user.dart';
import 'storage_controller.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class UserController {
  static Future<bool> loginWithGoogle(BuildContext? context) async {
    try {
      // Simulate a network call
      final googleAccount = await GoogleSignIn().signIn();
      if (googleAccount != null) {
        // User is signed in
        final googleAuth = await googleAccount.authentication;
        final idToken = googleAuth.idToken;

        final response = await http.post(
          Uri.parse("https://api.seegest.com/google-login"),
          body: jsonEncode({
            "token": idToken,
          }),
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
          },
        );

        print('Status kod odpowiedzi: ${response.statusCode}');
        print('Odpowiedź serwera: ${response.body}');

        if (response.statusCode == 200 &&
            !jsonDecode(response.body).containsKey("error")) {
          final accessToken = jsonDecode(response.body)['token'];
          print('Token otrzymany: $accessToken');

          await StorageController().saveToken(accessToken);

          return true;
        } else {
          if (context != null && context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Wystąpił błąd podczas logowania'),
              ),
            );
          }
          return false;
        }
      } else {
        // User canceled the sign-in
        print('Logowanie anulowane przez użytkownika');
        return false;
      }
    } catch (e) {
      print('Błąd podczas logowania przez Google: $e');
      if (context != null && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Błąd: $e'),
          ),
        );
      }
      return false;
    }
  }

  static Future<bool> loginWithEmailAndPassword(
      String email, String password, BuildContext? context) async {
    try {
      final response = await http.post(
        Uri.parse("https://api.seegest.com/login"),
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
          "Accept": "application/json",
        },
      );

      print('Status kod odpowiedzi: ${response.statusCode}');
      print('Odpowiedź serwera: ${response.body}');

      if (response.statusCode == 201 &&
          !jsonDecode(response.body).containsKey("error")) {
        final accessToken = jsonDecode(response.body)['token'];
        print('Token otrzymany: $accessToken');

        await StorageController().saveToken(accessToken);

        return true;
      } else {
        if (context != null && context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Wystąpił błąd podczas logowania'),
            ),
          );
        }
        return false;
      }
    } catch (e) {
      print('Błąd podczas logowania przez email i hasło: $e');
      if (context != null && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Błąd: $e'),
          ),
        );
      }
      return false;
    }
  }

  static Future<bool> loginWithFacebook(BuildContext context) async {
    final LoginResult facebookAccount = await FacebookAuth.instance.login();
    try {
      if (facebookAccount != null) {
        final response = await http.post(
          Uri.parse("https://api.seegest.com/facebook-login"),
          body: jsonEncode({
            "token": facebookAccount.accessToken?.tokenString,
          }),
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
          },
        );

        print('Status kod odpowiedzi: ${response.statusCode}');
        print('Odpowiedź serwera: ${response.body}');

        if (response.statusCode == 200 &&
            !jsonDecode(response.body).containsKey("error")) {
          final accessToken = jsonDecode(response.body)['token'];
          print('Token otrzymany: $accessToken');

          await StorageController().saveToken(accessToken);

          return true;
        } else {
          if (context != null && context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Wystąpił błąd podczas logowania'),
              ),
            );
          }
          return false;
        }
      } else {
        // User canceled the sign-in
        print('Logowanie anulowane przez użytkownika');
        return false;
      }
    } catch (e) {
      print('Błąd podczas logowania przez Facebook: $e');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Błąd: $e'),
          ),
        );
      }
      return false;
    }
  }

  static Future<User> getUserData() async {
    try {
      // Użyj singletona do pobrania tokenu
      String? token = await StorageController().getToken();
      print('Token odczytany w getUserData: $token');

      if (token == null || token.isEmpty) {
        print('Brak tokenu dostępu');
        throw Exception('Brak tokenu dostępu');
      }

      final response = await http.get(
        Uri.parse("https://api.seegest.com/myinfo"),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      print('Status odpowiedzi /myinfo: ${response.statusCode}');
      print('Odpowiedź /myinfo: ${response.body}');

      if (response.statusCode == 200) {
        // Zamień na właściwą implementację User w zależności od struktury odpowiedzi
        return User.fromJson(jsonDecode(response.body));
      } else {
        print('Błąd pobierania danych użytkownika: ${response.statusCode}');
        throw Exception('Błąd pobierania danych użytkownika');
      }
    } catch (e) {
      print('Wyjątek podczas pobierania danych użytkownika: $e');
      throw Exception('Wyjątek podczas pobierania danych użytkownika: $e');
    }
  }
}
