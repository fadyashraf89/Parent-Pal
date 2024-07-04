import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  final String question;
  final String date;
  final String answer;
  final ValueChanged<String> onAnswer;

  QuestionCard({
    required this.question,
    required this.date,
    required this.answer,
    required this.onAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 2), // Shadow position
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Question:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF5571A7),
            ),
          ),
          SizedBox(height: 8),
          Text(
            question,
            style: TextStyle(
              fontSize: 16,
              fontFamily: "Rubik",
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Date:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF5571A7),
            ),
          ),
          SizedBox(height: 8),
          Text(
            date,
            style: TextStyle(
              fontSize: 16,
              fontFamily: "Rubik",
            ),
          ),
          SizedBox(height: 10),
          answer.isEmpty
              ? Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Answer:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5571A7),
                ),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  // Navigate to a page where consultant can answer
                  // This functionality depends on your app flow
                },
                child: Text(
                  'Answer Question',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF5571A7),
                ),
              ),
            ],
          )
              : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Answer:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5571A7),
                ),
              ),
              SizedBox(height: 8),
              Text(
                answer,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Rubik",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
