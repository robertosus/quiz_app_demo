import 'package:flutter/material.dart';
import '../constants.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({
    Key? key,
    required this.option,
    required this.color,
  }) : super(key: key);
  final String option;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        border: Border.all(color: color, width: 4),
      ),
      width: 160,
      height: 65,
      child: Center(
        child: Text(
          option,
          textAlign: TextAlign.center,
          style: semiBold.copyWith(fontSize: 18),
        ),
      ),
    );
  }
}
