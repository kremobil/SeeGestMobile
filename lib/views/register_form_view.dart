import 'dart:convert';

import 'package:SeeGestMobileApp/widgets/custom_form_input.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:SeeGestMobileApp/widgets/custom_icon_button.dart';
import 'package:SeeGestMobileApp/widgets/custom_input.dart';
import 'package:http/http.dart' as http;

class RegisterFormView extends StatefulWidget {
  const RegisterFormView({
    super.key,
  });

  @override
  State<RegisterFormView> createState() => _RegisterFormViewState();
}

class _RegisterFormViewState extends State<RegisterFormView> {
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
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 24.0), // Add horizontal padding
        child: SingleChildScrollView(
          reverse: true, // Scroll the view in the opposite direction
          child: Column(
            //main column of view
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 64), // Add vertical spacing
              Center(
                  child: Image.asset(
                "images/SeeGestLogo.png", // Replace with your image URL
                width: 220,
              )),

              Container(
                margin: const EdgeInsets.only(
                    top: 32.0, bottom: 16.0), // Add top and bottom margin
                child: Row(
                  //register header
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // Align the row content to the ends
                  children: <Widget>[
                    const Text(
                      'Zarejestruj się', // Title
                      style: TextStyle(
                        fontSize: 24.0, // Set font size to 24px
                        fontWeight: FontWeight.bold, // Set font weight to bold
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Masz konto? ',
                        style: const TextStyle(
                            color: Colors.black), // Default text style
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Zaloguj się!',
                            style: const TextStyle(
                                color: Colors.blue), // Link text style
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(context,
                                    '/login'); // Navigate to the login page
                              },
                          ),
                        ],
                      ),
                    ), // Text with a link
                  ],
                ),
              ),

              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomFormInput(
                        labelText: 'Imię',
                        hintText: 'Wpisz swoje imię',
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Proszę wpisać swoje imię';
                          }
                          return null;
                        },
                        controller: _nameController,
                      ),
                      CustomFormInput(
                        labelText: 'Nazwisko',
                        hintText: 'Wpisz swoje nazwisko',
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Proszę wpisać swoje imię';
                          }
                          return null;
                        },
                        controller: _surnameController,
                      ),
                      CustomFormInput(
                        labelText: 'Adres e-mail',
                        hintText: 'wpisz swój adres e-mail',
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Proszę wpisać swój adres e-mail';
                          }
                          if (!RegExp(
                                  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                              .hasMatch(value)) {
                            return 'Proszę wpisać poprawny adres e-mail';
                          }
                          return null;
                        },
                        controller: _emailController,
                      ),
                      CustomFormInput(
                        labelText: 'Hasło',
                        hintText: 'Wpisz swoje hasło',
                        validator: passwordValidator,
                        controller: _passwordController,
                      ),
                      CustomFormInput(
                        labelText: 'Powtórz Hasło',
                        hintText: 'Powtórz swoje hasło',
                        validator: (String? value) {
                          if (passwordValidator(value) != null) {
                            return passwordValidator(value);
                          }
                          if (value != _passwordController.text) {
                            return 'Hasła nie pasują do siebie';
                          }
                          return null;
                        },
                        controller: _confirmPasswordController,
                      ),
                      CustomIconButton(
                        text: 'Zarejestruj się',
                        icon: Icons.app_registration_sharp,
                        callback: () async {
                          if (_formKey.currentState!.validate()) {
                            String? errorMessage = await _registerUser();
                            print(errorMessage);
                            if (context.mounted) {
                              if (errorMessage != null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(errorMessage),
                                  ),
                                );
                              } else {
                                Navigator.pushNamed(context, '/login');
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Pomyślnie zarejestrowano!"),
                                  ),
                                );
                              }
                            }
                          }
                        },
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
} //TODO: make it more responsible
