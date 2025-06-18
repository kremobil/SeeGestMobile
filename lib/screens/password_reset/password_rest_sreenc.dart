import 'dart:async';

import 'package:SeeGestMobileApp/controllers/user_controller.dart';
import 'package:SeeGestMobileApp/seegest_theme.dart';
import 'package:SeeGestMobileApp/shared/styled_button.dart';
import 'package:SeeGestMobileApp/shared/styled_input.dart';
import 'package:SeeGestMobileApp/shared/styled_text.dart';
import 'package:flutter/material.dart';

class PasswordRestScreen extends StatefulWidget {
  const PasswordRestScreen({super.key});

  @override
  State<PasswordRestScreen> createState() => _PasswordRestScreenState();
}

class _PasswordRestScreenState extends State<PasswordRestScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  bool _sentOnce = false;
  late Timer? _timer;
  int _timeLeft = 0;

  @override
  void dispose() {
    _emailController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void startTimer(int timeInSeconds) {
    _timeLeft = timeInSeconds;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeLeft > 0) {
        setState(() {
          _timeLeft--;
        });
      } else {
        _timer?.cancel();
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 128),
            Center(
              child: Hero(
                tag: "logo",
                child: Image.asset(
                  "images/SeeGestLogo.png",
                  width: 220,
                ),
              ),
            ),
            const SizedBox(height: 48),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StyledHeadingText("Zresetuj hasło"),
                StyledSecondaryTextButton(
                    text: "Powróć do logowania",
                    onPressed: () {
                      Navigator.of(context).pushNamed('/login');
                    }),
              ],
            ),
            const SizedBox(height: 24),
            Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StyledFormInput(
                        labelText: "Email",
                        hintText: "Wprowadź swój adres email",
                        controller: _emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'To pole nie może być puste'; // Error message for empty input
                          }
                          // Regex for validating email format
                          final emailRegex = RegExp(
                              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                          if (!emailRegex.hasMatch(value)) {
                            return 'Proszę wprowadzić poprawny adres email'; // Error message for invalid email formatt
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.mainColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            const Icon(Icons.info_outline_rounded,
                                size: 48, color: AppColors.mainColor),
                            const SizedBox(width: 16),
                            Expanded(
                              child: StyledBodyText(
                                "Wprowadź swój adres email, jeśli mamy go w naszej bazie, wyślemy Ci link do zresetowania hasła.",
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      StyledFilledButton(
                          text: _timeLeft > 0 ? "Wyślij ponownie za $_timeLeft" : _sentOnce ? "Wyślij ponownie" : "Wyślij maila",
                          icon: _timeLeft <= 0 ? Icons.send : null,
                          callback: _timeLeft == 0 ? () async {
                            if (_formKey.currentState!.validate()) {
                              final requestSuccess =
                                  await UserController.sendPasswordResetEmail(
                                      _emailController.text);
                              if (requestSuccess) {
                                setState(() {
                                  _sentOnce = true;
                                  startTimer(60);
                                });
                              }
                            }
                          } : null)
                    ]))
          ],
        ),
      ),
    )));
  }
}
