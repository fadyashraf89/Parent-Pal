import 'package:flutter/material.dart';
import 'package:parent_pal/models/MyAppBar.dart';
import 'package:parent_pal/models/card_with_image.dart';
import 'package:parent_pal/models/footer.dart';
import 'package:parent_pal/models/title_card.dart'; // Updated TitleCard

class ParentsProblems extends StatelessWidget {
  ParentsProblems({super.key});

  final List<String> problemTitles = [
    "Media and Technology Influence",
    "Peer Pressure and Social Media",
    "Time Constraints",
    "Educational and Cultural Challenges",
    "Financial Pressures",
    "Parental Communication and Understanding",
    "Behavioral Correction",
    "Educational Guidance",
    "Negative Societal Influences",
    "Lack of Parental Awareness",
  ];

  final List<String> DescriptionTitle = [
    // Add descriptions for each problem here
    "Balancing Children's Exposure to Electronic Screens and Mobile Technology with Healthy Activities:",
    "Dealing with Negative Influences from Peers and Social Media Platforms:",
    "Finding Sufficient Time to Spend with Children Amid Busy Schedules and Societal Demands: ",
    "Teaching Children Values and Ethics in a Rapidly Changing World with Diverse Cultural Influences:",
    "Coping with Financial Pressures that Affect Parenting and Family Dynamics: ",
    "Establishing Trust and Effective Communication Channels with Children, Especially During Adolescence:",
    "Correcting Inappropriate Behavior Influenced by External Factors Like Media and Social Environments: ",
    "Providing Proper Guidance and Support in Educational and Career Decisions:",
    "Protecting Children from Negative Societal Behaviors and Beliefs:",
    "Addressing Challenges Due to Parents' Lack of Awareness or Understanding of Modern Parenting Techniques:",
  ];
  final List<String> bla = [
    // Add descriptions for each problem here
    "Excessive screen time can lead to issues like poor eyesight, obesity, and developmental delays. Parents need to find a balance to ensure their children engage in physical activities and social interactions Excessive screen time can lead to issues like poor eyesight, obesity, and developmental delays. Parents need to find a balance to ensure their children engage in physical activities and social interactions.",
    "Parents must be vigilant about their children’s online activities and the influence of their peer groups. Educating children about the potential dangers and promoting positive online behavior is essential.",
    "Balancing work, household responsibilities, and quality time with children is a significant challenge. Parents must prioritize and manage their time effectively to foster strong family bonds",
    "The dynamic nature of modern society requires parents to continuously adapt their parenting strategies to instill lasting values and ethics in their children.",
    "Economic stress can strain family relationships and impact a parent’s ability to provide for their children’s needs. Managing finances and seeking support when necessary is crucial for maintaining a stable family environment.",
    "Open and honest communication is key to building trust with children. Parents need to create a safe space for their children to express themselves without fear of judgment.",
    "Parents must address behavioral issues promptly and effectively, considering the external influences that may contribute to these behaviors.",
    "Parents play a critical role in shaping their children’s academic and career paths. Offering informed guidance and support helps children make sound decisions about their future.",
    "Exposure to negative societal influences can affect a child’s values and behavior. Parents must actively guide their children and instill positive beliefs and behaviors.",
    "Continuous learning and adaptation are essential for effective parenting. Parents must stay informed about new parenting strategies and techniques to address their children’s evolving needs.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FooterWidget(),
      backgroundColor: Color(0xFFF8F8F8),
      // Light gray background
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        // Adjust height if needed
        child: MyAppBar(PageName: "Parents Problems"),
      ),
      body: ListView.builder(
        itemCount: problemTitles.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 10.0),
          child: TitleCard(
            title: problemTitles[index],
            onTap: () => _showBottomSheet(context, index),
          ),
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context, int index) {
    showModalBottomSheet(
      enableDrag: true,
      backgroundColor: Color(0xFF5571A7),
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Container(
              child: Text(
                DescriptionTitle[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color(0xFFF8F8F8),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6.0),
              child: Container(
                child: Text(
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFF8F8F8),
                  ),
                  bla[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
