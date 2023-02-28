import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/description.dart';
import '../constants.dart';
import '../models/question_model.dart';
import '../widgets/question_widget.dart';
import '../widgets/next_button.dart';
import '../widgets/option_card.dart';
import '../widgets/result_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Question> _questions = [
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

  int index = 0;

  int score = 0;

  bool isPressed = false;
  String select = '';
  bool changeWidget = false;
  bool isAlreadySelected = false;
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
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Please select any option'),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 20.0),
        ));
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: background,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30),
              Image.asset('assets/logo.png', width: 50),
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
                    ? Description(
                        desc: _questions[index].desc,
                        pressed: () => nextQuestion(_questions.length),
                      )
                    : SizedBox(
                        child: GridView.count(
                          shrinkWrap: true,
                          primary: false,
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
                                    _questions[index].options.keys.toList()[i],
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
                            SizedBox(height: 30)
                          ],
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
