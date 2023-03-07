import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:quiz_app/widgets/next_button.dart';

class DoneScreen extends StatelessWidget {
  const DoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Image.asset('assets/logo.png', width: 50)),
        SizedBox(height: 30),
        Text('Well done!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
        SizedBox(height: 12),
        Text(
            'Kamu telah mempelajari banyak ilmu\nbaru hari ini, good for your career',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16)),
      ],
    );
  }
}
