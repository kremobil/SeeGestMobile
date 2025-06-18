import 'dart:convert';

import 'package:SeeGestMobileApp/screens/register/register_form.dart';
import 'package:SeeGestMobileApp/shared/styled_button.dart';
import 'package:SeeGestMobileApp/shared/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    super.key,
  });

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  Future<String?> _registerUser() async {
    http.Response response =
        await http.post(Uri.parse("https://api.seegest.com/register"),
            body: jsonEncode({
              "name": _nameController.text,
              "surname": _surnameController.text,
              "email": _emailController.text,
              "password": _passwordController.text,
            }),
            headers: {
          "Content-Type": "application/json; charset=UTF-8",
        });

    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 201) {
      return null; // Registration successful
    } else {
      print("int else");
      Map<String, dynamic> body = jsonDecode(response.body);

      if (body['message'] ==
          'User with email ${_emailController.text} already exists') {
        return 'Użytkownik o tym adresie e-mail już istnieje';
      } else {
        return 'Wystąpił błąd podczas rejestracji. Proszę spróbować ponownie później.';
      }
    }
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Proszę wpisać swoje hasło';
    }
    if (value.length < 8) {
      return 'Hasło musi mieć co najmniej 8 znaków';
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Hasło musi zawierać co najmniej jedną małą literę';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Hasło musi zawierać co najmniej jedną dużą literę';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Hasło musi zawierać co najmniej jedną cyfrę';
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Hasło musi zawierać co najmniej jeden znak specjalny';
    }
    if (RegExp(r'[^a-zA-Z0-9!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Hasło nie może zawierać spacji ani innych znaków';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 24.0), // Add horizontal padding
          child: SingleChildScrollView(
            reverse: true, // Scroll the view in the opposite direction
            child: Column(
              //main column of view
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 48), // Add vertical spacing
                Center(
                    child: Hero(
                      tag: "logo",
                      child: Image.asset(
                                      "images/SeeGestLogo.png", // Replace with your image URL
                                      width: 220,
                                    ),
                    )),
                const SizedBox(height: 48), // Add vertical spacing
        
                Row(
                  //register header
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // Align the row content to the ends
                  children: <Widget>[
                    const StyledHeadingText("Zarejestruj się"),
                    StyledSecondaryTextButton(text: 'Masz konto? Zaloguj się!', onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    })
                  ],
                ),
        
                RegisterForm(),

                const SizedBox(height: 16), // Add vertical spacing
              ],
            ),
          ),
        ),
      ),
    );
  }
} //TODO: make it more responsible
