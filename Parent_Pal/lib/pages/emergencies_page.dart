import 'package:flutter/material.dart';
import 'package:parent_pal/models/MyAppBar.dart';
import 'package:parent_pal/models/footer.dart';
import 'package:parent_pal/models/topic_card.dart';

class EmergencyReference extends StatelessWidget {
  EmergencyReference({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FooterWidget(),
      backgroundColor: Color(0xFFF7F7F7),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: MyAppBar(PageName: "Emergency Reference"),
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
                Icon(Icons.warning_amber_rounded,
                    color: Color(0xFF5571A7), size: 150),
                SizedBox(height: 10.0),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: emergencies.length,
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
    if (index < 0 || index >= emergencies.length) {
      return "Topic Title";
    }
    return emergencies[index]['title'];
  }

  String getDescription(int index) {
    if (index < 0 || index >= emergencies.length) {
      return "Description";
    }
    return emergencies[index]['description'];
  }

  final List<Map<String, dynamic>> emergencies = [
  {
  'title': "Fever",
  'description':
  "A high fever (over 100.4°F for infants or 102°F for older children) can be a sign of infection. Contact your pediatrician if your child has a high fever, especially if accompanied by other symptoms like lethargy, vomiting, or rash. You can also use a lukewarm bath or cool compress to help lower their temperature."
},
{
'title': "Seizures",
'description':
"Seizures in children can be caused by various factors and require immediate medical attention. Call 911 or go to the nearest emergency room if your child experiences a seizure. Stay calm and observe the seizure, noting the duration and any unusual movements. Do not restrain your child or put anything in their mouth."
},
{
'title': "Breathing Difficulties",
'description':
"Rapid breathing, wheezing, or retracting of the chest are signs of respiratory distress. Call 911 or go to the nearest emergency room if your child has difficulty breathing."
},
{
'title': "Severe Vomiting or Diarrhea",
'description':
"Persistent vomiting or diarrhea can lead to dehydration, especially in young children. Contact your pediatrician if your child experiences persistent vomiting or diarrhea for more than 24 hours."
},
{
'title': "Head Injury",
'description':
"Even a minor bump on the head can be serious. If your child experiences a head injury, look for signs like vomiting, drowsiness, or confusion. Seek medical attention if any concerning symptoms arise."
},
{
'title': "Choking",
'description':
"If your child is choking and unable to cough or breathe, perform the Heimlich maneuver (if trained) or call 911 immediately."
},
{
'title': "Allergic Reaction",
'description':
"Symptoms of a severe allergic reaction (anaphylaxis) can include difficulty breathing, swelling of the face or throat, and hives. If your child experiences these symptoms, call 911 or go to the nearest emergency room immediately."
},
{
'title': "Broken Bone",
'description':
"Signs of a broken bone include severe pain, swelling, bruising, and difficulty using the affected limb. Seek medical attention if you suspect a broken bone."
},
{
'title': "Croup",
'description':
"Croup is a respiratory illness causing a barking cough and difficulty breathing. If your child has a croup cough and symptoms worsen, seek medical attention."
},
{
'title': "Meningitis",
'description':
"Symptoms like fever and stiff neck require immediate medical attention. Meningitis is a serious infection of the meninges, the membranes that surround the brain and spinal cord."
},
{
'title': "Epilepsy",
'description':
"Follow the prescribed seizure action plan for known epilepsy cases."
},
{
'title': "Animal Bites",
'description':
"Seek medical attention for animal bites, especially from unknown or rabid animals."
},
{
'title': "Foreign Object in Eye or Nose",
'description':
"Do not attempt to remove foreign objects from the eye or nose. Seek medical help."
},
{
'title': "Febrile Seizure",
'description':
"Febrile seizures usually resolve on their own, but seek medical help if lasting more than 5 minutes or accompanied by concerning symptoms."
},
{
'title': "Sunburn",
'description':
"Severe sunburn with blistering or fever needs medical attention."
},
{
'title': "Bee Sting or Insect Bite",
'description':
"Remove stingers carefully with tweezers or a credit card. Seek medical help for severe allergic reactions or difficulty breathing."
},
{
'title': "Poisoning",
'description':
"Contact poison control or seek immediate medical help if poisoning is suspected."
},
{
'title': "Burns",
'description':
"Cool the burn with water for at least 15 minutes and remove any clothing stuck to the skin. Seek medical attention for severe burns."
},
    {
      'title': "Near Drowning",
      'description':
      "Call 911 immediately if your child experiences near drowning. Even if they seem okay initially, monitor them closely for breathing difficulties or other complications."
    },
    {
      'title': "Electric Shock",
      'description':
      "Seek medical attention immediately for electric shocks. Do not touch the child or the electrical source if they are still in contact. Turn off the power source if possible."
    },
    {
      'title': "Allergic Reaction (Anaphylaxis)",
      'description':
      "Severe allergic reactions need immediate attention. Call 911 for symptoms like swelling or difficulty breathing.  An EpiPen may be used if prescribed by a doctor."
    },
    {
      'title': "Ingestion of Foreign Object",
      'description':
      "Seek medical attention immediately if your child swallows something they shouldn't. Do not induce vomiting unless instructed by a medical professional."
    },
    {
      'title': "Fracture or Sprain",
      'description':
      "Signs of a fracture or sprain include pain, swelling, and difficulty using the affected limb. Apply a cold compress to reduce swelling and seek medical attention for a proper diagnosis and treatment."
    },
    {
      'title': "Asthma Attack",
      'description':
      "Follow your child's asthma action plan and seek medical attention if symptoms worsen, such as wheezing, chest tightness, or difficulty breathing."
    },
    {
      'title': "Headache",
      'description':
      "Most headaches are harmless and resolve on their own. However, persistent or severe headaches, especially accompanied by other symptoms like fever, vomiting, or vision changes, may require medical evaluation."
    },
    {
      'title': "Stomach Ache",
      'description':
      "Most stomachaches are mild and resolve on their own. Seek medical attention if the pain is severe, persistent, or accompanied by vomiting, fever, or bloody stool."
    },
    {
      'title': "Earache",
      'description':
      "Earaches can be caused by infection or other factors. Contact your pediatrician if the earache is severe, accompanied by fever, or doesn't improve with home remedies."
    },
    {
      'title': "Nosebleed",
      'description':
      "Most nosebleeds are minor and can be stopped with simple first aid measures like pinching the soft part of the nose. Seek medical attention if the bleeding is severe or persistent."
    },
    {
      'title': "Animal Scratches",
      'description':
      "Clean animal scratches thoroughly with soap and water and apply a bandage. Seek medical attention if signs of infection develop (redness, swelling, pus)."
    },
    {
      'title': "Allergic Skin Reaction",
      'description':
      "For mild allergic skin reactions (rashes, hives), try over-the-counter remedies like calamine lotion. Seek medical attention if the reaction is severe, widespread, or accompanied by difficulty breathing."
    },
    {
      'title': "Fainting",
      'description':
      "Lay the child flat and elevate their legs if they faint. Loosen any tight clothing. Once conscious, offer them sips of water. Seek medical attention if fainting is frequent or accompanied by other concerning symptoms (head injury, chest pain)."
    },
    {
      'title': "Bleeding from the Mouth or Nose",
      'description':
      "Apply gentle pressure to the bleeding site with a clean cloth. Seek medical attention immediately for serious injuries or if bleeding doesn't stop after applying pressure."
    },
    {
      'title': "Chemical Burns",
      'description':
      "Flush the affected area with water for at least 15 minutes, removing any contaminated clothing. Seek medical attention immediately."
    },
    {
      'title': "Sunstroke",
      'description':
      "Symptoms include high fever, confusion, and headache. Move the child to a cool place, remove clothing, and cool the skin with water. Wet cloths or a cool bath can be helpful. Call 911 immediately."
    },
    {
      'title': "Hypothermia",
      'description':
      "Symptoms include shivering, confusion, and slurred speech. Gradually warm the child with blankets and warm drinks. Do not rub the skin or use hot water. Seek medical attention immediately."
    }
  ];
}
