import 'package:flutter/material.dart';
import 'package:flutter_sticky_widgets/flutter_sticky_widgets.dart';
import '../constants.dart';

class NextButton extends StatelessWidget {
  const NextButton({Key? key, required this.press}) : super(key: key);

  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(bottom: 40),
        height: 45,
        width: MediaQuery.of(context).size.width - (2 * 24),
        decoration: BoxDecoration(
          color: primary,
          borderRadius: BorderRadius.circular(100.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: const Text(
          'Next Question',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 16.0, color: neutral, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
