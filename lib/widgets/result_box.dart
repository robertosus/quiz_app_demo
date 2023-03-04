import 'package:flutter/material.dart';
import '../constants.dart';

class ResultBox extends StatelessWidget {
  const ResultBox({
    Key? key,
    required this.result,
    required this.questionLength,
    required this.onPressed,
  }) : super(key: key);
  final int result;
  final int questionLength;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Attention"),
      backgroundColor: background,
      content: Text('Anda telah menyelesaikan quiz, Congratulations'),
      actions: [
        TextButton(onPressed: onPressed, child: const Text("Back to Home"))
      ],
    );
  }
}
