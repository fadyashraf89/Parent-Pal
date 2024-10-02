import 'package:flutter/material.dart';
import 'package:parent_pal/models/MyAppBar.dart';
import 'package:parent_pal/models/footer.dart';
import 'package:parent_pal/models/title_card.dart';

class CommonIssues extends StatelessWidget {
  CommonIssues({super.key});

  final List<String> categoryTitles = [
    "Psychological and Behavioral Issues",
    "Common Infectious Diseases",
    "Chronic and Genetic Conditions",
    "Nutritional and Growth Issues",
    "Environmental and Lifestyle Factors",
    "Neurological and Developmental Disorders",
    "Immune System and Other Health Conditions",
    "Psychosocial and Family Issues",
  ];

  final List<List<String>> issueDescriptions = [
    [
      "Autism: Early diagnosis and intervention are crucial for managing autism. Support from professionals and a structured environment can help children with autism develop essential skills.",
      "ADHD, Hyperactivity, Lack of Concentration: Children with ADHD require tailored strategies to improve focus and behavior. Consistent routines and positive reinforcement can be beneficial.",
      "Depression & Anxiety: Mental health issues like depression and anxiety need prompt attention and professional support. Creating a supportive and understanding environment is vital.",
      "Stubbornness, Violence, Anger, Lying, Aggression, Defiance: Addressing these behavioral issues involves understanding the underlying causes and implementing consistent discipline strategies.",
      "Isolation, Lack of Self-Confidence, FOMO (Fear of Missing Out), Loneliness: Encouraging social interactions and fostering a sense of belonging can help children overcome feelings of isolation and loneliness.",
      "Addiction to Mobile Phones and Internet, Negative Influence of Social Media, Behavioral Disorders Due to Wrong Upbringing: Setting boundaries on screen time and promoting healthy activities can mitigate these issues.",
    ],
    [
      "Common Cold, Flu, Seasonal Flu, Tonsillitis, Otitis, Bronchitis: Ensuring proper hygiene and timely medical care can prevent and manage these common illnesses.",
      "Diarrhea, Stomach Flu, Gastrointestinal Problems: Maintaining good hygiene and a balanced diet can help prevent gastrointestinal issues.",
      "Measles, Chickenpox, Jaundice, Meningitis: Vaccinations and prompt medical attention are essential for preventing and treating these infectious diseases.",
    ],
    [
      "Respiratory Allergies, Asthma: Managing environmental triggers and providing appropriate medical treatment can help control these conditions.",
      "Down Syndrome: Early intervention programs and ongoing support can significantly improve the quality of life for children with Down syndrome.",
      "Cystic Fibrosis, Thalassemia, Hemophilia: These genetic conditions require specialized medical care and support groups can connect families with valuable resources.",
    ],
    [
      "Malnutrition, Poor Nutrition, Vitamin Deficiencies: Ensuring a balanced diet rich in essential nutrients is crucial for a child’s growth and development.",
      "Delayed Growth, Stunted Growth: Regular health check-ups and addressing underlying health issues can promote normal growth.",
      "Obesity, Overweight, Sedentary Lifestyle: Encouraging physical activity and healthy eating habits can prevent and manage obesity.",
    ],
    [
      "Hygiene-Related Diseases: Promoting good hygiene practices like handwashing can prevent the spread of diseases.",
      "Impact of Environment: Ensuring a safe and healthy living environment free from pollutants and hazards is vital for a child’s overall well-being.",
      "Accidents and Injuries: Childproofing the environment and teaching safety precautions can help prevent accidents.",
    ],
    [
      "Stuttering, Speech Delay: Early intervention and speech therapy can help children overcome speech and language challenges.",
      "Developmental Disorders, Delayed Milestones: Identifying and addressing developmental delays early, such as those associated with Autism Spectrum Disorder (ASD), can support a child’s progress.",
      "Learning Disabilities (Dyslexia, Dyscalculia): Specialized educational approaches can help children with learning disabilities succeed in school.",
    ],
    [
      "Weak Immunity, Frequent Infections: Proper nutrition, regular exercise, and medical care can strengthen the immune system.",
      "Headaches, Fever: While common, persistent headaches or fevers warrant medical evaluation.",
      "Dental Problems (Tooth Decay): Proper oral hygiene habits and regular dental check-ups are crucial for maintaining good dental health.",
      "Eczema, Psoriasis: These chronic skin conditions can be managed with appropriate medical treatment and skincare routines.",
    ],
    [
      "Lack of Proper Role Models, Misguided Upbringing Leading to Psychological Issues: Positive role models and a supportive family environment are crucial for healthy psychological development.",
      "Issues Due to Family Disputes, Lack of Parental Attention: Resolving family conflicts and providing consistent parental attention can mitigate these issues.",
      "Bullying:  Schools and parents need to work together to create a safe and supportive environment and address bullying incidents effectively.",
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FooterWidget(),
      backgroundColor: Color(0xFFF8F8F8), // Light gray background
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        // Adjust height if needed
        child: MyAppBar(PageName: "Common Issues"),
      ),
      body: ListView.builder(
        itemCount: categoryTitles.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(left: 60.0, right: 60.0, top: 20.0),
          child: TitleCard(
            title: categoryTitles[index],
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
          maxHeight: MediaQuery.of(context).size.height * 0.85, // Set max height
          minHeight: MediaQuery.of(context).size.height * 0.1, // Set max height
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: issueDescriptions[index]
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
