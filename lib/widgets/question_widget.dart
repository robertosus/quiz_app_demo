import 'package:flutter/material.dart';
import '../constants.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget(
      {Key? key,
      required this.question,
      required this.imageQuestion,
      required this.indexAction,
      required this.totalQuestions})
      : super(key: key);

  final String question;
  final String imageQuestion;
  final int indexAction;
  final int totalQuestions;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30),
        Container(
            width: MediaQuery.of(context).size.width - (2 * 24),
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Image.asset(
                imageQuestion,
                width: 302,
                height: 200,
              ),
            )),
        SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            '$question',
            style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
