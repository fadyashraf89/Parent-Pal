import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:parent_pal/pages/auth_session.dart';
import 'package:parent_pal/pages/consultation-page.dart';
import 'package:parent_pal/pages/problems_categories.dart';
import 'package:parent_pal/pages/resources.dart';
import 'package:parent_pal/pages/settings.dart';
class FooterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 0.3, color: Color(0xFF5571A7).withOpacity(0.8)),
    ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.home_outlined),
            iconSize: 30,
            color: Color(0xFF5571A7).withOpacity(0.8),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AuthCheck())); // Replace with actual screen
            },
          ),
          IconButton(
            icon: Icon(Icons.article_outlined),
            iconSize: 30,
            color: Color(0xFF5571A7).withOpacity(0.8),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Resources())); // Replace with actual screen
            },
          ),
          IconButton(
            icon: Icon(Icons.child_care),
            iconSize: 30,
            color: Color(0xFF5571A7).withOpacity(0.8),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProblemCategories())); // Replace with actual screen
            },
          ),
          IconButton(
            iconSize: 30,
            color: Color(0xFF5571A7).withOpacity(0.8),
            icon: Icon(Icons.message_outlined),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ConsultationPage())); // Replace with actual screen
            },
          ),
        ],
      ),
    );
  }
}
