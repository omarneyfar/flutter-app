import 'package:flutter/material.dart';
import './notes_screen.dart';
import './documents_screen.dart';
import './payments_screen.dart';
import './time_calendar_screen.dart';
import './home_screen.dart';

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

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialPage;
  }

  void _onItemPressed(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (context) {
            return Scaffold(
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
                    // Handle sidebar icon tap
                    // Open your sidebar or perform any desired action
                  },
                ),
                actions: [
                  IconButton(
                    icon: Icon(
                      Icons.notifications,
                      color: Colors.white, // Custom icon color
                    ),
                    onPressed: () {
                      // Handle notification icon tap
                      // Open notifications or perform any desired action
                    },
                  ),
                ],
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
          },
        );
      },
    );
  }
}
