import 'package:flutter/material.dart';
import 'package:parent_pal/models/card_with_image.dart';
import 'package:parent_pal/models/footer.dart';
import 'package:parent_pal/pages/QAConsultantPage.dart';

class ConsultantHomePage extends StatefulWidget {
  @override
  _ConsultantHomePageState createState() => _ConsultantHomePageState();
}

class _ConsultantHomePageState extends State<ConsultantHomePage> {
  final TextEditingController _questionController = TextEditingController();
  List<Map<String, String>> qaData = [];

  void _submitQuestion() {
    if (_questionController.text.isNotEmpty) {
      setState(() {
        qaData.add({
          "date": DateTime.now().toString(),
          "question": _questionController.text,
          "answer": "",
        });
        _questionController.clear();
      });
    }
  }

  int _selectedIndex = 0; // Index for the selected bottom navigation item

  // Define a list of pages corresponding to each bottom navigation item
  static List<Widget> _widgetOptions = <Widget>[
    ConsultantHomePage(), // Placeholder for the current page (ConsultationPage)
    QAConsultantPage(qaData: [],), // QAPage to navigate to
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
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_answer),
            label: 'Q&A',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue, // Adjust as needed
        onTap: _onItemTapped,
      ),
      backgroundColor: Color(0xFFF8F8F8), // Light gray background
      appBar: AppBar(
        backgroundColor: Color(0xFF5571A7),
        title: Padding(
          padding: const EdgeInsets.only(left: 50.0),
          child: Text(
            'Consultation',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Image.asset(
            "assets/images/app-logo.png",
            width: 50,
            height: 50,
          ),
        ),
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
                              builder: (context) => QAConsultantPage(qaData: qaData),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  width: double.infinity, // Full width
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(0, 2), // Bottom shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'What\'s your question?',
                        style: TextStyle(
                            fontFamily: "Rubik",
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF5571A7)),
                      ),
                      SizedBox(height: 10.0),
                      TextField(
                        controller: _questionController,
                        maxLines: 5, // Allow multiple lines for input
                        decoration: InputDecoration(
                          hintText: 'Type your question here...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      ElevatedButton(
                        onPressed: _submitQuestion,
                        child: Text('Ask Question',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Rubik",
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50),
                          backgroundColor: Color(0xFF5571A7),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20.0), // Add spacing

                Text(
                  'Our Experts',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF5571A7)),
                ),

                SizedBox(height: 10.0), // Add spacing

                GridView.builder(
                  shrinkWrap: true,
                  // Prevent grid view from expanding
                  physics: NeverScrollableScrollPhysics(),
                  // Disable scrolling
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Adjust for number of columns
                    crossAxisSpacing: 10.0, // Spacing between columns
                    mainAxisSpacing: 10.0, // Spacing between rows
                    childAspectRatio:
                    1, // Aspect ratio of each card (width/height)
                  ),
                  itemCount: 6,
                  // Adjust for number of experts
                  itemBuilder: (context, index) => CardWithImage(
                    title: 'Dr. Robert Andreson',
                    image: "assets/images/avatar.png",
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