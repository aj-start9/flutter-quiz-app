import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key, required this.startQuizText, required this.switchScreen});

  final String startQuizText;
  final void Function() switchScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(
            opacity: 0.5,
            child: Image.asset(
              'assets/images/quiz-logo.png',
              width: 200,
              height: 200,
            ),
          ),
          const SizedBox(height: 80),
          Text(
            startQuizText,
            style: const TextStyle(color: Colors.white, fontSize: 24),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: () {
              switchScreen();
            },
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.all(16.0),
              foregroundColor: Colors.white,
            ),
            label: const Text('Start Quiz', style: TextStyle(
              fontSize: 15
            ),),
            icon: const Icon(Icons.arrow_right_alt, size: 30),
          ),
        ],
      ),
    );
  }
}
