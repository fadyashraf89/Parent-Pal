import 'package:flutter/material.dart';

class TitleCard extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  TitleCard({required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton( // Use TextButton instead of Container
      onPressed: onTap,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(15.0),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        side: BorderSide(
          color: Colors.grey.withOpacity(0.2), // Optional border
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text(
                  textAlign: TextAlign.center,
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5571A7),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
