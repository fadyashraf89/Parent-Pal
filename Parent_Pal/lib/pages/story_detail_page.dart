import 'package:flutter/material.dart';
import 'package:parent_pal/models/MyAppBar.dart';

class StoryDetailPage extends StatelessWidget {
  final String storyTitle;
  final int numberOfImages = 100;

  StoryDetailPage({required this.storyTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
        Size.fromHeight(kToolbarHeight), // Adjust height if needed
        child: MyAppBar(PageName: storyTitle),
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
