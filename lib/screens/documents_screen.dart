import 'package:flutter/material.dart';

class Document {
  final String type;
  final bool urgent;
  final String justification;

  Document({
    required this.type,
    required this.urgent,
    required this.justification,
  });
}

class DocumentsPage extends StatefulWidget {
  @override
  _DocumentsPageState createState() => _DocumentsPageState();
}

class _DocumentsPageState extends State<DocumentsPage> {
  List<Document> documents = [];
  String? selectedDocumentType;
  bool isUrgent = false;
  String justification = '';

  List<String> documentTypes = [
    'Type 1',
    'Type 2',
    'Type 3',
  ];

  @override
  Widget build(BuildContext context) {
   return Scaffold(
  body: Padding(
    padding: EdgeInsets.only(top: 0),
    child: ListView.builder(
      padding: EdgeInsets.only(top: 20),
      itemCount: documents.length,
      itemBuilder: (context, index) {
        final document = documents[index];

        return ListTile(
          title: Text(
            document.type,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color:Color(0xFFC69211),
              // Add any other desired text styles
            ),
          ),
          subtitle: Text(
            document.urgent ? "Urgent" : 'Not urgent',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              // Add any other desired text styles
            ),
          ),
          trailing: Text(
            document.justification,
            style: TextStyle(
              color: Color(0xFF114388),
              // Add any other desired text styles
            ),
          ),
        );
      },
    ),
  ),
  floatingActionButton: FloatingActionButton(
    onPressed: () {
      _showAddDocumentDialog(context);
    },
    child: Icon(Icons.add),
    backgroundColor: Color(0xFF114388),
  ),
);
  }

  void _showAddDocumentDialog(BuildContext context) async {
    selectedDocumentType = null;
    isUrgent = false;
    justification = '';

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
        child:StatefulBuilder(
          builder:(BuildContext context, StateSetter setState) {
   
        return GestureDetector(
          onTap: () {
            // Dismiss the keyboard when tapping outside the text fields
            FocusScope.of(context).unfocus();
          },
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Add Document Request',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFC69211),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Type',
                            style: TextStyle(
                              color: Color(0xFF114388),
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                               
                                color: Color.fromARGB(255, 212, 212, 212),
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: DropdownButton<String>(
                                value: selectedDocumentType,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedDocumentType = newValue;
                                  });
                                },
                                items: documentTypes.map<DropdownMenuItem<String>>(
                                  (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(
                                           fontFamily: "Poppins",
                                           fontSize: 14,
                                        ),
                                      ),
                                    );
                                  },
                                ).toList(),
                                dropdownColor: Color(0xFFD1D1D1),
                                underline: SizedBox(),
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: Color(0xFFD1D1D1),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Urgent',
                        style: TextStyle(
                          color: Color(0xFF114388),
                          fontSize: 16,
                        )),
                        SizedBox(height: 15),
                        ToggleButtonsTheme(
                          data: ToggleButtonsThemeData(
                            fillColor: Color(0xFFC69211), // Set the background color for the selected option
                            borderRadius: BorderRadius.circular(15.0), // Set the border radius
                            selectedColor: Color(0xFF114388),
                            color: Colors.grey,
                          ),
                          child: ToggleButtons(
                            children: <Widget>[
                              Icon(Icons.check),
                              Icon(Icons.close),
                              
                            ],
                            
                            onPressed: (int index) {
                              setState(() {
                                isUrgent = index == 0;
                              });
                            },
                            isSelected: [isUrgent, !isUrgent],
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
                
                SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Justification',
                          style: TextStyle(
                            color: Color(0xFF114388),
                            fontSize: 16,
                          )),
                          SizedBox(height: 15),
                        
                          TextField(
                            
                            onChanged: (value) {
                              setState(() {
                                justification = value;
                              });
                            },
                            style:  TextStyle(fontSize: 14, color: Colors.black, fontFamily: "Poppins"),
                            keyboardType: TextInputType.name,
                            cursorColor: Colors.black,       
                            decoration: InputDecoration(
                              
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red, width: 3),
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFFD1D1D1), width: 1),
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                ),
                                labelStyle: TextStyle(
                                  color: Color(0xFFD1D1D1),
                                ),
                                hintStyle: TextStyle(
                                  color: Color(0xFFD1D1D1),
                                ),// Set the border radius
                             contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 17),

                            ),
                          ),
                          SizedBox(height: 30),
                        ],
                      ),
                    ),
                    
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: (selectedDocumentType != null && justification.isNotEmpty)
                          ? () {
                              final document = Document(
                                type: selectedDocumentType!,
                                urgent: isUrgent,
                                justification: justification,
                              );
                              setState(() {
                                documents.add(document);
                              });

                              // Dismiss the keyboard before closing the dialog
                              FocusScope.of(context).unfocus();
                              Navigator.pop(context);
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        primary: (selectedDocumentType != null && justification.isNotEmpty)
                            ? Color(0xFFC69211) // Active button background color
                            : Colors.grey, // Inactive button background color
                        onPrimary: Colors.white, // Text color for both active and inactive states
                      ),
                      child: Text('Validate'),
                    ),


                    SizedBox(width: 8),
                    TextButton(
                      onPressed: () {
                        // Dismiss the keyboard before closing the dialog
                        FocusScope.of(context).unfocus();
                        Navigator.pop(context);
                      },
                      child: Text('Cancel',
                      style: TextStyle(
                        color: Color(0xFF114388)
                      ),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }
    ),
  );
},
  ).then((_) {
    setState(() {}); // Trigger a rebuild after closing the dialog
  });
  }
}