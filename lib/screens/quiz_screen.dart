import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:quiz_app/screens/done_screen.dart';
import 'package:quiz_app/screens/home_screen.dart';
import 'package:quiz_app/widgets/next_button.dart';

import '../constants.dart';
import '../models/question_model.dart';
import '../widgets/description.dart';
import '../widgets/option_card.dart';
import '../widgets/question_widget.dart';
import '../widgets/result_box.dart';

final List<Question> _questions = [
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

bool changeWidget = false;
bool isAlreadySelected = false;
bool isPressed = false;
int index = 0;
int score = 0;
String select = '';
bool itsDone = false;

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  void nextQuestion(int questionLength) {
    if (index == questionLength - 1) {
      setState(() {
        itsDone = true;
      });
    } else if (isPressed) {
      setState(() {
        index++;
        isPressed = false;
        isAlreadySelected = false;
        changeWidget = false;
      });
    }
  }

  void checkAnswerAndUpdate(bool value, String answer) {
    if (isAlreadySelected) {
      return;
    } else {
      Future.delayed(
        Duration(milliseconds: 800),
        () {
          if (value == true) {
            score++;
          }
          setState(() {
            isPressed = true;
            isAlreadySelected = true;
            select = answer;
            changeWidget = !changeWidget;
          });
        },
      );
    }
  }

  void startOver() {
    setState(() {
      index = 0;
      isPressed = false;
      isAlreadySelected = false;
      changeWidget = false;
      playQuiz = true;
      itsDone = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        playQuiz == true
            ? HomeScreen()
            : index == _questions.length - 1 && itsDone == true
                ? DoneScreen()
                : Column(
                    children: [
                      QuestionWidget(
                        indexAction: index,
                        question: _questions[index].title,
                        imageQuestion: _questions[index].image,
                        totalQuestions: _questions.length,
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: changeWidget
                            ? Container(
                                width: MediaQuery.of(context).size.width,
                                height: 189,
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: SingleChildScrollView(
                                        child: Description(
                                          desc: _questions[index].desc,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : GridView.count(
                                childAspectRatio: 2,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                mainAxisSpacing: 24,
                                crossAxisSpacing: 22,
                                crossAxisCount: 2,
                                children: [
                                  for (int i = 0;
                                      i < _questions[index].options.length;
                                      i++)
                                    GestureDetector(
                                      onTap: () {
                                        checkAnswerAndUpdate(
                                          _questions[index]
                                              .options
                                              .values
                                              .toList()[i],
                                          _questions[index]
                                              .options
                                              .keys
                                              .toList()[i],
                                        );

                                        setState(() {
                                          isPressed = true;
                                          isAlreadySelected = true;
                                          select = _questions[index]
                                              .options
                                              .keys
                                              .toList()[i];
                                        });
                                      },
                                      child: OptionCard(
                                        option: _questions[index]
                                            .options
                                            .keys
                                            .toList()[i],
                                        color: isPressed
                                            ? _questions[index]
                                                        .options
                                                        .values
                                                        .toList()[i] ==
                                                    true
                                                ? correct
                                                : _questions[index]
                                                            .options
                                                            .keys
                                                            .toList()[i] ==
                                                        select
                                                    ? incorrect
                                                    : neutral
                                            : neutral,
                                      ),
                                    ),
                                ],
                              ),
                      ),
                    ],
                  ),
        changeWidget
            ? Button(
                press: () {
                  if (itsDone == true) {
                    startOver();
                  } else {
                    nextQuestion(_questions.length);
                  }
                },
                text: itsDone == true ? "Back to Home" : "Next Question",
              )
            : Container()
      ],
    );
  }
}
