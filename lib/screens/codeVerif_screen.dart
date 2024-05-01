import 'package:app/screens/info_screen.dart';
import 'package:app/screens/signIn_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app/screens/home_bar_screen.dart';

class CodeVerifScreen extends StatefulWidget {
  const CodeVerifScreen({Key? key}) : super(key: key);

  @override
  _CodeVerifScreenState createState() => _CodeVerifScreenState();
}

class _CodeVerifScreenState extends State<CodeVerifScreen> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  List<FocusNode> finalFocusNodes = List.generate(4, (index) => FocusNode());

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 60),
            Row(
              children: [
                const SizedBox(width: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: const Color(0xFFD1D1D1), width: 1),
                    borderRadius: BorderRadius.circular(10.0),
                    shape: BoxShape.rectangle,
                  ),
                  child: IconButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(
                        vertical: 17.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: const BorderSide(
                          color: Color(0xFFD1D1D1),
                          width: 1.0,
                        ),
                      ),
                    ),
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.black,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInScreen(),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
            const SizedBox(height: 100),
            const Text(
              'Enter verification code',
              style: TextStyle(fontSize: 20, fontFamily: "Poppins", fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 24.0,
                  margin: const EdgeInsets.only(right: 3),
                  child: const Center(
                    child: Text(
                      'A code has been sent to ',
                      style: TextStyle(fontSize: 14, fontFamily: "Poppins", color: Color(0xFF93969F)),
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
                        '+216 12345678',
                        style: TextStyle(fontSize: 14, fontFamily: "Poppins", color: Color(0xFF93969F), fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 60,
                  child: TextField(
                    style: const TextStyle(fontSize: 18, color: Colors.black, fontFamily: "Poppins"),
                    controller: _controller1,
                    focusNode: finalFocusNodes[0],
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFC69211), width: 1.5),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      filled: true,
                      fillColor: Color(0xFFFFFFFF),
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        finalFocusNodes[0].unfocus();
                        finalFocusNodes[1].requestFocus();
                      }
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  width: 60,
                  child: TextField(
                    style: const TextStyle(fontSize: 18, color: Colors.black, fontFamily: "Poppins"),
                    controller: _controller2,
                    focusNode: finalFocusNodes[1],
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFC69211), width: 1.5),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      filled: true,
                      fillColor: Color(0xFFFFFFFF),
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        finalFocusNodes[1].unfocus();
                        finalFocusNodes[2].requestFocus();
                      }
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  width: 60,
                  child: TextField(
                    style: const TextStyle(fontSize: 18, color: Colors.black, fontFamily: "Poppins"),
                    controller: _controller3,
                    focusNode: finalFocusNodes[2],
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFC69211), width: 1.5),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      filled: true,
                      fillColor: Color(0xFFFFFFFF),
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        finalFocusNodes[2].unfocus();
                        finalFocusNodes[3].requestFocus();
                      }
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  width: 60,
                  child: TextField(
                    style: const TextStyle(fontSize: 18, color: Colors.black, fontFamily: "Poppins"),
                    controller: _controller4,
                    focusNode: finalFocusNodes[3],
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFC69211), width: 1.5),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      filled: true,
                      fillColor: Color(0xFFFFFFFF),
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        finalFocusNodes[3].unfocus();
                      }
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Container(
                  height: 24.0,
                  
                  margin: const EdgeInsets.only(right: 3,bottom: 36.0),

                  child:const Center(
                    child: Text(
                      "Don't receive a code?",
                      style:  TextStyle(
                        fontSize: 16,
                        fontFamily: "Poppins",
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              Container(
                height: 24.0,
                margin: const EdgeInsets.only( bottom: 36.0),
                child: GestureDetector(
                  onTap: () {       
                  },
                  child: const Center(
                    child: Text(
                      'Resend',
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
          ),
            Container(
            
            decoration:const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(300)),
              shape: BoxShape.rectangle,
            ),
            width: MediaQuery.of(context).size.width - 40.0,
            child: TextButton(
              // ignore: sort_child_properties_last
              child: const Text(
                'Verify Now',
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
                ),shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(300.0),
                  side: const  BorderSide(
                    color: Color(0xFFC69211),
                    width: 1.0,
                  ),
                ),
                
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  BottomBarPages(initialPage: 2),
                  ),
                );
              },
            ),
          ),
          Expanded(child: Container()),
       ]
      )
    )
  );
}
}