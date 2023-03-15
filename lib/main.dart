import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/providers/menu_provider.dart';
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
    return ChangeNotifierProvider(
        create: (context) => MenuProvider(),
        child: MaterialApp(
          theme: ThemeData(
              textTheme:
                  GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)),
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
        ));
  }
}
