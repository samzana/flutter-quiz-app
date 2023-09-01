import 'package:flutter/material.dart';

void startQuiz() {}

class MyHomePage extends StatelessWidget {
  const MyHomePage(this.startQuiz, {Key? key}) : super(key: key);

  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage('assets/images/quiz-logo.png'),
            width: 250,
            color: Colors.white38,
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            'Learn Flutter the fun way!',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(height: 50),
          OutlinedButton.icon(
              onPressed: startQuiz,
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.purple[900],
              ),
              icon: const Icon(
                Icons.arrow_right_alt,
                color: Colors.white,
              ),
              label: const Text(
                'Start Quiz',
                style: TextStyle(color: Colors.white),
              )
          )
        ],
      ),
    );
  }
}
