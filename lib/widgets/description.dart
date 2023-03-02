import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:quiz_app/widgets/next_button.dart';

class Description extends StatelessWidget {
  const Description({super.key, required this.desc, required this.press});

  final VoidCallback press;
  final String desc;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          desc,
          textAlign: TextAlign.justify,
          style: const TextStyle(fontSize: 16),
        ),
        SizedBox(height: 30),
        GestureDetector(onTap: press, child: NextButton())
      ],
    );
  }
}
