import 'package:flutter/material.dart';
import 'package:parent_pal/models/topic_card.dart';
import 'package:parent_pal/models/footer.dart';

class EmergenciesPage extends StatefulWidget {
  @override
  _EmergenciesPageState createState() => _EmergenciesPageState();
}

class _EmergenciesPageState extends State<EmergenciesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FooterWidget(),
      backgroundColor: Color(0xFFF8F8F8), // Light gray background
      appBar: AppBar(
        backgroundColor: Color(0xFF5571A7),
        title: Padding(
          padding: const EdgeInsets.only(left: 50.0),
          child: Text(
            'Emergency Reference',
            style: TextStyle(
              fontSize: 22,
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
                IconButton(
                  icon: Icon(Icons.warning_amber_rounded),
                  color: Color(0xFF5571A7),
                  iconSize: 90,
                  onPressed: () {
                    // Handle button press (optional)
                  },
                ),

                SizedBox(height: 10.0), // Add spacing

                // **Our Experts Section - List View**
                ListView.builder(

                  shrinkWrap: true, // Prevent list view from expanding
                  physics: NeverScrollableScrollPhysics(), // Disable scrolling
                  itemCount: 10, // Adjust for number of topics
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 20.0), // Add spacing below
                    child: TopicCard(
                      title: 'Lorem Ipsum',
                      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus semper justo et maximus volutpat. Nulla vel porta augue, sit amet varius lacus. Vivamus orci nunc, mattis lacinia orci quis, pretium.',
                    ),
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

