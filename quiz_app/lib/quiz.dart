import 'package:flutter/material.dart';
import 'package:quiz_app/home_page.dart';
import 'package:quiz_app/questions_page.dart';
import 'package:quiz_app/result_page.dart';
import 'package:quiz_app/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;
  // void initState() {
  //   activeScreen = HomePage(switchScreen);
  //   super.initState();
  // }

  List<String> selectedAnswers = [];

  var activeScreen = 'home-page';
  void switchScreen() {
    setState(() {
      activeScreen = 'questions-page';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-page';
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = HomePage(switchScreen);

    if (activeScreen == 'questions-page') {
      screenWidget = QPage(
        onSelectAnswer: chooseAnswer,
      );
    }
    if (activeScreen == 'result-page') {
      screenWidget = ResultPage(
          selectedAnswers: selectedAnswers,
          restart: () {
            setState(() {
              activeScreen = 'home-page';
              selectedAnswers = [];
            });
          });
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.lime, Colors.blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
