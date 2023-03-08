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
      home: TestParsing(),
    );
  }
}

class TestParsing extends StatefulWidget {
  const TestParsing({super.key});

  @override
  State<TestParsing> createState() => _TestParsingState();
}

class _TestParsingState extends State<TestParsing> {
  List<Question>? result;
  Future loadData() async {
    //! Ambil data namun dalam bentuk string
    String getData = await rootBundle.loadString('assets/question.json');
    //! Convert menjadi object map
    List data = jsonDecode(getData);

    //! Karena list of map, maka ditransfrom terlebih dahulu untuk mengubah data object ke dalam dart dalam bentuk list
    List<Question> transformData =
        data.map((e) => Question.fromJson(e)).toList();

    setState(() {
      result = transformData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(
            child: ElevatedButton(
                onPressed: () {
                  loadData();
                },
                child: Text('Click data')),
          ),
          SizedBox(height: 30),
          Text('${result?[1].options.map((e) => e.isCorrect).toList()}')
        ]),
      ),
    );
  }
}

//!Model menu Card
final List<Menu> menu = [
  Menu(name: 'Basic UI Design', total: 7, image: 'assets/image 3.png'),
  Menu(name: 'Basic UI Design', total: 183, image: 'assets/image 3.png'),
  Menu(name: 'Basic UI Design', total: 183, image: 'assets/image 3.png'),
];
