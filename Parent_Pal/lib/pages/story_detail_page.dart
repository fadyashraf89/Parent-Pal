import 'package:flutter/material.dart';

class StoryDetailPage extends StatelessWidget {
  final String storyTitle;
  final int numberOfImages = 50;

  StoryDetailPage({required this.storyTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(storyTitle),
      ),
      body: ListView.builder(
        itemCount: numberOfImages,
        itemBuilder: (context, index) {
          String imagePath = 'assets/images/Stories/$storyTitle/${index + 1}.jpg';
          return Image.asset(
            imagePath,
            errorBuilder: (context, error, stackTrace) {
              return Center();
            },
          );
        },
      ),
    );
  }
}
