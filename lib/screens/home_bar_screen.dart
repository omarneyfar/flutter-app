import 'package:app/main.dart';
import 'package:app/screens/signIn_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './notes_screen.dart';
import './documents_screen.dart';
import './payments_screen.dart';
import './time_calendar_screen.dart';
import './home_screen.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomBarPages extends StatefulWidget {
  final int initialPage;

  BottomBarPages({this.initialPage = 1});

  @override
  _BottomBarPagesState createState() => _BottomBarPagesState();
}

class _BottomBarPagesState extends State<BottomBarPages> {
  late int _currentIndex;

  final List<String> _pageRoutes = [
    '/notes',
    '/documents',
    '/home',
    '/calendar',
    '/payments',
  ];

  final List<String> _pageNames = [
    'Notes',
    'Documents',
    'Home',
    'Calendar',
    'Payments',
  ];
  Future<void> getUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    userEmail = user?.email ??
        ""; // Use the null coalescing operator (??) to provide a default empty string if user?.email is null
    setState(() {}); // Trigger a rebuild to update the UI with the user's email
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    await clearSessionData();
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
          builder: (context) =>
              SignInScreen()), // Replace SignInScreen() with your actual sign-in page
      (Route<dynamic> route) => false,
    );
  }

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialPage;
    getUserData();
  }

  var userEmail = "";

  void _onItemPressed(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final firestore = FirebaseFirestore.instance;
    var storedUid;

    getUserData();
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF114388), // Custom background color
        elevation: 0, // Remove the app bar's shadow
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20), // Custom border radius
          ),
          side: BorderSide(
            color: Color(0xFF114388), // Custom border color
            width: 2, // Custom border width
          ),
        ),
        title: Text(
          _pageNames[_currentIndex],
          style: TextStyle(
            fontSize: 20, // Custom text size
            fontWeight: FontWeight.bold, // Custom font weight
            color: Color(0xFFC69211), // Custom text color
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white, // Custom icon color
          ),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.white, // Custom icon color
            ),
            onPressed: () {
              print("Notifications tapped");
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
               decoration: BoxDecoration(
                color: Color(0xFF114388),
              ),
              accountName: Text('Dali Abdelmlak'), // Display anonymous user
              accountEmail: Text(userEmail),
              currentAccountPicture: CircleAvatar(
                child: Icon(Icons.account_circle),
              ),
            ),
            ListTile(
              title: Text('Logout'),
              onTap: logout,
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          NotesPage(),
          DocumentsPage(),
          HomePage(),
          CalendarPage(),
          PaymentsPage(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Color(0xFF114388), // Updated background color
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.note,
                color: Color(0xFF114388),
              ),
              label: 'Notes',
              activeIcon: Icon(
                Icons.note,
                color: Color(0xFFC69211),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.file_copy,
                color: Color(0xFF114388),
              ),
              label: 'Documents',
              activeIcon: Icon(
                Icons.file_copy,
                color: Color(0xFFC69211),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Color(0xFF114388),
              ),
              label: 'Home',
              activeIcon: Icon(
                Icons.home,
                color: Color(0xFFC69211),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today,
                color: Color(0xFF114388),
              ),
              label: 'Calendar',
              activeIcon: Icon(
                Icons.note,
                color: Color(0xFFC69211),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.payment,
                color: Color(0xFF114388),
              ),
              label: 'Payments',
              activeIcon: Icon(
                Icons.payment,
                color: Color(0xFFC69211),
              ),
            ),
          ],
          onTap: _onItemPressed,
          currentIndex: _currentIndex,
          selectedItemColor: Color(0xFFC69211),
          unselectedItemColor: Color(0xFFC69211),
        ),
      ),
    );
  }
}
