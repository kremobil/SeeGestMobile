import 'package:SeeGestMobileApp/controllers/user_controller.dart';
import 'package:SeeGestMobileApp/widgets/custom_form_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:SeeGestMobileApp/widgets/custom_icon_button.dart';
import 'package:SeeGestMobileApp/widgets/custom_input.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginView extends StatefulWidget {
  const LoginView({
    super.key,
  });

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 24.0), // Add horizontal padding
        child: SingleChildScrollView(
          reverse: true, // Scroll the view in the opposite direction
          child: Column(
            //main column, entire view
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align children to the start
            children: <Widget>[
              const SizedBox(height: 128), // Add vertical spacing
              Center(
                child: Image.asset(
                  "images/SeeGestLogo.png", // Replace with your image URL
                  width: 220,
                ),
              ),

              const SizedBox(height: 48), // Add vertical spacing

              Row(
                //login header
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // Align the row content to the ends
                children: <Widget>[
                  const Text(
                    'Zaloguj się', // Title
                    style: TextStyle(
                      fontSize: 24.0, // Set font size to 24px
                      fontWeight: FontWeight.bold, // Set font weight to bold
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Nie masz konta? ',
                      style: const TextStyle(
                          color: Colors.black), // Default text style
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Zarejestruj się!',
                          style: const TextStyle(
                              color: Colors.blue), // Link text style
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context,
                                  '/register-options'); // Navigate to the register options page
                            },
                        ),
                      ],
                    ),
                  ), // Text with a link
                ],
              ),

              const SizedBox(height: 24), // Add vertical spacing

              LoginForm(),
              const SizedBox(height: 48), // Add vertical spacing
              CustomIconButton(
                text: 'Zaloguj się przez Facebook',
                icon: Icons.facebook,
                callback: () async {
                  bool loginSuccess = await UserController.loginWithFacebook(context);
                  if (loginSuccess && context.mounted) {
                    Navigator.pushNamed(context, '/home');
                  }
                },
              ),
              const SizedBox(height: 8), // Add vertical spacing
              CustomIconButton(
                text: 'zaloguj się przez Google',
                icon: Icons.g_translate,
                callback: () async {
                  bool logginSuccess =
                      await UserController.loginWithGoogle(context);
                  if (logginSuccess && context.mounted) {
                    Navigator.pushNamed(context, '/home');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? _errorMessage;

  @override
  void dispose() {
    emailController.dispose(); // Dispose of the controller when not needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            CustomFormInput(
              labelText: 'Adres E-mail',
              hintText: 'Wpisz swój email',
              controller: emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'To pole nie może być puste'; // Error message for empty input
                }
                return null;
              },
            ), //email input

            const SizedBox(height: 16),

            Column(
              //password input
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // Align the row content to the ends
                  children: [
                    const Text(
                      'Hasło', // Label above the input
                      style: TextStyle(
                        fontSize: 18.0, // Set font size to 18px
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Nie pamiętasz hasła?',
                        style: const TextStyle(
                            color: Colors.blue), // Link text style
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Define the action when the link is tapped
                            print('Forgot password link tapped');
                          },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                    height: 4), // Add some space between label and input
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'To pole nie może być puste'; // Error message for empty input
                    }
                    return null;
                  },
                  controller: passwordController,
                  obscureText: true, // Hide the password input
                  decoration: InputDecoration(
                    hintText: 'Wpisz swoje hasło', // Hint text inside the input
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal:
                            12.0), // Adjust vertical and horizontal padding
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(8.0), // 8px border radius
                      borderSide: const BorderSide(
                        color: Colors.black, // 1px black border
                        width: 1.0,
                      ),
                    ),
                  ),
                ), // Input field
              ],
            ),
            const SizedBox(height: 24), // Add vertical spacing
            CustomIconButton(
              text: 'Zaloguj się',
              icon: Icons.login,
              callback: () async {
                // Print the email input when the button is pressed
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  final bool loginStatus =
                      await UserController.loginWithEmailAndPassword(
                          emailController.text,
                          passwordController.text,
                          context);

                  if (context.mounted) {
                    if (loginStatus) {
                      Navigator.pushNamed(context, '/home');
                    }
                  }
                }
              },
            ),
          ],
        ));
  }

  Future<Map<String, dynamic>?> loginUser() async {
    final response = await http.post(
      Uri.parse('https://api.seegest.com/login'), // Replace with your API URL
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: convert.jsonEncode(<String, String>{
        'email': emailController.text,
        'password': passwordController.text,
      }),
    );

    print(response.body);

    if (response.statusCode == 201) {
      final storage = FlutterSecureStorage();
      await storage.write(
          key: 'access_token',
          value: convert.jsonDecode(response.body)['access_token']);
      return <String, dynamic>{
        'access_token': convert.jsonDecode(response.body)['access_token'],
      };
    }

    if (response.statusCode == 401) {
      return <String, String>{
        'error': 'Invalid email or password',
      };
    }

    return convert.jsonDecode(response.body) as Map<String, dynamic>?;
  }
}


//TODO: find gogle icon