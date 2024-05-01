import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'signIn_screen.dart';
class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final List<String> imageList = [
    'assets/images/architecture.jpg',
    'assets/images/ingenierie.jpg',
    'assets/images/licence.jpg',
    'assets/images/master.jpg',
    'assets/images/prepa.jpg',
  ];

  final List<String> descriptionList = [
    'Discover innovative architectural education at IIT, where we train architects who embrace environmental, cultural, and socio-economic challenges. ',
    'Become a skilled engineer, solving complex problems and accessing diverse professional fields in Tunisia and worldwide through solid education at IIT of Sfax.',
    "Pursue a Licence degree at the International Institute of Technology and gain expertise in your chosen field, opening doors to various career opportunities in Tunisia and beyond.",
    "Our Master's programs offer specialized curricula designed to equip graduates with highly sought-after skills for the future industry.",
    "Our preparatory cycle provides comprehensive preparation for renowned engineering schools, offering students a strong scientific guidance from highly qualified teachers.",
  ];

  final List<String> titleList = [
    'Architecture',
    'Engineering',
    'Licence',
    'Industrial Master',
    'Preparatory cycle '
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 15),
          Expanded(child: Container()),
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    titleList[_currentIndex],
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 30, fontFamily: "Medel"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    descriptionList[_currentIndex],
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16,color : Color(0xFF525252),fontFamily: "Poppins"),
                  ),
                ),
            ]
            )
            
          ),
        
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:0),
            child: CarouselSlider(
              items: imageList
                  .map((item) => Container(
                        child: Center(
                            child: Image.asset(
                          item,
                          fit: BoxFit.cover,
                          height: 250,
                          width: MediaQuery.of(context).size.width,
                        )),
                      ))
                  .toList(),
              options: CarouselOptions(
                height: 300.0,
                autoPlay: true,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imageList.map((url) {
              int index = imageList.indexOf(url);
              return Container(
                width: 8.0,
                height: 8.0,
                margin:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      _currentIndex == index ? Color(0xFFC69211) : Colors.grey,
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          Expanded(child: Container()),
          Container(
            margin: const EdgeInsets.only( bottom: 36.0),
            decoration:const BoxDecoration(
              color: Color(0xFFC69211),
              borderRadius: BorderRadius.all(Radius.circular(300)),
              shape: BoxShape.rectangle,
              
            ),
            width: MediaQuery.of(context).size.width *0.65,
            child: TextButton(
              // ignore: sort_child_properties_last
              child: const Text(
                'Get Started',
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
                    builder: (context) => const SignInScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
