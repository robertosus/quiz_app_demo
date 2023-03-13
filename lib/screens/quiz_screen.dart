// ignore_for_file: public_member_api_docs, sort_constructors_first
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
List<Question>? dataQuestion;

class QuizScreen extends StatefulWidget {
  const QuizScreen({
    Key? key,
    required this.listQuestion,
  }) : super(key: key);
  final List<Question> listQuestion;
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
      selectedIndex = -1;
      index = 0;
      isPressed = false;
      isAlreadySelected = false;
      changeWidget = false;
      selectedIndex = null;
      itsDone = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    //! Mengambil data text
    List<String>? textOption =
        widget.listQuestion[index].options.map((e) => e.option).toList();

    List<Option>? listOption = widget.listQuestion[index].options;
    //! Mengambil element pada list option
    for (var key in listOption) {
      //! Pengecheckan jika datanya true maka akan menampilkan data string yang true
      if (key.isCorrect) {
        getData = key.option;
      }
    }
    print(getData);
    //! Mengambil data yang correct / benar
    List<bool>? trueKeys =
        widget.listQuestion[index].options.map((e) => e.isCorrect).toList();

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        selectedIndex == null
            ? HomeScreen()
            : index == widget.listQuestion.length - 1 && itsDone == true
                ? DoneScreen()
                : Column(
                    children: [
                      QuestionWidget(
                        indexAction: index,
                        question: isPressed == true
                            ? getData!
                            : widget.listQuestion[index].title,
                        imageQuestion: widget.listQuestion[index].image,
                        totalQuestions: widget.listQuestion.length,
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
                                          desc: widget
                                              .listQuestion[index].description,
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
                                      i <
                                          widget.listQuestion[index].options
                                              .length;
                                      i++)
                                    GestureDetector(
                                      onTap: () {
                                        checkAnswerAndUpdate(
                                          trueKeys[i],
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
                                            ? trueKeys[i] == true
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
                    nextQuestion(widget.listQuestion.length);
                  }
                },
                text: itsDone == true ? "Back to Home" : "Next Question",
              )
            : Container()
      ],
    );
  }
}
