import 'package:flutter/material.dart';

class AboutParentPal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About Parent Pal',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black), // Change back icon color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display the logo or a representative image
            Center(
              child: Image.asset(
                'assets/parent.png',
                height: 100,
              ),
            ),
            SizedBox(height: 20),
            // Title
            Center(
              child: Text(
                'Parent Pal',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 20),
            // Description
            Text(
              'ParentPal is a dedicated application designed to support parents through their parenting journey. Whether you are a new parent or experienced, ParentPal provides resources, tools, and a community to help you every step of the way.',
              style: TextStyle(fontSize: 16, color: Colors.grey[800]),
            ),
            SizedBox(height: 20),
            Text(
              'Features include:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '• Parenting tips and advice\n'
              '• Tools to manage your child’s activities and schedules\n'
              '• Community forums for sharing experiences and asking questions\n'
              '• Expert articles and resources\n'
              '• And much more...',
              style: TextStyle(fontSize: 16, color: Colors.grey[800]),
            ),
            SizedBox(height: 20),
            Text(
              'We are here to help you become the best parent you can be. Welcome to ParentPal!',
              style: TextStyle(fontSize: 16, color: Colors.grey[800]),
            ),
          ],
        ),
      ),
    );
  }
}
