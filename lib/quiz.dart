import 'package:first_app/data/questions.dart';
import 'package:first_app/questions_screen.dart';
import 'package:first_app/results_screen.dart';
import 'package:flutter/material.dart';
import 'my_home_page.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];

  var activeScreen = 'start-screen';

  void changeScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = MyHomePage(changeScreen);

    if (activeScreen == 'start-screen') {
      screenWidget = MyHomePage(changeScreen);
    } else if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(chooseAnswer);
    } else {
      screenWidget = ResultsScreen(selectedAnswers, restartQuiz);
    }

    return MaterialApp(
      title: 'Quiz App',
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
