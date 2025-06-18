import 'package:SeeGestMobileApp/firebase_options.dart';
import 'package:SeeGestMobileApp/screens/login/login_screen.dart';
import 'package:SeeGestMobileApp/screens/password_reset/password_rest_sreenc.dart';
import 'package:SeeGestMobileApp/seegest_theme.dart';
import 'package:SeeGestMobileApp/views/nav_bar_views/nav_bar_wrapper.dart';
import 'package:SeeGestMobileApp/screens/register/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:SeeGestMobileApp/screens/register_methods/register_methods_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform); // Initialize Firebase

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var loggedView = false; // Variable to track if the user is logged in

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SeeGest",
      initialRoute: loggedView ? '/home' : '/login',
      routes: {
        '/home': (context) => const HomePage(),
        '/login': (context) => const LoginScreen(),
        '/register-options': (context) => const RegisterMethodsScreen(),
        '/register': (context) => const RegisterScreen(),
        '/reset-password':  (context) => const PasswordRestScreen()
        // '/calendar': (context) => const MonthlyCalendar(), // Add the calendar route
        // '/timePicker': (context) => const TimePickerWidget(), // Add the time picker route
      },
      theme: seegestTheme,
    );
  }
}
