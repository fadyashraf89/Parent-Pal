import 'package:flutter/material.dart';
import 'package:parent_pal/models/MyAppBar.dart';
import 'package:parent_pal/models/footer.dart';
import 'package:parent_pal/models/topic_card.dart';

class BirthEducation extends StatelessWidget {
  BirthEducation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FooterWidget(),
      backgroundColor: Color(0xFFFDFDFD),
      // Light gray background
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        // Adjust height if needed
        child: MyAppBar(PageName: "Birth Education"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            // Allow scrolling only when content overflows
            physics: ClampingScrollPhysics(), // Prevent unnecessary scrolling
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              // Align at top
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20.0),
                // Add spacing
                Image.asset("assets/images/Screenshot (187).png",
                    width: 150, height: 150),

                SizedBox(height: 10.0),
                // Add spacing

                // **Our Experts Section - List View**
                ListView.builder(
                  shrinkWrap: true, // Prevent list view from expanding
                  physics: NeverScrollableScrollPhysics(), // Disable scrolling
                  itemCount: birthEducationTopics.length, // Use list length
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    // Add spacing below
                    child: TopicCard(
                      title: getTitle(index),
                      description: getDescription(index),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                // Add spacing
              ],
            ),
          ),
        ),
      ),
    );
  }

  String getTitle(int index) {
    if (index < 0 || index >= birthEducationTopics.length) {
      return "Topic Title"; // Handle out-of-bounds index
    }
    return birthEducationTopics[index].title;
  }

  String getDescription(int index) {
    if (index < 0 || index >= birthEducationTopics.length) {
      return "Description"; // Handle out-of-bounds index
    }
    return birthEducationTopics[index].description;
  }

  // List of Nutrition Tips with titles and descriptions
