import 'package:flutter/material.dart';
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
  Menu(
      name: 'Basic UI Design',
      total: questions.length,
      image: 'assets/image 3.png'),
  Menu(name: 'Basic UI Design', total: 183, image: 'assets/image 3.png'),
  Menu(name: 'Basic UI Design', total: 183, image: 'assets/image 3.png'),
];

//!Model question
List<Question> questions = [
  Question(
    title: 'Apakah nama dari UI component di atas?',
    image: 'assets/question1.png',
    desc:
        'Button adalah komponen pada UI yang membantu pengguna untuk melakukan sebuah aksi misalnya memasukkan item kepada keranjang pada website atau aplikasi toko online.',
    options: {
      'Button': true,
      'Click': false,
      'Anchor': false,
      'TapClick': false
    },
  ),
  Question(
    title: 'Apakah nama dari UI component di atas?',
    image: 'assets/question2.png',
    desc:
        'Checkbox dapat membantu pengguna untuk memilih item apa saja (lebih dari satu item) yang dibutuhkan oleh pengguna sebelum melakukan proses checkout.',
    options: {
      'Option': false,
      'Choices': false,
      'Checkbox': true,
      'Select': false
    },
  ),
  Question(
      title: 'Apakah nama dari UI component di atas?',
      image: 'assets/question3.png',
      desc:
          'Checkbox dapat membantu pengguna untuk memilih item apa saja (lebih dari satu item) yang dibutuhkan oleh pengguna sebelum melakukan proses checkout.',
      options: {
        'Add Value': false,
        'Column': false,
        'Email Input': false,
        'Text Field': true
      }),
  Question(
      title: 'Apakah nama dari\nhalaman di atas?',
      image: 'assets/question4.png',
      desc:
          'Ketika layanan atau konten sedang tidak tersedia pada aplikasi maka kita bisa menyediakan sebuah halaman Empty State untuk menjelaskan keadaan saat itu, sehingga pengguna tidak bingung dan dapat melanjutkan aktivitas lainnya.',
      options: {
        '404 Page': false,
        'Empty State': true,
        'Onboarding': false,
        'Settings': false
      })
];
