import 'package:flutter/material.dart';
import 'package:flutter_sticky_widgets/flutter_sticky_widgets.dart';
import 'package:quiz_app/screens/quiz_screen.dart';
import '../constants.dart';

class Button extends StatelessWidget {
  Button({Key? key, required this.press, required this.text}) : super(key: key);

  final VoidCallback press;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.all(40),
        height: 45,
        width: MediaQuery.of(context).size.width - (2 * 24),
        decoration: BoxDecoration(
          color: primary,
          borderRadius: BorderRadius.circular(100.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 16.0, color: neutral, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
