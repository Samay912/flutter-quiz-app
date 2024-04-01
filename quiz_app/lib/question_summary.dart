import 'package:flutter/material.dart';
import 'package:quiz_app/summary_item.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;
  @override
  Widget build(context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            children: summaryData.map(
              (data) {
                return SummaryItem(data);
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
