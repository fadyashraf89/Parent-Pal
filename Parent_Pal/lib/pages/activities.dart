import 'package:flutter/material.dart';
import 'package:parent_pal/models/MyAppBar.dart';
import 'package:parent_pal/models/footer.dart';
import 'package:parent_pal/models/topic_card.dart';

class ActivitiesScreen extends StatelessWidget {
  ActivitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FooterWidget(),
      backgroundColor: Color(0xFFF7F7F7),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: MyAppBar(PageName: "Family Activities"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20.0),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: activities.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: TopicCard(
                      title: getTitle(index),
                      description: getDescription(index),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String getTitle(int index) {
    if (index < 0 || index >= activities.length) {
      return "Topic Title";
    }
    return activities[index]['title'];
  }

  String getDescription(int index) {
    if (index < 0 || index >= activities.length) {
      return "Description";
    }
    return activities[index]['description'];
  }

  final List<Map<String, dynamic>> activities = [
    {
      'title': 'Build a Dream House!',
      'description': 'Design and build a dream house using cardboard boxes, markers, and other craft supplies.'
    },
    {
      'title': 'Explore the Outdoors!',
      'description': 'Take a nature walk and discover the wonders of the outdoors, including plants, animals, and more.'
    },
    {
      'title': 'Build the Ultimate Fort!',
      'description': 'Create a fort using blankets, pillows, and furniture for an indoor camping adventure.'
    },
    {
      'title': 'Get Active with an Obstacle Course!',
      'description': 'Set up a fun and challenging obstacle course in your backyard or living room.'
    },
    {
      'title': 'Get Creative with Playdough!',
      'description': 'Make your own playdough and create fun shapes, animals, and other designs.'
    },
    {
      'title': 'Unleash Your Inner Artist!',
      'description': 'Spend an afternoon painting, drawing, or crafting to express your creativity.'
    },
    {
      'title': 'Put on a Show!',
      'description': 'Create a play or talent show and perform for your family and friends.'
    },
    {
      'title': 'Family Game Time!',
      'description': 'Gather your favorite board games and have a fun game night with the family.'
    },
    {
      'title': 'Create Your Own Story!',
      'description': 'Write and illustrate your own storybook to share with others.'
    },
    {
      'title': 'Get Grooving!',
      'description': 'Turn up the music and have a dance party to your favorite tunes.'
    },
    {
      'title': 'Listen to an Audiobook Together!',
      'description': 'Choose an exciting audiobook to listen to as a family.'
    },
    {
      'title': 'Make a Time Capsule!',
      'description': 'Create a time capsule with items that represent your current life and bury it in your yard.'
    },
    {
      'title': 'Host a Family Movie Night!',
      'description': 'Pick a family-friendly movie and enjoy a cozy movie night at home with snacks.'
    },
    {
      'title': 'Learn a New Language!',
      'description': 'Start learning a new language together using online resources or apps.'
    },
    {
      'title': 'Cook a Meal Together!',
      'description': 'Choose a recipe and cook a delicious meal together as a family.'
    },
    {
      'title': 'Plant a Garden!',
      'description': 'Plant flowers, vegetables, or herbs in your garden and watch them grow.'
    },
    {
      'title': 'Have a Science Experiment Day!',
      'description': 'Conduct fun and educational science experiments at home.'
    },
    {
      'title': 'Go on a Scavenger Hunt!',
      'description': 'Create a scavenger hunt with clues and treasures for a fun adventure.'
    },
    {
      'title': 'Write a Letter to a Friend!',
      'description': 'Write and decorate a letter to send to a friend or family member.'
    },
    {
      'title': 'Build a Birdhouse!',
      'description': 'Build and decorate a birdhouse to hang in your yard and attract birds.'
    },
    {
      'title': 'Have a Water Balloon Fight!',
      'description': 'Fill up water balloons and have a refreshing water balloon fight.'
    },
    {
      'title': 'Go Stargazing!',
      'description': 'Lay out a blanket and look at the stars, identifying constellations and planets.'
    },
    {
      'title': 'Create a Family Tree!',
      'description': 'Research your family history and create a family tree to display at home.'
    },
    {
      'title': 'Have a Photo Shoot!',
      'description': 'Dress up and have a fun photo shoot, capturing silly and special moments.'
    },
    {
      'title': 'Visit a Virtual Museum!',
      'description': 'Explore a virtual museum tour online and learn about art, history, and more.'
    },
    {
      'title': 'Have a Dance Party!',
      'description': 'Host a dance party with your favorite music and dance the day away.'
    },
    {
      'title': 'Learn to Play an Instrument!',
      'description': 'Start learning to play a musical instrument together using online tutorials.'
    },
    {
      'title': 'Make Homemade Ice Cream!',
      'description': 'Make delicious homemade ice cream with your favorite flavors and toppings.'
    },
    {
      'title': 'Do a Puzzle Together!',
      'description': 'Work on a jigsaw puzzle together, challenging yourselves to complete it.'
    },
    {
      'title': 'Have a Picnic in the Backyard!',
      'description': 'Pack a picnic basket and enjoy a meal together in your backyard.'
    },
  ];
}
