import 'package:flutter/material.dart';
import 'package:parent_pal/models/MyAppBar.dart';
import 'package:parent_pal/models/card_with_image.dart';
import 'package:parent_pal/models/footer.dart';
import 'package:parent_pal/models/title_card.dart';
import 'package:parent_pal/models/topic_card.dart';


class SpecialIssues extends StatelessWidget {
  const SpecialIssues({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Card> problems = [
      Card(
          title: "Early Adolescence",
          description: "Supporting children through the transitional phase of early adolescence with appropriate guidance and understanding"
      ),
      Card(
          title: "Parental Conflicts",
          description: "Providing resources and support for children affected by parental conflicts to ensure their emotional well-being"
      ),
      Card(
          title: "Support for Children of Divorce",
          description: "Offering counseling and support to help children navigate the challenges of parental separation"
      ),
      Card(
          title: "Bullying",
          description: ": Implementing anti-bullying programs and providing support for victims to ensure a safe and inclusive environment"
      ),
      Card(
          title: "Building Self-Confidence",
          description: "Encouraging self-confidence through positive reinforcement and opportunities for success"
      ),
      Card(
          title: "Moral Values",
          description: "Teaching and reinforcing moral values to help children develop a strong ethical foundation"
      ),
      Card(
          title: "Influence of Social Media",
          description: "Educating children about the responsible use of social media and the potential risks involved"
      ),
      Card(
          title: "Special Needs Children",
          description: "Providing tailored support and resources for children with special needs to ensure their development and inclusion"
      ),
      Card(
          title: "Teenage Relationships",
          description: "Guiding teenagers through healthy relationship practices and addressing related challenges"
      ),
      Card(
          title: "Autism Awareness",
          description: "Promoting awareness and understanding of autism to foster a supportive environment for affected children"
      ),
      Card(
          title: "Work of Parents",
          description: "Balancing parental work responsibilities with family time to ensure children receive adequate attention and support"
      ),
      Card(
          title: "Positive Role Models",
          description: "Highlighting positive role models to inspire and guide children"
      ),
      Card(
          title: "Mental Health Support",
          description: "Ensuring access to mental health resources and support for children facing psychological challenges"
      ),
      Card(
          title: "Refugee Children",
          description: "Providing support and resources to help refugee children integrate and thrive in new environments"
      ),
      Card(
          title: "Child Labor",
          description: "Advocating against child labor and supporting initiatives that promote education and protection for affected children"
      ),
      Card(
          title: "Children's Privacy",
          description: "Safeguarding children's privacy in digital and real-world interactions"
      ),
      Card(
          title: "Health Crises and Environment",
          description: "Addressing the impact of health crises and environmental factors on children's well-being"
      ),
      Card(
          title: "Children in Poverty",
          description: "Supporting initiatives that provide resources and opportunities for children living in poverty"
      ),
      Card(
          title: "Violence and Exploitation",
          description: "Protecting children from violence and exploitation through advocacy and support programs"
      ),
      Card(
          title: "Educational Support",
          description: "Providing educational resources and support to ensure all children have access to quality education"
      ),
      Card(
          title: "Sexual Education and Health",
          description: "Offering comprehensive sexual education to promote informed and healthy choices"
      ),
      Card(
          title: "Children's Nutrition",
          description: "Ensuring children receive proper nutrition to support their growth and development"
      ),
      Card(
          title: "Orphaned and Homeless Children",
          description: "Providing care and support for orphaned and homeless children to ensure their safety and development"
      ),
      Card(
          title: "Drug Addiction",
          description: "Addressing and preventing drug addiction through education and support programs"
      ),
      Card(
          title: "Gender Issues",
          description: "Promoting gender equality and addressing issues related to gender discrimination"
      ),
      Card(
          title: "Domestic Violence",
          description: "Supporting children affected by domestic violence and ensuring their safety"
      ),
      Card(
          title: "Disability Awareness",
          description: "Raising awareness about disabilities and promoting inclusion and support for affected children."
      ),
      Card(
          title: "Public Health Education",
          description: "Educating children and communities about public health issues and preventive measures"
      ),
    ];

    return Scaffold(
      bottomNavigationBar: FooterWidget(),
      backgroundColor: Color(0xFFF8F8F8), // Light gray background
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight), // Adjust height if needed
        child: MyAppBar(PageName: "Special Issues"),
      ),
      body: ListView.builder(
        itemCount: problems.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
          child: TopicCard(
            title: problems[index].title,
            description: problems[index].description,
          ),
        ),
      ),
    );
  }
}

class Card {
  final String title;
  final String description;

  Card({
    required this.title,
    required this.description
  });
}
