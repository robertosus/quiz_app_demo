import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
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

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List<Question> _questions = [
    Question(
      title: 'Method stateFul widget yang untuk menghancurkan object adalah ?',
      image: 'assets/question1.png',
      desc:
          'DISPOSE: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which dont look even slightly believable. ',
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

  int index = 0;

  int score = 0;

  String select = '';
  void nextQuestion(int questionLength) {
    if (index == questionLength - 1) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (ctx) => ResultBox(
                result: score,
                questionLength: questionLength,
                onPressed: startOver,
              ));
    } else {
      if (isPressed) {
        setState(() {
          index++;
          isPressed = false;
          isAlreadySelected = false;
          changeWidget = false;
        });
      }
    }
  }

  void checkAnswerAndUpdate(bool value, String answer) {
    if (isAlreadySelected) {
      return;
    } else {
      Future.delayed(
        Duration(seconds: 2),
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
      score = 0;
      isPressed = false;
      isAlreadySelected = false;
      changeWidget = false;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Column(
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
                                _questions[index].options.values.toList()[i],
                                _questions[index].options.keys.toList()[i],
                              );

                              setState(() {
                                isPressed = true;
                                isAlreadySelected = true;
                                select =
                                    _questions[index].options.keys.toList()[i];
                              });
                            },
                            child: OptionCard(
                              option:
                                  _questions[index].options.keys.toList()[i],
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
            ? NextButton(press: () => nextQuestion(_questions.length))
            : Container()
      ],
    );
  }
}
