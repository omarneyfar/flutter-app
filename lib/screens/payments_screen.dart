import 'package:flutter/material.dart';

class PaymentsPage extends StatefulWidget {
  @override
  _PaymentsPageState createState() => _PaymentsPageState();
}

class _PaymentsPageState extends State<PaymentsPage> {
  String selectedYear = '2022'; // Default selected year

  List<String> years = ['2022', '2023', '2024']; // List of available years

  Map<String, List<Map<String, dynamic>>> payments = {
    '2022': [
      {
        'semester': 'Semester 1',
        'payments': [
          {'name': 'Scolarity Fee', 'amount': '1000 TND'},
          {'name': 'Scolarity Fee', 'amount': '500 TND>'},
        ],
      },
      {
        'semester': 'Semester 2',
        'payments': [
          {'name': 'Scolarity Fee', 'amount': '900 TND'},
          {'name': 'Scolarity Fee', 'amount': '1500 TND'},
        ],
      },
    ],
    '2023': [
      // Add payments for 2023
    ],
    '2024': [
      // Add payments for 2024
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
              'Payments for $selectedYear',
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
                  itemCount: payments[selectedYear]?.length ?? 0,
                  itemBuilder: (context, index) {
                    final semester = payments[selectedYear]![index]['semester'];
                    final paymentsList = payments[selectedYear]![index]['payments'];

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
                          itemCount: paymentsList.length,
                          itemBuilder: (context, index) {
                            final paymentName = paymentsList[index]['name'];
                            final paymentAmount = paymentsList[index]['amount'];

                            return ListTile(
                              title: Text(paymentName),
                              subtitle: Text(paymentAmount),
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
