import 'package:SeeGestMobileApp/shared/styled_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:SeeGestMobileApp/shared/styled_button.dart';

class RegisterMethodsScreen extends StatelessWidget {
  const RegisterMethodsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Center(
            // Center all content on the screen
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center the column vertically
              children: <Widget>[
                Center(
                  child: Hero(
                    tag: "logo",
                    child: Image.asset("images/SeeGestLogo.png", // Replace with your image URL
                      width: 220,
                    ),
                  ),
                ),
                const SizedBox(height: 48), // Add vertical spacing
                Row(
                  //register header
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // Align the row content to the ends
                  children: <Widget>[
                    StyledHeadingText("Zarejestruj się"),
                    StyledSecondaryTextButton(text: "Masz konto? Zaloguj się!", onPressed: () {
                      Navigator.of(context).pushNamed('/login');
                    })
                  ],
                ),
                const SizedBox(height: 24), // Add vertical spacing
                StyledFilledButton(
                  text: "Zarejestruj się przez maila",
                  icon: Icons.email_outlined,
                  callback: () {
                    print("tesxt");
                    Navigator.pushNamed(context,
                        '/register'); // Navigate to the register form page
                  },
                ),
                const SizedBox(height: 48), // Add vertical spacing
                StyledFilledButton(
                  text: "Zarejestruj się przez facebooka",
                  icon: Icons.facebook_outlined,
                  callback: () {
                    Navigator.pushNamed(context,
                        '/register'); // Navigate to the register form page
                  },
                ),
                const SizedBox(height: 8), // Add vertical spacing
                StyledFilledButton(
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
      ),
    );
  }
}
