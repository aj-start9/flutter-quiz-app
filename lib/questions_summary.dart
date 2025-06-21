import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children:
              summaryData.map((summary) {
                return Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 35,
                        height: 35,
                        margin: EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                          color: summary['user_answer'] == summary['corect_answer'] ? Colors.green: Colors.yellow,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          ((summary['question_index'] as int) + 1)!.toString(),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              summary['question'] as String,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              summary['user_answer'] as String,
                              style: TextStyle(fontSize: 18, color: Colors.yellow),
                            ),
                            Text(
                              summary['corect_answer'] as String,
                              style: TextStyle(fontSize: 18, color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}
