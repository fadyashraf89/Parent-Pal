import 'package:flutter/material.dart';
import 'package:parent_pal/models/MyAppBar.dart';
import 'package:parent_pal/models/card_with_image.dart';
import 'package:parent_pal/pages/qa_page.dart';

class ConsultantHomePage extends StatefulWidget {
  @override
  _ConsultantHomePageState createState() => _ConsultantHomePageState();
}

class _ConsultantHomePageState extends State<ConsultantHomePage> {
  final TextEditingController _questionController = TextEditingController();
  List<Map<String, String>> qaData = [];


  int _selectedIndex = 0; // Index for the selected bottom navigation item

  // Define a list of pages corresponding to each bottom navigation item
  static List<Widget> _widgetOptions = <Widget>[
    ConsultantHomePage(), // Placeholder for the current page (ConsultationPage)
    QAPage(), // QAPage to navigate to
    // Add more pages if necessary
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Navigate to the selected page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => _widgetOptions[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8), // Light gray background
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight), // Adjust height if needed
          child: MyAppBar(PageName: "Consultant Home"),
        ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            // Allow scrolling only when content overflows
            physics: ClampingScrollPhysics(), // Prevent unnecessary scrolling
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start, // Align at top
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20.0), // Add spacing

                // Personalized Greeting
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Hello Consultant!',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF5571A7),
                    ),
                  ),
                ),

                SizedBox(height: 20.0), // Add spacing

                // Your Q&A Bar
                Container(
                  width: double.infinity, // Full width
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(
                      color: Color(0xFF5571A7),
                      width: 1, // Adjust border width as needed
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: CircleAvatar(
                              backgroundColor: Color(0xFF5571A7),
                              child: IconButton(
                                icon: Icon(Icons.email_rounded),
                                color: Colors.white,
                                iconSize: 20,
                                onPressed: () {
                                  // Handle button press (optional)
                                },
                              ),
                            ),
                          ),
                          Text(
                            'Your Q&A',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: "Rubik",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_right),
                        color: Color(0xFF5571A7),
                        iconSize: 40,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QAPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20.0), // Add spacing
              ],
            ),
          ),
        ),
      ),
    );
  }
}
