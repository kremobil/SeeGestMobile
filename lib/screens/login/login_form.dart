import 'package:SeeGestMobileApp/controllers/user_controller.dart';
import 'package:SeeGestMobileApp/shared/styled_button.dart';
import 'package:SeeGestMobileApp/shared/styled_input.dart';
import 'package:flutter/material.dart';

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
            StyledFormInput(
              labelText: 'Adres E-mail',
              hintText: 'Wpisz swój email',
              controller: emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'To pole nie może być puste'; // Error message for empty input
                }
                // Regular expression for validating email format
                final emailRegex =
                    RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                if (!emailRegex.hasMatch(value)) {
                  return 'Proszę wprowadzić poprawny adres email'; // Error message for invalid email format
                }

                return null;
              },
            ), //email input

            const SizedBox(height: 16),

            StyledFormInput(
              labelText: "Hasło",
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Proszę wpisać swoje hasło'; // Error message for empty input
                }
                return null; // Return null if the input is valid
              },
              controller: passwordController,
              hintText: "Wpisz swoje hasło",
              additionalLabelWidget: StyledSecondaryTextButton(
                  text: "Nie pamiętasz hasła?",
                  onPressed: () {
                    Navigator.of(context).pushNamed('/reset-password');
                  }),
              obscureText: true,
            ),
            const SizedBox(height: 24), // Add vertical spacing
            StyledFilledButton(
              text: 'Zaloguj się',
              icon: Icons.login,
              callback: () async {
                if (_formKey.currentState!.validate()) {
                  try {
                    final bool loginStatus =
                        await UserController.loginWithEmailAndPassword(
                            emailController.text, passwordController.text);

                    if (loginStatus && context.mounted) {
                      Navigator.of(context).pushReplacementNamed('/home');
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(e.toString()),
                      ),
                    );
                  }
                }
              },
            ),
          ],
        ));
  }
}
