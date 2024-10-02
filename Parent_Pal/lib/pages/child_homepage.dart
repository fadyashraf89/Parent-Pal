import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:parent_pal/models/MyAppBar.dart';
import 'package:parent_pal/models/card_with_image.dart';
import 'package:parent_pal/models/footer.dart';
import 'package:parent_pal/pages/activities.dart';
import 'package:parent_pal/pages/add-child.dart';
import 'package:parent_pal/pages/bedtime_stories_page.dart';
import 'package:parent_pal/pages/edit_profile.dart';
import 'package:parent_pal/pages/emergencies_page.dart';
import 'package:parent_pal/pages/suggest_schools.dart';

class ChildHomePage extends StatefulWidget {
  final String name;
  final String? image; // Accept both File and String

  ChildHomePage({Key? key, required this.name, required this.image}) : super(key: key);

  @override
  _ChildHomePageState createState() => _ChildHomePageState();
}

class _ChildHomePageState extends State<ChildHomePage> {
  String _userName = '';
  String _image = ''; // Updated to store URL from Firebase

  @override
  void initState() {
    super.initState();
    _userName = widget.name;
    _getCurrentUserName();
    _getCurrentImage(); // Fetch initial image from Firebase
  }

  void _getCurrentUserName() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .get();
      Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
      setState(() {
        _userName = "${userData['firstName']} ${userData['lastName']}";
      });
    }
  }

  void _getCurrentImage() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .get();
      Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
      setState(() {
        _image = userData['profileImage'] ?? ''; // Update _image with profileImage URL
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FooterWidget(),
      backgroundColor: Color(0xFFF8F8F8), // Light gray background
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        // Adjust height if needed
        child: MyAppBar(PageName: "Home"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.0), // Add spacing

              // **Top Section**
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle, // Set the shape to circle
                  border: Border.all( // Define border properties
                    width: 2.0, // Border thickness
                    color: Colors.grey, // Border color
                  ),
                ),
                child: ClipOval( // Use ClipOval to clip overflowing content
                  child: widget.image != null
                      ? (widget.image!.startsWith('assets/')
                      ? Image.asset(
                    widget.image!,
                    width: 185.0, // Adjust image width as needed
                    height: 185.0, // Adjust image height as needed
                    fit: BoxFit.cover, // Ensure image fills the container
                  )
                      : Image.file(
                    File(widget.image!),
                    width: 185.0, // Adjust image width as needed
                    height: 185.0, // Adjust image height as needed
                    fit: BoxFit.cover, // Ensure image fills the container
                  ))
                      : Icon(Icons.person, size: 185.0), // Fallback to icon
                ),
              ),
              SizedBox(height: 20.0), // Add spacing

              // **Body Section**
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Hello, $_userName  ",
                                // Include spaces for better formatting
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(
                                      0xFF5571A7), // Adjust based on actual color
                                ),
                              ),
                              CircleAvatar(
                                backgroundColor: Color(0xFF5571A7),
                                radius: 13,
                                child: IconButton(
                                  icon: Icon(Icons.edit),
                                  color: Colors.white,
                                  iconSize: 10,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProfilePage(updateNameCallback: _updateUserName))); // Replace with actual screen
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: CircleAvatar(
                                  backgroundColor: Color(0xFF5571A7),
                                  radius: 13,
                                  child: IconButton(
                                    icon: Icon(Icons.add),
                                    color: Colors.white,
                                    iconSize: 11,
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AddChildPage())); // Replace with actual screen
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      SizedBox(height: 10.0), // Add spacing

                      GridView.count(
                        crossAxisCount: 2,
                        // Adjust for number of columns
                        shrinkWrap: true,
                        // Prevent grid from expanding
                        physics: NeverScrollableScrollPhysics(),
                        // Disable scrolling if needed
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => StoryListPage()),
                              );
                            },
                            child: CardWithImage(
                              title: "Bedtime Stories",
                              image: "assets/images/bedtime-stories.png",
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SchoolsMap()),
                              );
                            },
                            child: CardWithImage(
                              title: "School Suggestions",
                              image: "assets/images/school.png",
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ActivitiesScreen()),
                              );
                            },
                            child: CardWithImage(
                              title: "Family Activities",
                              image: "assets/images/activities.png",
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => EmergencyReference()),
                              );
                            },
                            child: CardWithImage(
                              title: "Emergency Reference",
                              image: "assets/images/emergency.png",
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _updateUserName(String newName) {
    setState(() {
      _userName = newName;
    });
  }
}
