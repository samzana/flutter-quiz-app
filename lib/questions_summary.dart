import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {Key? key}) : super(key: key);

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: SingleChildScrollView(
        child: Column(
            children: summaryData.map((data) {
          return Row(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 15, 0),
              child: Container(
                alignment: Alignment.center,
                width: 20,
                height: 20,
                decoration: ShapeDecoration(
                  shape: const CircleBorder(),
                  color: data['user_answer'] == data['correct_answer']
                  ? Colors.blue[200]
                  : Colors.purple[400],
                ),
                child: Text(
                  ((data['question_index'] as int) + 1).toString(),
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'] as String,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        data['correct_answer'] as String,
                        style: TextStyle(
                          color: Colors.purple[400],
                        ),
                        textAlign: TextAlign.start,
                      ),
                      Text(data['user_answer'] as String,
                        style: TextStyle(
                          color: Colors.blue[200],
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ]
                  ),
                ),
              ),
          ]);
        }).toList()),
      ),
    );
  }
}
