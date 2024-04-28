import 'dart:convert';
import 'dart:js';
import 'dart:math';

import 'package:app/screens/codeVerif_screen.dart';
import 'package:app/screens/home_bar_screen.dart';
import 'package:app/screens/signUp_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final firestore = FirebaseFirestore.instance;
    Future<void> storeSessionData(String userUId) async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('uid', userUId);
    }

   
    void showToast(String message, String type) {
      if (type == "success") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
            backgroundColor: Colors.green,
          ),
        );
      } else if (type == "error") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
            backgroundColor: Colors.red,
          ),
        );
      } else if (type == "warning") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
            backgroundColor: Colors.amber[400],
          ),
        );
      }
    }
    Future<void> signIn(String email, String password) async {
      try {
        final userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        await storeSessionData(userCredential.user!.uid);
        showToast('You have been connected successfully!', 'success');
        
        Navigator.pushReplacement(
          // Replace with your desired screen
          context,
          MaterialPageRoute(
            builder: (context) => BottomBarPages(initialPage: 2),
          ),
        );
      } on FirebaseAuthException catch (error) {
        showToast(error.message.toString(), "error");
      } catch (error) {
        showToast('An unexpected error occurred.', "error");
      }
    }

    final TextEditingController _email = new TextEditingController();
    final TextEditingController _password = new TextEditingController();
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8FF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context)
                .size
                .height, // Set a specific height for the container
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 90),
                Image.asset(
                  'assets/images/logoiit.png',
                  height: 120,
                ),
                const SizedBox(height: 70),
                const Text(
                  'Login',
                  style: TextStyle(fontSize: 36, fontFamily: "Medel"),
                ),
                const SizedBox(height: 57),
                const Text(
                  'Login with your Email and Password',
                  style: TextStyle(fontSize: 16, fontFamily: "Poppins"),
                ),
                const SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width - 40.0,
                  child: Column(
                    children: [
                      StatefulBuilder(
                        builder: (context, setState) => TextField(
                          style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontFamily: "Poppins"),
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: Colors.black,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            hintText: 'example@email.com',
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 3),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(300)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFD1D1D1), width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(300)),
                            ),
                            labelStyle: TextStyle(
                              color: Color(0xFFD1D1D1),
                            ),
                            hintStyle: TextStyle(
                              color: Color(0xFFD1D1D1),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 17),
                            filled: true,
                            fillColor: Color(0xFFFFFFFF),
                          ),
                          onChanged: (value) => setState(() {
                            _email.text = value;
                          }),
                        ),
                      ),
                      const SizedBox(height: 20),
                      StatefulBuilder(
                        builder: (context, setState) => TextField(
                          style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontFamily: "Poppins"),
                          keyboardType: TextInputType
                              .visiblePassword, // Set keyboard type to show password characters
                          obscureText: true, // Hide the password characters
                          cursorColor: Colors.black,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter your password',
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 3),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(300)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFD1D1D1), width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(300)),
                            ),
                            labelStyle: TextStyle(
                              color: Color(0xFFD1D1D1),
                            ),
                            hintStyle: TextStyle(
                              color: Color(0xFFD1D1D1),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 17),
                            filled: true,
                            fillColor: Color(0xFFFFFFFF),
                          ),
                          onChanged: (value) => setState(() {
                            _password.text = value;
                          }),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(300)),
                    shape: BoxShape.rectangle,
                  ),
                  width: MediaQuery.of(context).size.width - 40.0,
                  child: TextButton(
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xFFC69211),
                      padding: const EdgeInsets.symmetric(
                        vertical: 17.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(300.0),
                        side: const BorderSide(
                          color: Color(0xFFC69211),
                          width: 1.0,
                        ),
                      ),
                    ),
                    onPressed: () async {
                      final email = _email.text;
                      final password = _password.text;
                      await signIn(email, password);
                    },
                  ),
                ),
                Expanded(child: Container()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 24.0,
                      margin: const EdgeInsets.only(right: 3, bottom: 36.0),
                      child: const Center(
                        child: Text(
                          'Don’t have an account?',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Poppins",
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 24.0,
                      margin: const EdgeInsets.only(bottom: 36.0),
                      child: GestureDetector(
                        onTap: () {
                          // Replace 'https://www.example.com' with the actual link
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ),
                          );
                        },
                        child: const Center(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFFC69211),
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
