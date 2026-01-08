import 'package:SeeGestMobileApp/firebase_options.dart';
import 'package:SeeGestMobileApp/screens/add_post/add_post_screen.dart';
import 'package:SeeGestMobileApp/screens/homepage/homepage_screen.dart';
import 'package:SeeGestMobileApp/screens/login/login_screen.dart';
import 'package:SeeGestMobileApp/screens/map/map_screen.dart';
import 'package:SeeGestMobileApp/screens/password_reset/password_rest_sreenc.dart';
import 'package:SeeGestMobileApp/screens/post_details/post_details.dart';
import 'package:SeeGestMobileApp/screens/profile/profile_screen.dart';
import 'package:SeeGestMobileApp/screens/search_posts/search_posts.dart';
import 'package:SeeGestMobileApp/seegest_theme.dart';
import 'package:SeeGestMobileApp/screens/register/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:SeeGestMobileApp/screens/register_methods/register_methods_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized
  await Firebase.initializeApp(
    name: "SeeGests",
    options: DefaultFirebaseOptions.currentPlatform); // Initialize Firebase

  await SentryFlutter.init(
    (options) {
      options.dsn = 'https://0c81d1f1b528feda57afc3cedee29806@o4510001576345600.ingest.de.sentry.io/4510001577853008';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for tracing.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
      // The sampling rate for profiling is relative to tracesSampleRate
      // Setting to 1.0 will profile 100% of sampled transactions:
      options.profilesSampleRate = 1.0;
    },
    appRunner: () => runApp(SentryWidget(child: ProviderScope(child: MyApp()))),
  );
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
        '/profile': (context) => const ProfileScreen(),
        '/search_posts': (context) => const SearchPostsScreen(),
        '/postDetails': (context) => const PostDetailsScreen(),

        // '/calendar': (context) => const MonthlyCalendar(), // Add the calendar route
        // '/timePicker': (context) => const TimePickerWidget(), // Add the time picker route
      },
      theme: seegestTheme,
    );
  }
}
