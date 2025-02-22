import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:seegest/widgets/custom_icon_button.dart';


class RegisterOptions extends StatelessWidget {
  const RegisterOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center( // Center all content on the screen
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center the column vertically
            children: <Widget>[
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, width: 1.0), // 1px red border
                  ),
                  child: Image.network(
                    'https://picsum.photos/id/1/200/300', // Replace with your image URL
                    height: 106, // Set the height of the image
                    width: 220,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 32.0, bottom: 16.0), // Add top and bottom margin
                child: Row(   //register header
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align the row content to the ends
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
                        style: const TextStyle(color: Colors.black), // Default text style
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Zaloguj się!',
                            style: const TextStyle(color: Colors.blue), // Link text style
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Define the action when the link is tapped
                                print('Link tapped');
                              },
                          ),
                        ],
                      ),
                    ), // Text with a link
                  ],
                ),
              ),
              CustomIconButton(text: "Zarejestruj się przez maila", icon: Icons.email_outlined),
              const SizedBox(height: 64), // Add vertical spacing
              CustomIconButton(text: "Zarejestruj się przez facebooka", icon: Icons.facebook_outlined),
              const SizedBox(height: 8), // Add vertical spacing
              CustomIconButton(text: "Zarejestruj się przez google", icon: Icons.g_translate_outlined),
            ],
          ),
        ),
      ),
    );
  }
}