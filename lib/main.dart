import 'package:SeeGestMobileApp/firebase_options.dart';
import 'package:SeeGestMobileApp/views/login_view.dart';
import 'package:SeeGestMobileApp/views/nav_bar_views/nav_bar_wrapper.dart';
import 'package:SeeGestMobileApp/views/register_form_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:SeeGestMobileApp/views/register_options.dart';

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
        '/login': (context) => const LoginView(),
        '/register-options': (context) => const RegisterOptions(),
        '/register': (context) => const RegisterFormView(),
        // '/calendar': (context) => const MonthlyCalendar(), // Add the calendar route
        // '/timePicker': (context) => const TimePickerWidget(), // Add the time picker route
      },
    );
  }
}