// List of Nutrition Tips
  final List<BirthEducationTopic> birthEducationTopics = [
    BirthEducationTopic(
      title: "Stages of Labor",
      description:
          "Learn about the different stages of labor (latent, active, transition, pushing, and delivery) and what to expect during each stage.",
    ),
    BirthEducationTopic(
      title: "Pain Management Techniques",
      description:
          "Explore various pain management techniques like breathing exercises, massage, relaxation techniques, and pain medication options.",
    ),
    BirthEducationTopic(
      title: "Delivery Positions",
      description:
          "Discover different delivery positions (supine, side-lying, squatting, etc.) and their potential benefits.",
    ),
    BirthEducationTopic(
      title: "Cesarean Delivery (C-Section)",
      description:
          "Understand the reasons for C-sections, what to expect during the procedure, and recovery.",
    ),
    BirthEducationTopic(
      title: "Induction of Labor",
      description:
          "Learn about the reasons for induction of labor, different methods used, and potential risks and benefits.",
    ),
    BirthEducationTopic(
      title: "Newborn Care Basics",
      description:
          "Get comfortable with newborn care basics like feeding, diapering, bathing, and umbilical cord care.",
    ),
    BirthEducationTopic(
      title: "What to Pack in Your Hospital Bag",
      description:
          "Create a packing list for your hospital bag with essentials for you, your baby, and your partner.",
    ),
    BirthEducationTopic(
      title: "Breastfeeding vs. Formula Feeding",
      description:
          "Explore the benefits and challenges of breastfeeding and formula feeding, and factors to consider when making your decision.",
    ),
    BirthEducationTopic(
      title: "Skin-to-Skin Contact",
      description:
          "Learn about the importance of skin-to-skin contact with your newborn after birth and its benefits for bonding and development.",
    ),
    BirthEducationTopic(
      title: "Newborn Screening Tests",
      description:
          "Understand the purpose of newborn screening tests conducted shortly after birth to detect potential health conditions.",
    ),
    BirthEducationTopic(
      title: "Postpartum Depression",
      description:
          "Be aware of postpartum depression symptoms, resources available, and the importance of seeking help if needed.",
    ),
    BirthEducationTopic(
      title: "Your Recovery After Birth",
      description:
          "Learn about typical recovery after birth, physical changes, and tips for a smooth postpartum experience.",
    ),
    BirthEducationTopic(
      title: "Pain Relief Options During Labor",
      description:
          "Explore different pain relief options during labor, including epidural anesthesia, nitrous oxide, and medication.",
    ),
    BirthEducationTopic(
      title: "The Role of Your Birth Partner",
      description:
          "Discuss the importance of your birth partner's role in providing support and advocacy during labor and delivery.",
    ),
    BirthEducationTopic(
      title: "Coping with Labor Pain",
      description:
          "Develop coping mechanisms for managing labor pain, such as relaxation techniques, visualization exercises, and focusing on your breath.",
    ),
    BirthEducationTopic(
      title: "Signs of Labor",
      description:
          "Learn about the early signs and symptoms of labor to help you recognize when it's time to go to the hospital.",
    ),
    BirthEducationTopic(
      title: "Your Birth Plan (Optional)",
      description:
          "Explore the idea of creating a birth plan to outline your preferences for labor and delivery, but understand its flexibility.",
    ),
    BirthEducationTopic(
      title: "Episiotomy (Perineal Incision)",
      description:
          "Learn about episiotomy, a surgical incision sometimes used during delivery, its purpose, and potential risks and benefits.",
    ),
    BirthEducationTopic(
      title: "Vaccinations for Newborns",
      description:
          "Understand the importance of recommended vaccinations for newborns to protect them from preventable diseases.",
    ),
    BirthEducationTopic(
      title: "Postpartum Bleeding",
      description:
          "Learn about typical postpartum bleeding and when to contact your doctor if you experience excessive bleeding.",
    ),
    BirthEducationTopic(
      title: "C-Section Recovery Tips",
      description:
          "Get specific tips for recovering after a C-section, including pain management, incision care, and physical limitations.",
    ),
    BirthEducationTopic(
      title: "Newborn Sleep Patterns",
      description:
          "Understand typical newborn sleep patterns and strategies to promote healthy sleep habits for your baby.",
    ),
    BirthEducationTopic(
      title: "Importance of Prenatal Classes",
      description:
          "Explore the benefits of attending prenatal classes to learn about pregnancy, childbirth, and newborn care.",
    ),
    BirthEducationTopic(
      title: "Your Rights as a Patient During Delivery",
      description:
          "Be informed about your rights as a patient during delivery, including the right to ask questions and make informed decisions.",
    ),
    BirthEducationTopic(
      title: "Coping with Emotions After Birth",
      description:
          "Understand the range of emotions you might experience after birth, and tips for managing them.",
    ),
    BirthEducationTopic(
      title: "Newborn Feeding Cues",
      description:
          "Learn to recognize your newborn's hunger cues to ensure they are feeding adequately.",
    ),
    BirthEducationTopic(
      title: "Importance of Postpartum Checkups",
      description:
          "Schedule regular postpartum checkups with your doctor to monitor your health and recovery after childbirth.",
    ),
    BirthEducationTopic(
      title: "Building a Support System",
      description:
          "Develop a strong support system of family and friends to help you during the postpartum period.",
    ),
    BirthEducationTopic(
      title: "Warning Signs for Newborns",
      description:
          "Learn about warning signs in newborns that might indicate a health concern and require immediate medical attention.",
    ),
    BirthEducationTopic(
      title: "Postpartum Exercise Considerations",
      description:
          "Understand safe and appropriate exercises to gradually resume after childbirth to regain strength and improve fitness.",
    ),
    BirthEducationTopic(
      title: "Sibling Preparation (if applicable)",
      description:
          "Explore strategies to prepare older siblings for the arrival of a new baby and promote positive interactions.",
    ),
    BirthEducationTopic(
      title: "Postpartum Diet and Nutrition",
      description:
          "Learn about healthy eating habits to support your recovery and provide essential nutrients for breastfeeding mothers.",
    ),
    BirthEducationTopic(
      title: "Financial Planning for Parenthood",
      description:
          "Consider financial planning aspects of parenthood, including budgeting for childcare, diapers, and other baby essentials.",
    ),
    BirthEducationTopic(
      title: "Building a Village of Support",
      description:
          "Expand your support system beyond immediate family and friends to include professionals like lactation consultants or postpartum doulas.",
    ),
    BirthEducationTopic(
      title: "The Importance of Self-Care for Parents",
      description:
          "Prioritize self-care practices as a new parent to manage stress, maintain well-being, and be the best version of yourself for your baby.",
    ),
    BirthEducationTopic(
      title: "Common Newborn Skin Conditions",
      description:
          "Learn about common newborn skin conditions like cradle cap and baby acne, and how to manage them effectively.",
    ),
    BirthEducationTopic(
      title: "Travel Considerations with a Newborn",
      description:
          "Explore factors to consider when planning travel with a newborn, including packing essentials and ensuring a comfortable journey.",
    ),
  ];
}

// Define the NutritionTip class (assuming it's in a separate file)
class BirthEducationTopic {
  final String title;
  final String description;

  BirthEducationTopic({required this.title, required this.description});
}
