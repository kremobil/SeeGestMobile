import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:SeeGestMobileApp/shared/styled_icon_button.dart';

class RegisterOptions extends StatelessWidget {
  const RegisterOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          // Center all content on the screen
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Center the column vertically
            children: <Widget>[
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.red, width: 1.0), // 1px red border
                  ),
                  child: Image.asset("images/SeeGestLogo.png", // Replace with your image URL
                    width: 220,
                  ),
                ),
              ),
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
              CustomIconButton(
                text: "Zarejestruj się przez maila",
                icon: Icons.email_outlined,
                callback: () {
                  print("tesxt");
                  Navigator.pushNamed(context,
                      '/register'); // Navigate to the register form page
                },
              ),
              const SizedBox(height: 64), // Add vertical spacing
              CustomIconButton(
                text: "Zarejestruj się przez facebooka",
                icon: Icons.facebook_outlined,
                callback: () {
                  Navigator.pushNamed(context,
                      '/register'); // Navigate to the register form page
                },
              ),
              const SizedBox(height: 8), // Add vertical spacing
              CustomIconButton(
                text: "Zarejestruj się przez google",
                icon: Icons.g_translate_outlined,
                callback: () {
                  Navigator.pushNamed(context,
                      '/register'); // Navigate to the register form page
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
