import 'package:first_app/data/questions.dart';
import 'package:first_app/questions_summary.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.selectedAnswers, this.onRestartQuiz, {Key? key})
      : super(key: key);

  final void Function() onRestartQuiz;
  final List<String> selectedAnswers;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].question,
          'correct_answer': questions[i].answers[0],
          'user_answer': selectedAnswers[i]
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    var summaryData = getSummaryData();
    var numTotalQuestions = questions.length;
    var numCorrectQuestions = summaryData.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
              child: Text(
                'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 25),
            QuestionsSummary(getSummaryData()),
            const SizedBox(height: 25),
            TextButton.icon(
              icon: const Icon(
                Icons.refresh,
                color: Colors.white,
              ),
              label: const Text(
                "Restart Quiz!",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: onRestartQuiz,
            )
          ],
        ),
      ),
    );
  }
}
