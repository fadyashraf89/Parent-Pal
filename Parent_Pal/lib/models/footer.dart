import 'package:flutter/material.dart';
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
              // Handle home button press
            },
          ),
          IconButton(
            icon: Icon(Icons.search_outlined),
            iconSize: 30,
            color: Color(0xFF5571A7).withOpacity(0.8),
            onPressed: () {
              // Handle search button press
            },
          ),
          IconButton(
            iconSize: 30,
            color: Color(0xFF5571A7).withOpacity(0.8),
            icon: Icon(Icons.message_outlined),
            onPressed: () {
              // Handle message button press
            },
          ),
          IconButton(
            iconSize: 30,
            color: Color(0xFF5571A7).withOpacity(0.8),
            icon: Icon(Icons.settings_outlined),
            onPressed: () {
              // Handle settings button press
            },
          ),
        ],
      ),
    );
  }
}
