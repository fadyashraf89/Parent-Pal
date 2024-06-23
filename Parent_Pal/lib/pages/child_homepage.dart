import 'package:flutter/material.dart';
import 'package:parent_pal/models/card_with_image.dart';
import 'package:parent_pal/models/footer.dart';

class MyHomePage extends StatelessWidget {
  final String name;
  final int age;
  final String image;

  MyHomePage({super.key, required this.name, required this.age, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FooterWidget(),
      backgroundColor: Color(0xFFF8F8F8), // Light gray background
      appBar: AppBar(
        backgroundColor: Color(0xFF5571A7),
        title: Padding(
          padding: const EdgeInsets.only(left: 100.0),
          child: Text(
            'Home',
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.0), // Add spacing

              // Search bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    contentPadding: const EdgeInsets.all(15.0),
                    hintText: 'Search',
                  ),
                ),
              ),

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
                color: Colors.white,
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
                          Container(
                              child: CardWithImage(
                            title: "Bedtime Stories",
                            description:
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit Vivamus.",
                            image: "assets/images/bedtime-stories.png",
                          )),
                          Container(
                              child: CardWithImage(
                            title: "School Suggestions",
                            description:
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit Vivamus.",
                            image: "assets/images/bedtime-stories.png",
                          )),
                          Container(
                              child: CardWithImage(
                            title: "Family Activities",
                            description:
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit Vivamus.",
                            image: "assets/images/bedtime-stories.png",
                          )),
                          Container(
                              child: CardWithImage(
                            title: "Emergencies",
                            description:
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit Vivamus.",
                            image: "assets/images/bedtime-stories.png",
                          )),
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
