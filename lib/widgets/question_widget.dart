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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Image.asset(imageQuestion, width: 342, height: 240),
        ),
        SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            '$question',
            style: Bold.copyWith(fontSize: 24),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
