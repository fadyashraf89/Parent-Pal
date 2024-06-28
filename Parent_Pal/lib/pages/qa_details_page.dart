import 'package:flutter/material.dart';
import 'package:parent_pal/models/footer.dart';

class QADetailPage extends StatelessWidget {
  final String question;
  final String date;
  final String answer;

  QADetailPage({required this.question, required this.date, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FooterWidget(),
      backgroundColor: Color(0xFFF8F8F8),
      appBar: AppBar(
        backgroundColor: Color(0xFF5571A7),
        title: Padding(
          padding: const EdgeInsets.only(left: 50.0),
          child: Text(
            'Q&A Detail',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Image.asset(
            "assets/images/app-logo.png",
            width: 50,
            height: 50,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20.0),
                Text(
                  'Question:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5571A7),
                    fontFamily: "Rubik",
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  question,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Rubik",
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Date:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5571A7),
                    fontFamily: "Rubik",
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Rubik",
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Answer:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5571A7),
                    fontFamily: "Rubik",
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  answer.isEmpty ? 'No answer provided yet.' : answer,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Rubik",
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
}
