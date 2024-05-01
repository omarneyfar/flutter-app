import 'package:flutter/material.dart';

import 'info_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.25),
          Image.asset(
            'assets/images/logoiit.png',
            height: 140,
          ),
          const SizedBox(width: 150, height: 20),
        
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: SizedBox(width: 150, height: 20),
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "Welcome to International Institut of Technology (IIT), a private accredited institution offering innovative education inspired by the North American model. ",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18,color : Color(0xFF525252),fontFamily: "Poppins"),
            ),
          ),
          
          Expanded(child: Container()),
          Container(
            margin: const EdgeInsets.only(bottom: 120.0),
            decoration: BoxDecoration(
              color: Color(0xFFC69211),
              borderRadius: BorderRadius.circular(10.0),
              shape: BoxShape.rectangle,
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_forward),
              color: Colors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InfoScreen(),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
