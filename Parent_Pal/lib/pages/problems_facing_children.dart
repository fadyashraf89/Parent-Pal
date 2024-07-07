import 'package:flutter/material.dart';
import 'package:parent_pal/models/MyAppBar.dart';
import 'package:parent_pal/models/footer.dart';
import 'package:parent_pal/models/title_card.dart';

class ChildrenProblems extends StatelessWidget {
  ChildrenProblems({super.key});

  final List<String> problemTitles = [
    "Parental Influence and Engagement",
    "Peer and Social Pressures",
    "Behavioral and Emotional Challenges",
    "Cultural and Environmental Factors",
    "Education and Values",
  ];

  final List<List<String>> problemDescriptions = [
    [
      "Lack of Sufficient Parental Attention and Time for Dialogue: Modern lifestyles often leave parents with little time to engage in meaningful conversations with their children. This lack of attention can result in children feeling neglected and undervalued, affecting their emotional and psychological well-being.",
      "Parental Neglect and Negative Comparison: When parents compare their children unfavorably to others, it can lead to feelings of inadequacy and low self-esteem in children. Neglect, whether intentional or unintentional, can exacerbate these feelings, leading to long-term emotional scars.",
      "Difficulty in Parents Understanding Their Children's Needs: Many parents struggle to comprehend the unique needs and challenges faced by their children. This gap in understanding can result in ineffective support and guidance, further complicating the child’s development.",
      "Pressure from Parents and Their Absence in Emotional Support: High expectations and pressure from parents to excel in academics or extracurricular activities can lead to stress and anxiety in children. The absence of emotional support during these times can intensify these negative feelings, impacting their mental health.",
    ],
    [
      "Influence of Peers and Negative Friends: Peer pressure can significantly influence a child’s behavior and decisions. Negative friendships can lead children astray, encouraging harmful habits and behaviors.",
      "Bullying and Peer Pressure: Bullying, both physical and cyber, can have devastating effects on a child's self-esteem and mental health. The pressure to fit in or conform to group norms can lead to poor decision-making and risky behaviors.",
      "Impact of Social Media and Negative Online Interactions: Social media can expose children to unrealistic standards and negative interactions. Cyberbullying, exposure to inappropriate content, and addiction to social media can affect their mental health and self-perception.",
    ],
    [
      "Difficulty in Expressing Emotions: Many children struggle to articulate their feelings, leading to frustration and misunderstood behaviors. This can result in conflicts with parents and peers, further isolating the child.",
      "Dealing with Strong Emotions and Anger: Learning to manage strong emotions like anger is challenging for children. Without proper guidance, these emotions can manifest as aggressive behavior or internalized stress.",
      "Challenges in Self-Expression and Communication with Parents: Effective communication with parents is crucial for a child’s development. Miscommunication or lack of communication can lead to misunderstandings and emotional disconnect.",
    ],
    [
      "Impact of Community and Cultural Differences: Children growing up in multicultural environments may face identity confusion and cultural conflicts. Understanding and navigating these differences is crucial for their social and emotional development.",
      "Negative Habits Learned from Social Media and Television: Exposure to negative behaviors and unrealistic portrayals of life on media can influence children’s attitudes and behaviors, often leading them astray.",
      "Unhealthy Family Environment and Marital Issues Affecting Children: Family conflicts and an unstable home environment can significantly impact a child's emotional and psychological well-being, leading to behavioral issues and academic problems.",
    ],
    [
      "Importance of Instilling Good Morals and Ethics: Teaching children the difference between right and wrong is fundamental. Parents play a crucial role in shaping their children’s moral compass and ethical understanding.",
      "Teaching Children Right from Wrong: Instilling a sense of responsibility and ethics in children helps them make sound decisions and develop a strong character.",
      "Challenges in Applying Learned Principles in Real-Life Situations: Children often find it difficult to apply theoretical knowledge of morals and ethics in practical situations. Guidance and real-life examples from parents can bridge this gap.",
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FooterWidget(),
      backgroundColor: Color(0xFFF8F8F8),
      // Light gray background
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        // Adjust height if needed
        child: MyAppBar(PageName: "Children Problems"),
      ),
      body: ListView.builder(
        itemCount: problemTitles.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(left: 60.0, right: 60.0, top: 20.0),
          child: TitleCard(
            title: problemTitles[index],
            onTap: () => _showBottomSheet(context, index),
          ),
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context, int index) {
    showModalBottomSheet(
      backgroundColor: Color(0xFF5571A7),
      enableDrag: true,
      isScrollControlled: true,
      isDismissible: true,
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(20.0),
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.8, // Set max height
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: problemDescriptions[index]
                    .map((point) => Column( // Wrap each point in a Column
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: point.split(':')[0] + ':',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Color(0xFFF8F8F8),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: point.split(':')[1],
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Color(0xFFF8F8F8),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20.0), // Add a SizedBox after each point
                  ],
                ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
