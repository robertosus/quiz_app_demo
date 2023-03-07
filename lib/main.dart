import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/screens/home_screen.dart';

import 'models/question_model.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

final _question = [
  Question(
    title:
        'Method pada stateFul widget yang untuk menghancurkan object saat aplikasi tidak digunakan?',
    image: 'assets/question1.png',
    desc:
        'DISPOSE: Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium',
    options: {
      'logging': false,
      'setState': false,
      'dispose': true,
      'initState': false
    },
  ),
  Question(
    title: 'Method pada stateFul widget yang hanya dijalankan sekali?',
    image: 'assets/logo.png',
    desc:
        'INIT STATE: But I must explain to you how all this mistaken idea of denouncing',
    options: {
      'logging': false,
      'initState': true,
      'setState': false,
      'dispose': false
    },
  ),
];
