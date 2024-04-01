import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {super.key, required this.selectedAnswers, required this.restart});
  final List<String> selectedAnswers;
  final void Function() restart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summaryData = [];
    for (var i = 0; i < selectedAnswers.length; i++) {
      summaryData.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].options[0],
        'user_answer': selectedAnswers[i],
      });
    }
    return summaryData;
  }

  @override
  Widget build(BuildContext context) {
    var summaryData = getSummaryData();
    final totalQuestions = questions.length;
    final correctAnswers = summaryData
        .where((data) => data['correct_answer'] == data['user_answer'])
        .length;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lime, Colors.blue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You answered $correctAnswers out of $totalQuestions questions correctly!',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              QuestionSummary(summaryData: summaryData),
              const SizedBox(height: 30),
              TextButton.icon(
                icon: const Icon(Icons.refresh),
                label: const Text('Restart Quiz'),
                onPressed: restart,
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
