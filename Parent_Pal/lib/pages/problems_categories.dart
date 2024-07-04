import 'package:flutter/material.dart';
import 'package:parent_pal/models/MyAppBar.dart';
import 'package:parent_pal/models/footer.dart';
import 'package:parent_pal/models/title_card.dart';
import 'package:parent_pal/pages/common_issues_among_children.dart';
import 'package:parent_pal/pages/problems_facing_children.dart';
import 'package:parent_pal/pages/problems_facing_parents.dart';
import 'package:parent_pal/pages/special_issues.dart';

class ProblemCategories extends StatelessWidget {
   ProblemCategories({super.key});

  final List<String> problemTitles = [
    "Some Problems Facing Children",
    "Some Problems Facing Parents",
    "Common Issues Among Children",
    "Special Issues and Conditions Requiring Community Support for Children",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FooterWidget(),
      backgroundColor: Color(0xFFF8F8F8), // Light gray background
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight), // Adjust height if needed
        child: MyAppBar(PageName: "Problem Categories"),
      ),
      body: ListView.builder(
        itemCount: problemTitles.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(left: 60.0, right: 60.0, top: 20.0),
          child: TitleCard(
            title: problemTitles[index],
            onTap: () => _navigateToPage(context, index),
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
          MaterialPageRoute(builder: (context) => ChildrenProblems()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ParentsProblems()), // Replace with actual screen
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CommonIssues()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SpecialIssues()), // Replace with actual screen
        );
        break;
    }
  }
}

class SpecialNeeds {
}
