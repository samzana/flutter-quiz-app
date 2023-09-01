import 'package:first_app/answer_button.dart';
import 'package:first_app/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.onSelectAnswer, {Key? key}) : super(key: key);

  final void Function(String) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      margin: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            questions[currentQuestionIndex].question,
            /*style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 237, 223, 252),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),*/
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          ...questions[currentQuestionIndex].shuffleAnswers().map((answer) {
            return AnswerButton(answer, () {
              answerQuestion(answer);
            });
          })
        ],
      ),
    ));
  }
}
