import 'package:flutter/material.dart';

class QADetailPage extends StatelessWidget {
  final String question;
  final String date;
  final String answer;
  final ValueChanged<String> onAnswerSubmitted;

  const QADetailPage({
    required this.question,
    required this.date,
    required this.answer,
    required this.onAnswerSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    String currentAnswer = answer;

    return Scaffold(
      appBar: AppBar(
        title: Text('Answer Question'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Question:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(question, style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Text(
              'Date:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(date, style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Text(
              'Answer:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextField(
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: 'Enter your answer...',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                currentAnswer = value;
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                onAnswerSubmitted(currentAnswer);
                Navigator.pop(context);
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
