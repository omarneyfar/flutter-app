import 'package:app/screens/codeVerif_screen.dart';
import 'package:app/screens/documents_screen.dart';
import 'package:app/screens/home_bar_screen.dart';
import 'package:app/screens/home_screen.dart';
import 'package:app/screens/info_screen.dart';
import 'package:app/screens/notes_screen.dart';
import 'package:app/screens/payments_screen.dart';
import 'package:app/screens/signUp_screen.dart';
import 'package:app/screens/time_calendar_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'screens/intro_screen.dart';
import 'screens/signIn_screen.dart';
import 'screens/signin2_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,

  );
  runApp(MyApp());
}

Future<bool> validateSession() async {
  try {
    final storedUid = await getSessionData('uid');
    if (storedUid != null) {
      final user = await FirebaseAuth.instance.currentUser;
      if (user != null && user.uid == storedUid) {
        return true;
      } else {
        await clearSessionData();
        return false;
      }
    } else {
      return false;
    }
  } catch (error) {
    print('Error checking session validity: $error');
    return false; // Handle error gracefully (optional)
  }
}

Future<String?> getSessionData(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(key);
}

Future<void> clearSessionData() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.clear();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? _isSessionValid = null;

  @override
  void initState() {
    super.initState();
    _checkSessionValidity();
  }

  Future<void> _checkSessionValidity() async {
    final isValid = await validateSession();
    setState(() {
      _isSessionValid = isValid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mon application',
      debugShowCheckedModeBanner: false,
      home: _isSessionValid == null
          ? const Center(
              child: CircularProgressIndicator()) // Loading indicator
          : (_isSessionValid!)
              ? BottomBarPages(initialPage: 2) // Navigate to home if valid
              : const IntroScreen(),
      routes: {
        '/info': (context) => const InfoScreen(),
        '/singin': (context) => const SignInScreen(),
        '/singin2': (context) =>  LoginDemo(),
        '/singup': (context) => const SignUpScreen(),
        '/codeVerif': (context) => const CodeVerifScreen(),
        '/notes': (context) => NotesPage(),
        '/documents': (context) => DocumentsPage(),
        '/calendar': (context) => CalendarPage(),
        '/payments': (context) => PaymentsPage(),
      },
    );
  }
}
