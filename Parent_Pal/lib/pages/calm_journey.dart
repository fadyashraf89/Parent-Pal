import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Add this import
import 'package:parent_pal/models/MyAppBar.dart';
import 'package:parent_pal/models/footer.dart';
import 'package:parent_pal/models/topic_card.dart';

class CalmJourney extends StatelessWidget {
  CalmJourney({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FooterWidget(),
      backgroundColor: Color(0xFFF5F5F5),
      // Light gray background
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        // Adjust height if needed
        child: MyAppBar(PageName: "Calm Journey"),
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
                Image.asset("assets/images/Screenshot (191).png",
                    width: 150, height: 150),

                SizedBox(height: 10.0),
                // Add spacing

                // **Our Experts Section - List View**
                ListView.builder(
                  shrinkWrap: true, // Prevent list view from expanding
                  physics: NeverScrollableScrollPhysics(), // Disable scrolling
                  itemCount: pregnancyStages.length, // Use list length
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
    if (index < 0 || index >= pregnancyStages.length) {
      return "Topic Title"; // Handle out-of-bounds index
    }
    return pregnancyStages[index]['title'];
  }

  String getDescription(int index) {
    if (index < 0 || index >= pregnancyStages.length) {
      return "Description"; // Handle out-of-bounds index
    }
    return pregnancyStages[index]['description'];
  }

  // List of Nutrition Tips with titles and descriptions
  final List<Map<String, dynamic>> pregnancyStages = [
    {
      "title": "First Trimester (Weeks 1-12)",
      "description":
      "Baby's organs begin to form. Morning sickness, fatigue, and frequent urination might be common for the mother. Schedule a prenatal checkup to confirm pregnancy and discuss prenatal care.",
    },
    {
      "title": "Second Trimester (Weeks 13-27)",
      "description":
      "Baby develops a heartbeat, kicks, and reflexes. The mother's belly starts to grow noticeably. Morning sickness usually subsides. Energy levels typically increase. Schedule regular prenatal checkups to monitor baby's development and mother's health.",
    },
    {
      "title": "Third Trimester (Weeks 28-40)",
      "description":
      "Baby's development focuses on lung maturity and preparing for birth. The mother experiences increased Braxton-Hicks contractions (practice contractions). Regular prenatal checkups are crucial to monitor baby's position and mother's health. Prepare for childbirth by attending birthing classes (optional).",
    },
    {
      "title": "Early Signs of Labor",
      "description":
      "Look for signs like regular contractions (getting closer together and stronger), bloody show (discharge with mucus and blood), and water breaking. Familiarize yourself with your birthing plan and head to the hospital when contractions are consistent and close together.",
    },
    {
      "title": "Stages of Labor",
      "description":
      "Labor is divided into stages: latent (early contractions), active (stronger contractions, cervix dilates), transition (intense contractions), pushing (delivery of baby), and delivery of placenta. Understand the different stages and what to expect during each.",
    },
    {
      "title": "Newborn Care Basics",
      "description":
      "Get comfortable with newborn care basics like feeding (breastfeeding or formula), diapering, bathing, umbilical cord care, and soothing techniques. Learn about newborn reflexes and typical sleeping patterns.",
    },
    {
      "title": "Postpartum Recovery",
      "description":
      "After childbirth, the mother's body undergoes changes. Expect fatigue, vaginal soreness, and lochia (vaginal discharge). Prioritize rest, healthy eating, and recovery exercises. Schedule postpartum checkups to monitor healing and address any concerns.",
    },
    {
      "title": "Importance of Postpartum Checkups",
      "description":
      "Regular postpartum checkups with your doctor are crucial for monitoring your health and recovery after childbirth. Discuss any concerns you might have about physical or emotional well-being.",
    },
    {
      "title": "Building a Support System",
      "description":
      "Having a strong support system of family, friends, and healthcare providers is essential during the postpartum period. Delegate tasks, accept help, and don't hesitate to reach out for support if needed.",
    },
    {
      "title": "Coping with Emotions After Birth",
      "description":
      "It's normal to experience a range of emotions after birth, such as joy, exhaustion, anxiety, or baby blues. Talk to your partner or healthcare provider if emotions feel overwhelming. Prioritize self-care for your mental and emotional well-being.",
    },
    {
      "title": "Newborn Development Milestones",
      "description":
      "Newborns develop rapidly in the first year. Track your baby's milestones in areas like head control, rolling over, grasping, cooing, and babbling. Every baby develops at their own pace, but consult your doctor if you have concerns about developmental delays.",
    },
    {
      "title": "Vaccinations for Newborns",
      "description":
      "Recommended vaccinations for newborns help protect them from preventable diseases. Schedule well-baby visits with your pediatrician to ensure your baby receives all necessary vaccinations on time.",
    },
    {
      "title": "Postpartum Diet and Nutrition",
      "description":
      "Maintaining a healthy diet is important for postpartum recovery and breastfeeding mothers. Focus on nutritious foods from all food groups to ensure you and your baby get the essential vitamins and minerals needed.",
    },
    {
      "title": "Infant Feeding (Breastfeeding or Formula)",
      "description":
      "Learn about the benefits and challenges of breastfeeding and formula feeding. Explore resources and support groups to help you make informed decisions and establish a feeding routine that works for you and your baby.",
    },
    {
      "title": "Common Newborn Skin Conditions",
      "description":
      "Newborns may develop skin conditions like cradle cap (scaly patches on the scalp) or baby acne. Learn how to identify and manage these conditions effectively.",
    },
    {
      "title": "Sleep Tips for Newborns",
      "description":
      "Newborns have unpredictable sleep patterns. Understand the importance of safe sleep practices and learn strategies to promote healthy sleep habits for your baby.",
    },
    {
      "title": "Sibling Preparation (if applicable)",
      "description":
      "Preparing older siblings for the arrival of a new baby can help ease potential jealousy and promote positive interactions. Explore strategies to involve siblings and create a welcoming environment for the new family member.",
    },
    {
      "title": "Financial Planning for Parenthood",
      "description":
      "Parenthood comes with additional expenses. Consider budgeting for childcare, diapers, baby gear, and other essentials. Explore financial resources and programs that might be available to support you.",
    },
    {
      "title": "Importance of Self-Care for Parents",
      "description":
      "Prioritizing self-care practices as a new parent is crucial. Schedule time for relaxation, hobbies, and activities that help you manage stress and maintain your well-being. A well-rested and healthy parent can better care for their baby.",
    },
  ];
}

