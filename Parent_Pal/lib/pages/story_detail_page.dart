import 'package:flutter/material.dart';

class StoryDetailPage extends StatelessWidget {
  final String storyTitle;
  final int numberOfImages; // Number of images you want to display

  StoryDetailPage({required this.storyTitle, this.numberOfImages = 30});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(storyTitle),
      ),
      body: ListView.builder(
        itemCount: numberOfImages,
        itemBuilder: (context, index) {
          // Assuming your images are named in the pattern '1.jpg', '2.jpg', etc.
          String imagePath = 'assets/images/Stories/catch-the-cat/${index + 1}.jpg';
          return Image.asset(
            imagePath,
            errorBuilder: (context, error, stackTrace) {
              // Display a placeholder or error message if the image fails to load
              return Center(child: Text('Image not found: $imagePath'));
            },
          );
        },
      ),
    );
  }
}
