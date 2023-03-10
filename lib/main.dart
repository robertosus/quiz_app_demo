import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/screens/home_screen.dart';

import 'models/menuQuiz_model.dart';
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

//!Model menu Card
final List<Menu> menu = [
  Menu(id: 1, name: 'Basic UI Design', total: 7, image: 'assets/image 3.png'),
  Menu(id: 2, name: 'Basic UI Design', total: 183, image: 'assets/image 3.png'),
  Menu(id: 3, name: 'Basic UI Design', total: 183, image: 'assets/image 3.png'),
];
