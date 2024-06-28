import 'package:flutter/material.dart';
import 'story_detail_page.dart';

class StoryListPage extends StatelessWidget {
  final List<Map<String, String>> stories = [
    {
      "title": "Catch That Cat!",
      "description": "A cat is stealing socks from a boy! Can he catch her, and get his socks back?",
      "cover": "assets/images/Stories/Catch-That-Cat.jpg", // Updated to relative path
    },
    // Add more stories here if needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bedtime Stories'),
      ),
      body: ListView.builder(
        itemCount: stories.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Image.asset(
                stories[index]["cover"]!,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.error, size: 50); // Fallback if image fails to load
                },
              ),
              title: Text(stories[index]["title"]!),
              subtitle: Text(stories[index]["description"]!),
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StoryDetailPage(storyTitle: stories[index]["title"]!),
                    ),
                  );
                },
                child: Text('Read'),
              ),
            ),
          );
        },
      ),
    );
  }
}
