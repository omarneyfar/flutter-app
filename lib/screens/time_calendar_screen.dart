import 'package:flutter/material.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final Map<String, List<String>> timetable = {
    'Monday': ['8:00 AM - Math', '12:00 PM - Physics', '4:00 PM - Computer Science'],
    'Tuesday': ['10:00 AM - Computer Science', '2:00 PM - Math'],
    'Wednesday': ['8:00 AM - Physics', '12:00 PM - Computer Science'],
    'Thursday': ['10:00 AM - Math', '4:00 PM - Math'],
    'Friday': ['10:00 AM - Computer Science', '2:00 PM - Computer Science'],
  };

  List<bool> _expandedList = List.filled(5, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        
        child: ListView.builder(
          padding: const EdgeInsets.only(top:30.0,left: 16.0,right: 16.0,bottom: 16.0),
          itemCount: timetable.keys.length,
          itemBuilder: (context, index) {
            final day = timetable.keys.toList()[index];
            final subjects = timetable[day]!;

            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ExpansionTile(
                collapsedTextColor: Color(0xFF114388),
                collapsedIconColor: Color(0xFF114388), // Yellow color when collapsed
                textColor: Color(0xFFC69211),
                iconColor: Color(0xFFC69211),                
                title: Text(
                  day,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  
                  ),
                ),
                children: subjects.map((subject) => ListTile(
                  title: Text(subject),
                )).toList(),
                onExpansionChanged: (expanded) {
                  setState(() {
                    _expandedList[index] = expanded;
                  });
                },
                initiallyExpanded: _expandedList[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
