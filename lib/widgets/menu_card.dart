// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:quiz_app/constants.dart';
import 'package:quiz_app/models/question_model.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({
    Key? key,
    required this.id,
    required this.name,
    required this.total,
    required this.image,
    required this.pressed,
    required this.question,
  }) : super(key: key);

  final int id;
  final String name;
  final int total;
  final String image;
  final List<Question> question;
  final VoidCallback pressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pressed,
      child: Container(
        padding: EdgeInsets.only(left: 16),
        width: 160,
        height: 157,
        decoration: BoxDecoration(
            color: neutral, borderRadius: BorderRadius.circular(16)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: 16),
          Image.asset(image, width: 48),
          const SizedBox(height: 30),
          Text(name,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          const SizedBox(height: 2),
          Text('${total} quizzes',
              style: const TextStyle(color: Color(0xFF999AA4)))
        ]),
      ),
    );
  }
}
