import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:SeeGestMobileApp/widgets/custom_icon_button.dart';
import 'package:SeeGestMobileApp/widgets/custom_input.dart';

class RegisterFormView extends StatelessWidget {
  const RegisterFormView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0), // Add horizontal padding
        child: SingleChildScrollView(
          reverse: true, // Scroll the view in the opposite direction
          child: Column(  //main column of view
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
    
              const SizedBox(height: 64), // Add vertical spacing
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, width: 1.0), // 1px red border
                  ),
                  child: Image.asset("images/SeeGestLogo.png", // Replace with your image URL
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
                                Navigator.pushNamed(context, '/login'); // Navigate to the login page
                              },
                          ),
                        ],
                      ),
                    ), // Text with a link
                  ],
                ),
              ),
    
              CustomInput(labelText: 'Imię', hintText: 'Wpisz swoje imię'),
    
              CustomInput(labelText: 'Nazwisko', hintText: 'Wpisz swoje nazwisko'),
    
              CustomInput(labelText: 'Adres e-mail', hintText: 'wpisz swój adres e-mail'),
    
              CustomInput(labelText: 'Hasło', hintText: 'Wpisz swoje hasło'),
    
              CustomInput(labelText: 'Powtórz Hasło', hintText: 'Powtórz swoje hasło'),
    
              CustomIconButton(text: 'Zarejestruj się', icon: Icons.app_registration_sharp, callback: () => {},),
            ],
          ),
        ),
      ),
    );
  }
} //TODO: make it more responsible