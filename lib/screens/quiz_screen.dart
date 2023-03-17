// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import 'package:quiz_app/main.dart';
import 'package:quiz_app/providers/question_provider.dart';
import 'package:quiz_app/screens/done_screen.dart';
import 'package:quiz_app/screens/home_screen.dart';
import 'package:quiz_app/widgets/next_button.dart';

import '../constants.dart';
import '../models/question_model.dart';
import '../widgets/description.dart';
import '../widgets/option_card.dart';
import '../widgets/question_widget.dart';
import '../widgets/result_box.dart';

String? getAnswer;
bool? getValue;

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
  @override
  Widget build(BuildContext context) {
    //! Access provider question
    var questionClass = Provider.of<QuestionProvider>(context);

    //! Mengambil data text
    List<String>? textOption = widget.listQuestion[questionClass.index].options
        .map((e) => e.option)
        .toList();

    List<Option>? listOption = widget.listQuestion[questionClass.index].options;
    //! Mengambil element pada list option
    for (var key in listOption) {
      //! Pengecheckan jika datanya true maka akan menampilkan data string yang true
      if (key.isCorrect) {
        getAnswer = key.option;
        getValue = key.isCorrect;
      }
    }
    print(getAnswer);
    //! Mengambil data yang correct / benar
    List<bool>? trueKeys = widget.listQuestion[questionClass.index].options
        .map((e) => e.isCorrect)
        .toList();

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        selectedIndex == null
            ? HomeScreen()
            : questionClass.index == widget.listQuestion.length - 1 &&
                    questionClass.quizDone == true
                ? DoneScreen()
                : Column(
                    children: [
                      QuestionWidget(
                        indexAction: questionClass.index,
                        question: questionClass.isPressed == true
                            ? getAnswer!
                            : widget.listQuestion[questionClass.index].title,
                        imageQuestion:
                            widget.listQuestion[questionClass.index].image,
                        totalQuestions: widget.listQuestion.length,
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: questionClass.changeWidget
                            ? Container(
                                width: MediaQuery.of(context).size.width,
                                height: 250,
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: SingleChildScrollView(
                                        child: Description(
                                          desc: widget
                                              .listQuestion[questionClass.index]
                                              .description,
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
                                          widget
                                              .listQuestion[questionClass.index]
                                              .options
                                              .length;
                                      i++)
                                    GestureDetector(
                                      onTap: () {
                                        questionClass
                                            .checkAnswerQuestion(textOption[i]);
                                        setState(() {
                                          questionClass.setPressed = true;
                                          questionClass.setTextData =
                                              textOption[i];
                                        });
                                      },
                                      child: OptionCard(
                                          option: textOption[i],
                                          color: questionClass.isPressed == true
                                              ? trueKeys[i] == true
                                                  ? correct
                                                  : textOption[i] ==
                                                          questionClass.select
                                                      ? incorrect
                                                      : neutral
                                              : neutral),
                                    ),
                                ],
                              ),
                      ),
                    ],
                  ),
        questionClass.changeWidget
            ? Button(
                press: () {
                  if (questionClass.quizDone == true) {
                    questionClass.startOver();
                  } else {
                    questionClass.nextQuestion(widget.listQuestion.length);
                  }
                },
                text: questionClass.quizDone == true
                    ? "Back to Home"
                    : "Next Question",
              )
            : Container()
      ],
    );
  }
}
