import 'package:flutter/material.dart';
import 'package:parent_pal/models/MyAppBar.dart';
import 'package:parent_pal/models/card_with_image.dart';
import 'package:parent_pal/models/footer.dart';
import 'package:parent_pal/pages/activities.dart';
import 'package:parent_pal/pages/bedtime_stories_page.dart';
import 'package:parent_pal/pages/emergencies_page.dart';
import 'package:parent_pal/pages/suggest_schools.dart';

class ChildHomePage extends StatelessWidget {
  final String name;
  final int age;
  final String image;

  ChildHomePage({super.key, required this.name, required this.age, required this.image});

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
                  child: Image.asset(
                    image, // Verify the image path is correct
                    width: 185.0, // Adjust image width as needed
                    height: 185.0, // Adjust image height as needed
                    fit: BoxFit.cover, // Ensure image fills the container
                  ),
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
                                "$name ($age years) ",
                                // Include spaces for better formatting
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(
                                      0xFF5571A7), // Adjust based on actual color
                                ),
                              ),
                              CircleAvatar(
                                backgroundColor: Color(
                                    0xFF5571A7),
                                radius: 13,
                                child: IconButton(
                                  icon: Icon(Icons.edit),
                                  color: Colors.white,
                                  iconSize: 10,
                                  onPressed: () {
                                    // Handle button press (optional)
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: CircleAvatar(
                                  backgroundColor: Color(
                                      0xFF5571A7),
                                  radius: 13,
                                  child: IconButton(
                                    icon: Icon(Icons.add),
                                    color: Colors.white,
                                    iconSize: 11,
                                    onPressed: () {
                                      // Handle button press (optional)
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
                              title: "Emergencies",
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
}


