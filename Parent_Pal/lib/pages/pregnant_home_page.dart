import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:parent_pal/models/MyAppBar.dart';
import 'package:parent_pal/models/card_with_image.dart';
import 'package:parent_pal/models/footer.dart';
import 'package:parent_pal/pages/add-child.dart';
import 'package:parent_pal/pages/birth_education.dart';
import 'package:parent_pal/pages/calm_journey.dart';
import 'package:parent_pal/pages/edit_profile.dart';
import 'package:parent_pal/pages/nutrition.dart';
import 'package:parent_pal/pages/pregnancy_emergencies.dart';

class PregnantHomePage extends StatefulWidget {
  final String name;

  PregnantHomePage({Key? key, required this.name}) : super(key: key);

  @override
  State<PregnantHomePage> createState() => _PregnantHomePageState();
}

class _PregnantHomePageState extends State<PregnantHomePage> {
  String _userName = '';

  @override
  void initState() {
    super.initState();
    _userName = widget.name;
    _getCurrentUserName();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FooterWidget(),
      backgroundColor: Color(0xFFF8F8F8),
      // Light gray background
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        // Adjust height if needed
        child: MyAppBar(PageName: "Home"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          // Disable scrolling if needed
          child: Column(
            children: [
              SizedBox(height: 20.0), // Add spacing

              // **Top Section**
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  // Set the shape to rectangle
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  // Add rounded corners
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 2), // Bottom shadow
                    ),
                  ],
                ),
                child: ClipRRect(
                  // Use ClipRRect to clip overflowing content
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  // Add rounded corners again for clipping
                  child: Image.asset(
                    "assets/images/iStock-867369446.jpg",
                    width: 290.0, // Adjust image width as needed
                    height: 220.0, // Adjust image height as needed
                    fit: BoxFit.cover, // Ensure image fills the container
                  ),
                ),
              ),
              SizedBox(height: 30.0), // Add spacing

              // **Body Section**
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  // Add padding for better spacing
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Hello, $_userName ",
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
                                          builder: (context) => ProfilePage(updateNameCallback: _updateUserName)),
                                    );
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
                                            builder: (context) => AddChildPage()),
                                      );
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
                                MaterialPageRoute(builder: (context) => Nutrition()),
                              );
                            },
                            child: CardWithImage(
                              title: "Nutrition Tips",
                              image: "assets/images/istockphoto-1320094414-612x612.jpg",
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => CalmJourney()),
                              );
                            },
                            child: CardWithImage(
                              title: "Calm Journey",
                              image: "assets/images/Screenshot (191).png",
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => BirthEducation()),
                              );
                            },
                            child: CardWithImage(
                              title: "Birth Education",
                              image: "assets/images/Screenshot (187).png",
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => PregnancyEmergencies()),
                              );
                            },
                            child: CardWithImage(
                              title: "Pregnancy Emergencies",
                              image: "assets/images/Screenshot (190).png",
                            ),
                          ),
                        ],
                      ),
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
