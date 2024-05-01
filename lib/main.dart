import 'package:app/screens/codeVerif_screen.dart';
import 'package:app/screens/documents_screen.dart';
import 'package:app/screens/home_screen.dart';
import 'package:app/screens/info_screen.dart';
import 'package:app/screens/notes_screen.dart';
import 'package:app/screens/payments_screen.dart';
import 'package:app/screens/signUp_screen.dart';
import 'package:app/screens/time_calendar_screen.dart';
import 'package:flutter/material.dart';
import 'screens/intro_screen.dart';
import 'screens/signIn_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized before initializing Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
  return MaterialApp(
    title: 'Mon application',
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => const IntroScreen(),
      '/info': (context) => const InfoScreen(),
      '/singin': (context) => const SignInScreen(),
      '/singup': (context) => const SignUpScreen(),
      '/codeVerif': (context) => const CodeVerifScreen(),
      '/notes': (context) => NotesPage(),
      '/documents': (context) => DocumentsPage(),
      '/home': (context) => HomePage(),
      '/calendar': (context) => CalendarPage(),
      '/payments': (context) => PaymentsPage(),
    },
  );
}
}
