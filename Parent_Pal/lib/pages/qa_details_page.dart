import 'package:flutter/material.dart';

class QADetailPage extends StatefulWidget {
  final String question;
  final String date;
  final List<String> answers;
  final ValueChanged<List<String>> onAnswerSubmitted;

  const QADetailPage({
    required this.question,
    required this.date,
    required this.answers,
    required this.onAnswerSubmitted,
  });

  @override
  _QADetailPageState createState() => _QADetailPageState();
}

class _QADetailPageState extends State<QADetailPage> {
  late List<String> answers;

  @override
  void initState() {
    super.initState();
    answers = List.from(widget.answers); // Initialize the answers list
  }

  void _submitAnswer(String answer) {
    setState(() {
      answers.add("Answer ${answers.length + 1}: $answer");
    });
    widget.onAnswerSubmitted(answers);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    String currentAnswer = '';

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
            Text(widget.question, style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Text(
              'Date:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(widget.date, style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Text(
              'Answers:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: answers.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(answers[index], style: TextStyle(fontSize: 16)),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
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
              onPressed: () => _submitAnswer(currentAnswer),
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
