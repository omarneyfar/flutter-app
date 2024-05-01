import 'dart:html';
import 'dart:math';

import 'package:app/screens/codeVerif_screen.dart';
import 'package:app/screens/info_screen.dart';
import 'package:app/screens/signIn_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:otp_pin_field/otp_pin_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class User {
  final String uid;
  final String phoneNumber; // Assuming you have a phoneNumber field

  // Add the constructor
  User.fromDoc(DocumentSnapshot doc)
      : this.uid = doc.id,
        this.phoneNumber = doc.get('phoneNumber');
}

class _SignUpScreenState extends State<SignUpScreen> {
  final firestore = FirebaseFirestore.instance;

  void showToast(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  Future<void> createUser(
      String email, String password, String phoneNumber) async {
    try {
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SignInScreen(),
        ),
      );
    } on FirebaseAuthException catch (error) {
      // Handle Firebase Auth specific errors
      showToast(error.message.toString()); // Call the showToast function here
    } catch (error) {
      // Handle other errors
      showToast('An unexpected error occurred.');
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController _fullName = new TextEditingController();
    final TextEditingController _email = new TextEditingController();
    final TextEditingController _phoneNumber = new TextEditingController();
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
                const SizedBox(height: 40),
                Image.asset(
                  'assets/images/logoiit.png',
                  height: 120,
                ),
                const SizedBox(height: 30),
                const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 36, fontFamily: "Medel"),
                ),
                const SizedBox(height: 30),
                // const Text(
                //   'Login with your phone number',
                //   style: TextStyle(fontSize: 16, fontFamily: "Poppins"),
                // ),
                // const SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width - 40.0,
                  child: Column(
                    children: [
                      // StatefulBuilder(
                      //   builder: (context, setState) => TextField(
                      //     style: const TextStyle(
                      //         fontSize: 14,
                      //         color: Colors.black,
                      //         fontFamily: "Poppins"),
                      //     keyboardType: TextInputType.name,
                      //     cursorColor: Colors.black,
                      //     decoration: const InputDecoration(
                      //       labelText: "Full Name",
                      //       hintText: "Foulen El Fouleni",
                      //       border: OutlineInputBorder(
                      //         borderSide:
                      //             BorderSide(color: Colors.red, width: 3),
                      //         borderRadius:
                      //             BorderRadius.all(Radius.circular(300)),
                      //       ),
                      //       focusedBorder: OutlineInputBorder(
                      //         borderSide: BorderSide(
                      //             color: Color(0xFFD1D1D1), width: 1),
                      //         borderRadius:
                      //             BorderRadius.all(Radius.circular(300)),
                      //       ),
                      //       labelStyle: TextStyle(
                      //         color: Color(0xFFD1D1D1),
                      //       ),
                      //       hintStyle: TextStyle(
                      //         color: Color(0xFFD1D1D1),
                      //       ),
                      //       contentPadding: EdgeInsets.symmetric(
                      //           horizontal: 20, vertical: 17),
                      //       filled: true,
                      //       fillColor: Color(0xFFFFFFFF),
                      //     ),
                      //     onChanged: (value) => setState(() {
                      //       _fullName.text = value;
                      //     }),
                      //   ),
                      // ),
                      // const SizedBox(height: 20),
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
                      // StatefulBuilder(
                      //   builder: (context, setState) => TextField(
                      //     style: const TextStyle(
                      //         fontSize: 14,
                      //         color: Colors.black,
                      //         fontFamily: "Poppins"),
                      //     keyboardType: TextInputType.phone,
                      //     inputFormatters: [
                      //       FilteringTextInputFormatter.digitsOnly
                      //     ],
                      //     cursorColor: Colors.black,
                      //     decoration: const InputDecoration(
                      //       labelText: "Phone Number",
                      //       hintText: "12345678",
                      //       border: OutlineInputBorder(
                      //         borderSide:
                      //             BorderSide(color: Colors.red, width: 3),
                      //         borderRadius:
                      //             BorderRadius.all(Radius.circular(300)),
                      //       ),
                      //       focusedBorder: OutlineInputBorder(
                      //         borderSide: BorderSide(
                      //             color: Color(0xFFD1D1D1), width: 1),
                      //         borderRadius:
                      //             BorderRadius.all(Radius.circular(300)),
                      //       ),
                      //       labelStyle: TextStyle(
                      //         color: Color(0xFFD1D1D1),
                      //       ),
                      //       hintStyle: TextStyle(
                      //         color: Color(0xFFD1D1D1),
                      //       ),
                      //       contentPadding: EdgeInsets.symmetric(
                      //           horizontal: 20, vertical: 17),
                      //       filled: true,
                      //       fillColor: Color(0xFFFFFFFF),
                      //     ),
                      //     onChanged: (value) => setState(() {
                      //       _phoneNumber.text = value;
                      //     }),
                      //   ),
                      // ),
                      // const SizedBox(height: 20),
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
                    // ignore: sort_child_properties_last
                    child: const Text(
                      'Send Code',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFFC69211),
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
                      final phoneNumber = _phoneNumber.text;
                      await createUser(email, password, phoneNumber);
                    },
                  ),
                ),
                const SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 24.0,
                      child: const Center(
                        child: Text(
                          'Already have an account?',
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
                      child: GestureDetector(
                        onTap: () {
                          // Replace 'https://www.example.com' with the actual link
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignInScreen(),
                            ),
                          );
                        },
                        child: const Center(
                          child: Text(
                            'Sign In',
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
        )));
  }
  //  Future<void> generateOtp(String contact) async {
  //   smsOTPSent(verId, forceResendingToken) {
  //     verificationId = verId;
  //   }
  //   try {
  //     await _auth.verifyPhoneNumber(
  //       phoneNumber: contact,
  //       codeAutoRetrievalTimeout: (String verId) {
  //         verificationId = verId;
  //       },
  //       codeSent: smsOTPSent,
  //       timeout: const Duration(seconds: 60),
  //       verificationCompleted: (AuthCredential phoneAuthCredential) {},
  //       verificationFailed: (error) {
  //         print(error);
  //       },
  //     );
  //   // ignore: empty_catches
  //   } catch (e) {
  //   }
  // }
}
