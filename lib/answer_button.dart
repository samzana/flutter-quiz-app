import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.answerText, this.onTap, {Key? key}) : super(key: key);

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap, 
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
         primary: const Color.fromARGB(255, 33, 1, 95),
         shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        )
      ),
      child: Text(
        answerText, 
        textAlign: TextAlign.center,
      )
    );
  }
}

