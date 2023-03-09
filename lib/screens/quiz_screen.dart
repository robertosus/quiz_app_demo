import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:quiz_app/main.dart';
import 'package:quiz_app/screens/done_screen.dart';
import 'package:quiz_app/screens/home_screen.dart';
import 'package:quiz_app/widgets/next_button.dart';

import '../constants.dart';
import '../models/question_model.dart';
import '../widgets/description.dart';
import '../widgets/option_card.dart';
import '../widgets/question_widget.dart';
import '../widgets/result_box.dart';

bool changeWidget = false;
bool isAlreadySelected = false;
bool isPressed = false;
int index = 0;
int score = 0;
String select = '';
bool itsDone = false;
String? getData;

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
        Duration(milliseconds: 900),
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
    List<String>? textOption =
        questions![index].options.map((e) => e.option).toList();
    //! Mengambil data text
    List<Option>? listOption = questions?[index].options;
    for (var key in listOption!) {
      if (key.isCorrect) {
        getData = key.option;
      }
    }
    print(getData);
    List<bool>? trueKeys =
        questions?[index].options.map((e) => e.isCorrect).toList();

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        playQuiz == true
            ? HomeScreen()
            : index == questions!.length - 1 && itsDone == true
                ? DoneScreen()
                : Column(
                    children: [
                      QuestionWidget(
                        indexAction: index,
                        question: isPressed == true
                            ? getData!
                            : questions![index].title,
                        imageQuestion: questions![index].image,
                        totalQuestions: questions!.length,
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: changeWidget
                            ? Container(
                                width: MediaQuery.of(context).size.width,
                                height: 250,
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: SingleChildScrollView(
                                        child: Description(
                                          desc: questions![index].description,
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
                                      i < questions![index].options.length;
                                      i++)
                                    GestureDetector(
                                      onTap: () {
                                        checkAnswerAndUpdate(
                                          trueKeys![i],
                                          textOption[i],
                                        );

                                        setState(() {
                                          isPressed = true;
                                          isAlreadySelected = true;
                                          select = textOption[i];
                                        });
                                      },
                                      child: OptionCard(
                                        option: textOption[i],
                                        color: isPressed
                                            ? trueKeys![i] == true
                                                ? correct
                                                : textOption[i] == select
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
                    nextQuestion(questions!.length);
                  }
                },
                text: itsDone == true ? "Back to Home" : "Next Question",
              )
            : Container()
      ],
    );
  }
}
