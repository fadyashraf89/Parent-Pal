import 'package:flutter/material.dart';
import 'package:parent_pal/models/MyAppBar.dart';
import 'package:parent_pal/models/card_with_image.dart';
import 'package:parent_pal/models/footer.dart';
import 'package:parent_pal/models/title_card.dart';
import 'package:parent_pal/pages/articles.dart';
import 'package:parent_pal/pages/common_issues_among_children.dart';
import 'package:parent_pal/pages/problems_facing_children.dart';
import 'package:parent_pal/pages/problems_facing_parents.dart';
import 'package:parent_pal/pages/special_issues.dart';
import 'package:parent_pal/pages/videos.dart';

class Resources extends StatelessWidget {
  Resources({super.key});

  final List<String> ResourceTitles = [
    "Articles",
    "Videos",
  ];
  final List<String> images = [
    "assets/images/articles.png",
    "assets/images/videos.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FooterWidget(),
      backgroundColor: Color(0xFFF8F8F8), // Light gray background
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight), // Adjust height if needed
        child: MyAppBar(PageName: "Parental Resources"),
      ),
      body: Expanded(
        child: ListView.builder(
          itemCount: ResourceTitles.length,
          shrinkWrap: true, // Prevent list view from expanding
          physics: NeverScrollableScrollPhysics(), // Disable scrolling
          itemBuilder: (context, index) => Container(
            height: (MediaQuery.of(context).size.height / 2) - 65, // Set card height to half screen
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CardWithImage(
                title: ResourceTitles[index],
                image: images[index],
                onTap: () => _navigateToPage(context, index),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToPage(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Articles()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Videos()), // Replace with actual screen
        );
        break;
    }
  }
}
