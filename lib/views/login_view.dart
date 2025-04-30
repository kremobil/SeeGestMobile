import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:SeeGestMobileApp/widgets/custom_icon_button.dart';
import 'package:SeeGestMobileApp/widgets/custom_input.dart';

class LoginView extends StatelessWidget {
  const LoginView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0), // Add horizontal padding
        child: SingleChildScrollView(
          reverse: true, // Scroll the view in the opposite direction
          child: Column( //main column, entire view
            crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start
            children: <Widget>[
              const SizedBox(height: 128), // Add vertical spacing
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
          
              const SizedBox(height: 48), // Add vertical spacing
          
              Row(   //login header
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align the row content to the ends
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
                      style: const TextStyle(color: Colors.black), // Default text style
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Zarejestruj się!',
                          style: const TextStyle(color: Colors.blue), // Link text style
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                                Navigator.pushNamed(context, '/register-options'); // Navigate to the register options page
                            },
                        ),
                      ],
                    ),
                  ), // Text with a link
                ],
              ),
          
              const SizedBox(height: 24), // Add vertical spacing
              CustomInput(labelText: 'Adres E-mail', hintText: 'Wpisz swój email'), //email input
          
              const SizedBox(height: 16),
          
              Column(     //password input
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align the row content to the ends
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
                      style: const TextStyle(color: Colors.blue), // Link text style
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Define the action when the link is tapped
                          print('Forgot password link tapped');
                        },
                    ),
                  ),
                ],
              ),
                  const SizedBox(height: 4), // Add some space between label and input
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Wpisz swoje hasło', // Hint text inside the input
                      contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0), // Adjust vertical and horizontal padding
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0), // 8px border radius
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
              CustomIconButton(text: 'Zaloguj się', icon: Icons.login, callback: () => {},),
              const SizedBox(height: 48), // Add vertical spacing
              CustomIconButton(text: 'Zaloguj się przez Facebook', icon: Icons.facebook, callback: () => {},),
              const SizedBox(height: 8), // Add vertical spacing
              CustomIconButton(text: 'zaloguj się przez Google', icon: Icons.g_translate, callback: () => {},),
            ],
          ),
        ),
      ),
    );
  }
}


//TODO: find gogle icon