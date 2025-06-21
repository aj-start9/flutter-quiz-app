import 'package:dice_play/data/questions.dart';
import 'package:dice_play/question_screen.dart';
import 'package:dice_play/questions_summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.backToStart,
    required this.chooseAnswer,
  });

  final void Function() backToStart;
  final List<String> chooseAnswer;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chooseAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'corect_answer': questions[i].answers[0],
        'user_answer': chooseAnswer[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final sumaryData = getSummaryData();
    final totalQuestion = questions.length;
    final correctQuestion =
        sumaryData?.where((element) {
          return element['user_answer'] == element['corect_answer'];
        })?.length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(left: 40, right: 40),
              child: Text(
                'You answered $correctQuestion out $totalQuestion questions correctly!',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(fontSize: 25, color: Colors.white),
              ),
            ),
            SizedBox(height: 60),
            QuestionsSummary(getSummaryData()),
            SizedBox(height: 20),
            TextButton(
              onPressed: backToStart,
              child: Text(
                "Back To Start",
                style: TextStyle(fontSize: 20, color: Colors.lightBlue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
