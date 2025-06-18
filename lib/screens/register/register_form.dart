import 'package:SeeGestMobileApp/controllers/user_controller.dart';
import 'package:SeeGestMobileApp/shared/styled_button.dart';
import 'package:SeeGestMobileApp/shared/styled_input.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

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
    return Form(
        key: _formKey,
        child: Column(
          children: [
            StyledFormInput(
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
            const SizedBox(height: 24),
            StyledFormInput(
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
            const SizedBox(height: 24),
            StyledFormInput(
              labelText: 'Adres e-mail',
              hintText: 'wpisz swój adres e-mail',
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Proszę wpisać swój adres e-mail';
                }
                if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                    .hasMatch(value)) {
                  return 'Proszę wpisać poprawny adres e-mail';
                }
                return null;
              },
              controller: _emailController,
            ),
            const SizedBox(height: 24),
            StyledFormInput(
              labelText: 'Hasło',
              hintText: 'Wpisz swoje hasło',
              obscureText: true,
              validator: passwordValidator,
              controller: _passwordController,
            ),
            const SizedBox(height: 24),
            StyledFormInput(
              labelText: 'Powtórz Hasło',
              hintText: 'Powtórz swoje hasło',
              obscureText: true,
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
            const SizedBox(height: 24),
            StyledFilledButton(
              text: 'Zarejestruj się',
              icon: Icons.app_registration_sharp,
              callback: () async {
                if (_formKey.currentState!.validate()) {
                  try {
                    bool registerSuccess = await UserController.registerUser(
                        _nameController.text,
                        _surnameController.text,
                        _emailController.text,
                        _passwordController.text);
                    if (registerSuccess && context.mounted) {
                      Navigator.pushNamed(context, '/login');
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Pomyślnie założono konto!'),
                          duration: Duration(seconds: 10),
                          showCloseIcon: true,
                        ),
                      );
                    }
                  } catch (e) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(e.toString()),
                          duration: const Duration(seconds: 5),
                        ),
                      );
                    }
                  }
                }
              },
            ),
          ],
        ));
  }
}
