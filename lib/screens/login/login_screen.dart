import 'package:SeeGestMobileApp/controllers/user_controller.dart';
import 'package:SeeGestMobileApp/screens/login/login_form.dart';
import 'package:SeeGestMobileApp/shared/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:SeeGestMobileApp/shared/styled_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; 

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 24.0,),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: <Widget>[
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
                  //login header
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // Align the row content to the ends
                  children: <Widget>[
                    const StyledHeadingText("Zaloguj się"),
                    StyledSecondaryTextButton(text: "Nie masz konta? Zarejestruj się!", onPressed: () {
                      Navigator.of(context).pushNamed("/register-options");
                    })
                  ],
                ),
        
                const SizedBox(height: 24), // Add vertical spacing
        
                LoginForm(),
                const SizedBox(height: 48), // Add vertical spacing
                StyledFilledButton(
                  text: 'Zaloguj się przez Facebook',
                  icon: FontAwesomeIcons.facebook,
                  callback: () async {
                    bool loginSuccess = await UserController.loginWithFacebook(context);
                    if (loginSuccess && context.mounted) {
                      Navigator.pushReplacementNamed(context, '/home');
                    }
                  },
                ),
                const SizedBox(height: 8), // Add vertical spacing
                StyledFilledButton(
                  text: 'zaloguj się przez Google',
                  icon: FontAwesomeIcons.google,
                  callback: () async {
                    bool logginSuccess =
                        await UserController.loginWithGoogle(context);
                    if (logginSuccess && context.mounted) {
                      Navigator.pushReplacementNamed(context, '/home');
                    }
                  },
                ),
                const SizedBox(height: 16,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}




//TODO: find gogle icon