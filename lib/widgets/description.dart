import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:quiz_app/widgets/next_button.dart';

class Description extends StatelessWidget {
  const Description({super.key, required this.desc});

  final String desc;
  @override
  Widget build(BuildContext context) {
    return Text(
      desc,
      textAlign: TextAlign.left,
      style: const TextStyle(fontSize: 16, height: 1.8),
    );
  }
}
