import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:quiz_app/widgets/next_button.dart';

class Description extends StatelessWidget {
  const Description({super.key, required this.desc, required this.pressed});

  final String desc;
  final VoidCallback pressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          desc,
          textAlign: TextAlign.justify,
          style: const TextStyle(fontSize: 16),
        ),
        SizedBox(height: 69),
        GestureDetector(
          onTap: pressed,
          child: NextButton(),
        ),
        SizedBox(height: 40)
      ],
    );
  }
}
