import 'package:flutter/material.dart';
import 'package:parent_pal/models/MyAppBar.dart';
import 'story_detail_page.dart';

class StoryListPage extends StatelessWidget {
  final List<Map<String, String>> stories = [
    {
      "title": "Catch-That-Cat",
      "description":
          "A cat is stealing socks from a boy! Can he catch her, and get his socks back?",
      "cover": "assets/images/Stories/Catch-That-Cat.jpg",
      // Updated to relative path
    },
    {
      "title": "Dive-short",
      "description": "Join a nature-loving boy on his big diving adventure!",
      "cover": "assets/images/Stories/Dive-short.jpg",
      // Updated to relative path
    },
    {
      "title": "Kokoro-short",
      "description":
          "Everybody loves Kokoro. When an accident happens, will the love of a village pull her through?",
      "cover": "assets/images/Stories/Kokoro-short.jpg",
      // Updated to relative path
    },
    {
      "title": "Monkey-Business",
      "description":
          "What is the most important job in the jungle? The monkeys will show you!",
      "cover": "assets/images/Stories/Monkey-Business.jpg",
      // Updated to relative path
    },
    {
      "title": "Tiny-Mermaid",
      "description":
          "Tiny Mermaid discovers an island of plastic that is hurting her ocean friends.",
      "cover": "assets/images/Stories/Tiny-Mermaid.jpg",
      // Updated to relative path
    },
    {
      "title": "The-Smart-Frog",
      "description":
          "When a little boy doesn't read enough, the letters fall out of his book. A smart frog uses them to learn how to read!",
      "cover": "assets/images/Stories/The-Smart-Frog.jpg",
      // Updated to relative path
    },

    // Add more stories here if needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(kToolbarHeight), // Adjust height if needed
        child: MyAppBar(PageName: "Bedtime Stories"),
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
                  return Icon(Icons.error,
                      size: 50); // Fallback if image fails to load
                },
              ),
              title: Text(stories[index]["title"]!),
              subtitle: Text(stories[index]["description"]!),
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          StoryDetailPage(storyTitle: stories[index]["title"]!),
                    ),
                  );
                },
                child: Text(
                  'Read',
                  style: TextStyle(color: Color(0xFF5571A7)),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
