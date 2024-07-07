import 'package:flutter/material.dart';
import 'package:parent_pal/models/MyAppBar.dart';

class AboutParentPal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight), // Adjust height if needed
        child: MyAppBar(PageName: "About Parent Pal"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display the logo or a representative image
              Center(
                child: Image.asset(
                  'assets/images/app-logo.png',
                  height: 100,
                ),
              ),
              SizedBox(height: 20),
              // Title
              Center(
                child: Text(
                  'Parent Pal',
                  style: TextStyle(
                    fontSize: 45,
                    fontFamily: 'Pacifico',
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5571A7),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Description
              Container(
                child: Column(
                  children: [
                    Text(
                      'Parent Pal is your ultimate parenting companion. Whether you’re preparing for the arrival of your little one or navigating the adventures of raising a child, Parent Pal is designed to support you every step of the way. Here’s what makes Parent Pal an essential tool for every parent. Parent Pal is an innovative mobile application developed using Flutter and Dart, integrated wiFirebase, designed to address a my riad of parenting challenges, encompassing behavioral, psychological, and special needs aspects. The motivation behind this project stems from the complex and interconnected nature of parenting issues, which often require a comprehensive a holistic solution. Parenting is an intricate journey that involves various facets such as understanding children behavior, managing psychological well-being, and addressing special needs. Despite the plethorof resources available, parents often struggle to find a centralized platform that effectively coversall these aspects. This fragmentation leads to inefficiencies and gaps in addressing the multifaceted challenges faced by parents. Recognizing this significant gap, Parent Pal was conceived to offer a unified solution that empowers parents with insights, strategies, and resources, thereby facilitating a more holistic approach to parenting.',
                      style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                    ),
                    SizedBox(height: 20),
                    // Features List
                    Text(
                      'Key Features',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Personalized Parenting Guidance: Tailor your parenting experience with personalized tips and advice based on your child’s age and developmental stage. Receive expert insights and recommendations on nutrition, sleep routines, educational activities, and more, curated specifically for your parenting needs.\n'
                          '\nComprehensive Pregnancy Support: Track your pregnancy week-by-week with detailed insights into your baby’s development and changes in your body. Access a library of resources on prenatal care, birthing plans, and emotional well-being to ensure a healthy and informed pregnancy journey.\n'
                          '\nInteractive Learning and Development Tools: Engage your child with interactive activities and educational games designed to promote cognitive and emotional growth. Explore a variety of learning materials and resources tailored to enhance your child’s skills and curiosity.\n'
                          '\nCommunity and Support Network: Connect with a community of like-minded parents to share experiences, seek advice, and find emotional support. Join forums and groups to discuss common parenting topics, challenges, and milestones with others who understand your journey.\n'
                          '\nExpert-Backed Advice and Resources: Access a wealth of articles, videos, and guides from trusted parenting experts and healthcare professionals. Stay informed with up-to-date content on child health, safety, and well-being to make confident parenting decisions.\n'
                          '\nFamily Health and Wellness Tracking: Monitor your family’s health with tools to track immunizations, medical appointments, and growth milestones. Receive reminders and alerts for important health check-ups and developmental screenings.\n'
                          '\nCustomizable Routines and Schedules: Create and manage daily routines to establish healthy habits and consistent schedules for your child. Utilize the built-in calendar to organize activities, nap times, and meal plans, ensuring a balanced and structured day.\n'
                          '\nSafety and Emergency Resources: Equip yourself with vital information on child safety, first aid, and emergency procedures. Access quick guides and checklists to be prepared for any situation, from minor injuries to critical emergencies.\n'
                          '\nSeamless Multi-Device Integration: Sync your Parent Pal account across multiple devices for convenient access to your parenting resources anytime, anywhere. Share and collaborate on family schedules and information with other caregivers and family members.\n'
                          '\nUser-Friendly and Intuitive Design: Enjoy a beautifully designed, easy-to-navigate interface that simplifies your parenting journey. Find what you need quickly and efficiently, from tracking tools to informative content and community forums.',
                      style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                    ),
                    SizedBox(height: 20),
                    // Closing Statement
                    Text(
                      'Parent Pal is dedicated to empowering parents with the knowledge, tools, and community needed to nurture happy, healthy, and thriving children. Join the Parent Pal family today and embrace the joy of parenting with confidence and ease!Parent Pal is designed to bridge this gap by offering a comprehensive, digital platform that consolidates various aspects of parenting support into a single, user-friendly application. By leveraging modern technology, Parent Pal provides parents with the tools they need to addresscommon parenting challenges in a manner that is both convenient and effective. This holisticapproach ensures that parents can find reliable information and practical solutions tailored to their unique circumstances, all within the comfort of their own homes.',
                      style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
