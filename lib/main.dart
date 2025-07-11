import 'package:SeeGestMobileApp/firebase_options.dart';
import 'package:SeeGestMobileApp/screens/add_post/add_post_screen.dart';
import 'package:SeeGestMobileApp/screens/homepage/homepage_screen.dart';
import 'package:SeeGestMobileApp/screens/login/login_screen.dart';
import 'package:SeeGestMobileApp/screens/map/map_screen.dart';
import 'package:SeeGestMobileApp/screens/password_reset/password_rest_sreenc.dart';
import 'package:SeeGestMobileApp/screens/profile/profile_screen.dart';
import 'package:SeeGestMobileApp/seegest_theme.dart';
import 'package:SeeGestMobileApp/shared/dashboard_layout.dart';
import 'package:SeeGestMobileApp/views/nav_bar_views/nav_bar_wrapper.dart';
import 'package:SeeGestMobileApp/screens/register/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:SeeGestMobileApp/screens/register_methods/register_methods_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform); // Initialize Firebase

  runApp(ProviderScope(child: MyApp()));
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
        '/home': (context) => const HomepageScreen(),
        '/login': (context) => const LoginScreen(),
        '/register-options': (context) => const RegisterMethodsScreen(),
        '/register': (context) => const RegisterScreen(),
        '/reset-password':  (context) => const PasswordRestScreen(),
        '/add-post': (context) => const AddPostScreen(),
        '/map': (context) => const MapScreen(),
        '/profile': (context) => const ProfileScreen(), // Profile route
        
        // '/calendar': (context) => const MonthlyCalendar(), // Add the calendar route
        // '/timePicker': (context) => const TimePickerWidget(), // Add the time picker route
      },
      theme: seegestTheme,
    );
  }
}
