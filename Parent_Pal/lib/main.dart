import 'package:flutter/material.dart';
import 'package:parent_pal/models/behavioral_problems.dart';
import 'package:parent_pal/pages/activities.dart';
import 'package:parent_pal/pages/articles.dart';
import 'package:parent_pal/pages/birth_education.dart';
import 'package:parent_pal/pages/calm_journey.dart';
import 'package:parent_pal/pages/child_homepage.dart';
import 'package:parent_pal/pages/common_issues_among_children.dart';
import 'package:parent_pal/pages/emergencies_page.dart';
import 'package:parent_pal/pages/videos.dart';
import 'package:parent_pal/pages/nutrition.dart';
import 'package:parent_pal/pages/pregnancy_emergencies.dart';
import 'package:parent_pal/pages/pregnant_home_page.dart';
import 'package:parent_pal/pages/problems_categories.dart';
import 'package:parent_pal/pages/problems_facing_children.dart';
import 'package:parent_pal/pages/problems_facing_parents.dart';
import 'package:parent_pal/pages/resources.dart';
import 'package:parent_pal/pages/suggest_schools.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:parent_pal/pages/videos.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ParentPal());
}


class ParentPal extends StatelessWidget {
  const ParentPal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       // home: HomePage()
      // home: ActivitiesScreen()
        home: ChildHomePage(name: 'John', age: 5, image: 'assets/images/fido.png')
      // home: PregnantHomePage(name: "fofa"),
    );
  }
}
