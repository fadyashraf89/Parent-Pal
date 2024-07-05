import 'package:flutter/material.dart';
import 'package:parent_pal/models/MyAppBar.dart';
import 'package:parent_pal/models/footer.dart';
import 'package:parent_pal/models/topic_card.dart';

class Nutrition extends StatelessWidget {
  Nutrition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FooterWidget(),
      backgroundColor: Color(0xFFFDFDFD), // Light gray background
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        // Adjust height if needed
        child: MyAppBar(PageName: "Some Nutrition Tips"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            // Allow scrolling only when content overflows
            physics: ClampingScrollPhysics(), // Prevent unnecessary scrolling
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start, // Align at top
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20.0), // Add spacing
                Image.asset("assets/images/istockphoto-1320094414-612x612.jpg",
                    width: 150,
                    height: 150),

                SizedBox(height: 10.0), // Add spacing

                // **Our Experts Section - List View**
                ListView.builder(
                  shrinkWrap: true, // Prevent list view from expanding
                  physics: NeverScrollableScrollPhysics(), // Disable scrolling
                  itemCount: nutritionTips.length, // Use list length
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 20.0), // Add spacing below
                    child: TopicCard(
                      title: getTitle(index),
                      description: getDescription(index),
                    ),
                  ),
                ),
                SizedBox(height: 20.0), // Add spacing
              ],
            ),
          ),
        ),
      ),
    );
  }

  String getTitle(int index) {
    if (index < 0 || index >= nutritionTips.length) {
      return "Topic Title"; // Handle out-of-bounds index
    }
    return nutritionTips[index].title;
  }

  String getDescription(int index) {
    if (index < 0 || index >= nutritionTips.length) {
      return "Description"; // Handle out-of-bounds index
    }
    return nutritionTips[index].description;
  }

  // List of Nutrition Tips with titles and descriptions
// List of Nutrition Tips
  final List<NutritionTip> nutritionTips = [
    NutritionTip(
      title: "Focus on Fruits & Vegetables",
      description: "Aim for at least 5 servings of fruits and vegetables daily for essential vitamins and minerals.",
    ),
    NutritionTip(
      title: "Choose Lean Protein Sources",
      description: "Include lean meats, poultry, fish, eggs, and beans for protein to support your baby's growth.",
    ),
    NutritionTip(
      title: "Don't Skip Breakfast",
      description: "Don't skip breakfast! It helps regulate blood sugar and provides energy for the day.",
    ),
    NutritionTip(
      title: "Hydrate with Water",
      description: "Water is crucial for hydration. Aim for 8-10 glasses daily to support your body's functions.",
    ),
    NutritionTip(
      title: "Limit Sugary Drinks",
      description: "Limit sugary drinks like soda and juice. They offer empty calories and can contribute to weight gain.",
    ),
    NutritionTip(
      title: "Include Whole Grains",
      description: "Include whole grains like brown rice, quinoa, and whole-wheat bread for sustained energy and fiber.",
    ),
    NutritionTip(
      title: "Don't Forget Healthy Fats",
      description: "Don't forget healthy fats like avocados, nuts, and olive oil. They are essential for brain development and nutrient absorption.",
    ),
    NutritionTip(
      title: "Take Prenatal Vitamins",
      description: "Prenatal vitamins provide folic acid and other essential nutrients crucial for your baby's development.",
    ),
    NutritionTip(
      title: "Read Food Labels Carefully",
      description: "Read food labels carefully to understand nutritional content, including serving sizes and added sugars.",
    ),
    NutritionTip(
      title: "Listen to Your Body's Cravings (in Moderation)",
      description: "Listen to your body's cravings, but indulge in moderation. Opt for healthy alternatives when possible.",
    ),
    NutritionTip(
      title: "Practice Portion Control",
      description: "Practice portion control to avoid overeating. Use smaller plates and focus on nutrient-dense foods.",
    ),
    NutritionTip(
      title: "Cook More Meals at Home",
      description: "Cooking more meals at home allows you to control ingredients and portion sizes.",
    ),
    NutritionTip(
      title: "Manage Food Aversions",
      description: "Manage food aversions by trying different preparations or substituting similar foods.",
    ),
    NutritionTip(
      title: "Be Mindful of Mercury in Fish",
      description: "Be mindful of mercury in fish. Limit certain types like king mackerel and swordfish.",
    ),
    NutritionTip(
      title: "Limit Caffeine Intake",
      description: "Limit caffeine intake to 200mg per day (around 1 cup of coffee).",
    ),
    NutritionTip(
      title: "Avoid Unpasteurized Dairy Products",
      description: "Avoid unpasteurized dairy products to prevent foodborne illnesses.",
    ),
    NutritionTip(
      title: "Consider Taking a Fish Oil Supplement",
      description: "Consider taking a fish oil supplement after consulting your doctor for omega-3 fatty acids.",
    ),
    NutritionTip(
      title: "Enjoy Small, Frequent Meals",
      description: "Enjoy small, frequent meals throughout the day to avoid feeling overly hungry.",
    ),
    NutritionTip(
      title: "Indulge in Treats Occasionally",
      description: "Indulge in treats occasionally, but prioritize healthy choices most of the time.",
    ),
    NutritionTip(
      title: "Talk to Your Doctor About Your Diet",
      description: "Talk to your doctor about your diet to ensure you're getting the nutrients you and your baby need.",
    ),
  ];
}

// Define the NutritionTip class (assuming it's in a separate file)
class NutritionTip {
  final String title;
  final String description;

  NutritionTip({required this.title, required this.description});
}
