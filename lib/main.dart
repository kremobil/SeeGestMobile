import 'package:SeeGestMobileApp/views/login_view.dart';
import 'package:SeeGestMobileApp/views/nav_bar_views/nav_bar_wrapper.dart';
import 'package:SeeGestMobileApp/views/register_form_view.dart';
import 'package:flutter/material.dart';
import 'package:SeeGestMobileApp/views/nav_bar_views/homepage_founded_posts.dart';
import 'package:SeeGestMobileApp/views/register_options.dart';
import 'package:SeeGestMobileApp/widgets/monthly_calendar.dart';
import 'package:SeeGestMobileApp/widgets/post.dart';
import 'package:SeeGestMobileApp/widgets/time_picker.dart'; // Import the TimePickerWidget
import 'classes/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
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
