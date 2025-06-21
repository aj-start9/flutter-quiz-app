import 'package:dice_play/data/questions.dart';
import 'package:dice_play/question_screen.dart';
import 'package:dice_play/results_screen.dart';
import 'package:dice_play/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:dice_play/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void backToStart() {
    setState(() {
      activeScreen = 'start-screen';
      selectedAnswers = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget =
        activeScreen == 'start-screen'
            ? StartScreen(
              startQuizText: 'Learn Flutter the fun way!',
              switchScreen: switchScreen,
            )
            : QuestionScreen(onSelectAnswer: chooseAnswer);

    screenWidget =
        activeScreen == 'results-screen'
            ? ResultsScreen(
              backToStart: backToStart,
              chooseAnswer: selectedAnswers,
            )
            : screenWidget;

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 98, 8, 140),
                Color.fromARGB(255, 86, 11, 132),
              ],
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
