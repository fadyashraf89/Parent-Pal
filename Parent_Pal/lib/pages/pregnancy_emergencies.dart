import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Add this import
import 'package:parent_pal/models/MyAppBar.dart';
import 'package:parent_pal/models/footer.dart';
import 'package:parent_pal/models/topic_card.dart';

class PregnancyEmergencies extends StatelessWidget {
  PregnancyEmergencies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FooterWidget(),
      backgroundColor: Color(0xFFF7F7F7),
      // Light gray background
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        // Adjust height if needed
        child: MyAppBar(PageName: "Pregnancy Emergencies"),
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
                Image.asset("assets/images/Screenshot (190).png",
                    width: 150, height: 150),

                SizedBox(height: 10.0),
                // Add spacing

                // **Our Experts Section - List View**
                ListView.builder(
                  shrinkWrap: true, // Prevent list view from expanding
                  physics: NeverScrollableScrollPhysics(), // Disable scrolling
                  itemCount: emergencies.length, // Use list length
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
    if (index < 0 || index >= emergencies.length) {
      return "Topic Title"; // Handle out-of-bounds index
    }
    return emergencies[index]['title'];
  }

  String getDescription(int index) {
    if (index < 0 || index >= emergencies.length) {
      return "Description"; // Handle out-of-bounds index
    }
    return emergencies[index]['description'];
  }

