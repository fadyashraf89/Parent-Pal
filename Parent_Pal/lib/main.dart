import 'package:flutter/material.dart';
import 'package:parent_pal/pages/about.dart';
import 'package:parent_pal/pages/activities.dart';
import 'package:parent_pal/pages/add-child.dart';
import 'package:parent_pal/pages/consultation-page.dart';
import 'package:parent_pal/pages/login_page.dart';
import 'package:parent_pal/pages/menu.dart';
import 'package:parent_pal/pages/settings.dart';
import 'package:parent_pal/pages/sign-up.dart';
import 'package:parent_pal/pages/bedtime_stories_page.dart';
import 'package:parent_pal/pages/birth_education.dart';
import 'package:parent_pal/pages/calm_journey.dart';
import 'package:parent_pal/pages/child_homepage.dart';
import 'package:parent_pal/pages/common_issues_among_children.dart';
import 'package:parent_pal/pages/emergencies_page.dart';
import 'package:parent_pal/pages/sign-up.dart';
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


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Check if Firebase has already been initialized
  bool hasBeenInitialized = await Firebase.initializeApp().then((_) => true).catchError((_) => false);

  if (!hasBeenInitialized) {
    // Initialize Firebase if it hasn't been done yet
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyD5Su9Zn-K7TfauGrSUrcOY3lAHtN-fRnA",
        authDomain: "parent-pal-f9258.firebaseapp.com",
        projectId: "parent-pal-f9258",
        storageBucket: "parent-pal-f9258.appspot.com",
        messagingSenderId: "675045068250",
        appId: "1:675045068250:web:8ea5970d1c5f5f3872c4e3",
      ),
    );
  }

  runApp(const ParentPal());
}


class ParentPal extends StatelessWidget {
  const ParentPal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       // home: ProblemCategories(),
      // home: SignUpPage(),
        home: ChildHomePage(name: 'Ahmed', image: 'assets/images/avatar.png'),
      // home: PregnantHomePage(name: "Hoda"),
      routes: {
    '/login': (context) => LoginPage(),
    '/signup': (context) => SignUpPage(),
    '/addChild': (context) => AddChildPage(),
    '/menu': (context) => MenuPage(),
    '/aboutParentPal': (context) => AboutParentPal(),
    '/settings': (context) => settings(),
    },
    );

  }
}
