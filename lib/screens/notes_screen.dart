import 'package:flutter/material.dart';

class NotesPage extends StatefulWidget {
  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  String selectedYear = '2024'; // Default selected year

  List<String> years = ['2022', '2023', '2024']; // List of available years

  Map<String, List<Map<String, dynamic>>> notes = {
    '2022': [],
    '2023': [
      {
        'semester': 'Semester 1',
        'subjects': [
          {
            'name': 'Engineer Mathematics',
            'notes': [
              {'title': 'Note 1', 'details': 'Details about Note 1'},
              {'title': 'Note 2', 'details': 'Details about Note 2'},
              {'title': 'Note 3', 'details': 'Details about Note 3'},
            ],
          },
          {
            'name': 'Angular',
            'notes': [
              {'title': 'Note 4', 'details': 'Details about Note 4'},
              {'title': 'Note 5', 'details': 'Details about Note 5'},
              {'title': 'Note 6', 'details': 'Details about Note 6'},
            ],
          },
        ],
      },
      {
        'semester': 'Semester 2',
        'subjects': [
          {
            'name': 'Web Components',
            'notes': [
              {'title': 'Note 7', 'details': 'Details about Note 7'},
              {'title': 'Note 8', 'details': 'Details about Note 8'},
              {'title': 'Note 9', 'details': 'Details about Note 9'},
            ],
          },
          {
            'name': 'UML',
            'notes': [
              {'title': 'Note 10', 'details': 'Details about Note 10'},
              {'title': 'Note 11', 'details': 'Details about Note 11'},
              {'title': 'Note 12', 'details': 'Details about Note 12'},
            ],
          },
        ],
      },
    ],
    '2024': [  
      {
        'semester': 'Semester 1',
        'subjects': [
          {
            'name': 'Engineer Mathematics',
            'notes': [
              {'title': 'Note 1', 'details': 'Details about Note 1'},
              {'title': 'Note 2', 'details': 'Details about Note 2'},
              {'title': 'Note 3', 'details': 'Details about Note 3'},
            ],
          },
          {
            'name': 'Angular',
            'notes': [
              {'title': 'Note 4', 'details': 'Details about Note 4'},
              {'title': 'Note 5', 'details': 'Details about Note 5'},
              {'title': 'Note 6', 'details': 'Details about Note 6'},
            ],
          },
        ],
      },
      {
        'semester': 'Semester 2',
        'subjects': [
          {
            'name': 'Web Components',
            'notes': [
              {'title': 'Note 7', 'details': 'Details about Note 7'},
              {'title': 'Note 8', 'details': 'Details about Note 8'},
              {'title': 'Note 9', 'details': 'Details about Note 9'},
            ],
          },
          {
            'name': 'UML',
            'notes': [
              {'title': 'Note 10', 'details': 'Details about Note 10'},
              {'title': 'Note 11', 'details': 'Details about Note 11'},
              {'title': 'Note 12', 'details': 'Details about Note 12'},
            ],
          },
        ],
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              padding: EdgeInsets.symmetric(horizontal: 50),
              decoration: BoxDecoration(
                color: Color(0xFFC69211),
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedYear,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedYear = newValue!;
                    });
                  },
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Color(0xFF114388), // Change the arrow color here
                  ),
                  items: years.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF114388),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Notes for $selectedYear',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListView.builder(
                  itemCount: notes[selectedYear]?.length ?? 0,
                  itemBuilder: (context, index) {
                    final semester = notes[selectedYear]![index]['semester'];
                    final subjects = notes[selectedYear]![index]['subjects'];

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 16.0,
                          ),
                          child: Text(
                            semester,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: subjects.length,
                          itemBuilder: (context, index) {
                            final subject = subjects[index]['name'];
                            final subjectNotes = subjects[index]['notes'];

                            return ExpansionTile(
                              title: Text(
                                subject,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              collapsedTextColor: Color(0xFF114388),
                              collapsedIconColor: Color(0xFF114388), // Yellow color when collapsed
                              textColor: Color(0xFFC69211),
                              iconColor: Color(0xFFC69211),
                              children: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: subjectNotes.length,
                                  itemBuilder: (context, index) {
                                    final noteTitle =
                                        subjectNotes[index]['title'];
                                    final noteDetails =
                                        subjectNotes[index]['details'];

                                    return ListTile(
                                      title: Text(noteTitle),
                                      subtitle: Text(noteDetails),
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