  // List of Nutrition Tips with titles and descriptions
  final List<Map<String, dynamic>> emergencies = [
    {
      "title": "Bleeding During Pregnancy",
      "description":
      "Vaginal bleeding during pregnancy can be concerning, but it doesn't always indicate a serious problem. Seek immediate medical attention if bleeding is heavy or accompanied by severe pain.",
    },
    {
      "title": "Severe Abdominal Pain",
      "description":
      "Sudden or persistent abdominal pain during pregnancy could be a sign of an ectopic pregnancy, appendicitis, or other complications. Don't hesitate to call your doctor or go to the emergency room.",
    },
    {
      "title": "High Fever During Pregnancy",
      "description":
      "A high fever (above 100.4°F) during pregnancy can be harmful to the developing baby. Consult your doctor or go to the emergency room if you experience a high fever.",
    },
    {
      "title": "Decreased Fetal Movement",
      "description":
      "A noticeable decrease in fetal movement can be a sign of potential problems. Contact your doctor or midwife immediately to get checked.",
    },
    {
      "title": "Symptoms of Preeclampsia",
      "description":
      "Preeclampsia is a serious pregnancy complication characterized by high blood pressure and other symptoms. If you experience sudden weight gain, severe headaches, or blurry vision, seek immediate medical attention.",
    },
    {
      "title": "Preterm Labor Signs",
      "description":
      "Regular contractions before 37 weeks of pregnancy could indicate preterm labor. Watch for signs like pelvic pressure, cramping, and lower back pain. Call your doctor or go to the emergency room if you suspect preterm labor.",
    },
    {
      "title": "Signs of Infection",
      "description":
      "Fever, chills, and intense pain can be signs of an infection that might require medical attention. Don't hesitate to contact your doctor or go to the emergency room if you suspect an infection during pregnancy.",
    },
    {
      "title": "Mental Health Concerns",
      "description":
      "Experiencing severe anxiety, depression, or suicidal thoughts during pregnancy requires immediate attention. Reach out to your doctor or a mental health professional and seek help.",
    },
    {
      "title": "Head Injury During Pregnancy",
      "description":
      "A blow to the head during pregnancy can be serious for both mother and baby. Seek medical attention immediately if you experience a head injury.",
    },
    {
      "title": "Vaginal Discharge Changes",
      "description":
      "Changes in vaginal discharge during pregnancy are common, but unusual color, odor, or itching could indicate an infection. Consult your doctor if you experience these symptoms."
    },
    {
      "title": "Group B Strep (GBS) Test",
      "description":
      "Group B Strep (GBS) is a bacteria commonly found in the vagina and rectum. A GBS test during pregnancy helps determine if treatment is needed to reduce the risk of infection in the newborn."
    },
    {
      "title": "Rhesus Factor Incompatibility",
      "description":
      "Rhesus factor incompatibility occurs when a pregnant woman is Rh-negative and the baby is Rh-positive. In some cases, this can lead to complications. Regular prenatal care and treatment can help manage the risk."
    },
    {
      "title": "Placenta Abruption",
      "description":
      "Placenta abruption is a serious condition where the placenta partially or completely separates from the uterine wall before birth. Symptoms can include severe abdominal pain and vaginal bleeding. Seek immediate medical attention if you suspect placenta abruption."
    },
    {
      "title": "Umbilical Cord Complications",
      "description":
      "Umbilical cord complications, such as prolapse (cord protruding from the cervix) or knots, can be emergencies. Be aware of the signs and symptoms and call your doctor or go to the emergency room if necessary."
    },
    {
      "title": "Amniotic Fluid Leakage or Rupture",
      "description":
      "Leaking or rupturing of the amniotic sac (your water breaking) can be a sign of labor or potential complications. Contact your doctor or midwife immediately if you experience leaking fluids."
    },
    {
      "title": "Shoulder Dystocia",
      "description":
      "Shoulder dystocia occurs when the baby's shoulder gets stuck during delivery. It can be a difficult delivery requiring maneuvers or surgical intervention. Be aware of the risk factors and discuss them with your doctor."
    },
    {
      "title": "Postpartum Hemorrhage",
      "description":
      "Excessive bleeding after childbirth is a serious concern. Medical intervention is necessary to control bleeding and prevent complications."
    },
    {
      "title": "Infection After Delivery",
      "description":
      "Infections after delivery, such as C-section site infection or endometritis (uterine lining infection), can occur. Signs include fever, pain, and unusual vaginal discharge. Seek medical attention if you experience these symptoms."
    },
    {
      "title": "Blood Clots After Delivery",
      "description":
      "Blood clots can form after delivery, especially after a C-section. Be aware of the risks and symptoms like leg pain, swelling, and redness. Early detection and treatment are crucial."
    },
    {
      "title": "Preeclampsia After Delivery",
      "description":
      "Preeclampsia can sometimes develop or worsen after childbirth. Monitor your blood pressure and be aware of the signs and symptoms. Seek medical attention if you experience concerning symptoms."
    },
    {
      "title": "Mental Health After Delivery",
      "description":
      "The postpartum period can be emotionally challenging. Be aware of the signs of postpartum depression or anxiety. Don't hesitate to seek help from a doctor or mental health professional."
    },
    {
      "title": "Newborn Breathing Problems",
      "description":
      "Newborns may experience breathing difficulties due to various reasons. Signs include rapid breathing, grunting, or retracting of the chest. Seek immediate medical attention if you observe these issues."
    },
    {
      "title": "Jaundice in Newborns",
      "description":
      "Jaundice is a yellowing of the skin and eyes in newborns due to a buildup of bilirubin. While it's common, excessive jaundice might require treatment. Follow your doctor's recommendations."
    },
    {
      "title": "Birth Injuries",
      "description":
      "Birth injuries, though uncommon, can occur during delivery. Be aware of the potential risks and seek medical attention if you suspect your baby has sustained an injury."
    },
    {
      "title": "Seizures in Newborns",
      "description":
      "Seizures in newborns can be caused by various factors. It's a serious concern that requires immediate medical attention."
    },
    {
      "title": "Feeding Difficulties in Newborns",
      "description":
      "Newborns may experience difficulty latching, sucking, or coordinating swallowing. Seek help from a lactation consultant or healthcare professional if you're facing breastfeeding challenges."
    },
    {
      "title": "Slow Weight Gain in Newborns",
      "description":
      "If your baby isn't gaining weight at the expected rate, it could indicate an underlying issue. Consult your pediatrician to discuss feeding practices and monitor your baby's growth."
    },
    {
      "title": "Fever in Newborns",
      "description":
      "A fever in a newborn can be a sign of infection. Because their immune systems are still developing, even a low fever requires medical attention. Contact your pediatrician immediately if your baby has a fever."
    },
    {
      "title": "Shaking or Tremors in Newborns",
      "description":
      "Occasional tremors in newborns are normal, but persistent shaking can indicate a problem. Consult your pediatrician if you notice excessive shaking or tremors in your baby."
    },
  ];
}
