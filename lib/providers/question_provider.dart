import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/screens/home_screen.dart';

class QuestionProvider extends ChangeNotifier {
  //! Private variable
  bool _pressed = false;
  bool _alreadyPressed = false;
  String _select = '';
  int _index = 0;
  bool _quizDone = false;
  bool _changeWidget = false;

  //! Access variable
  bool get alreadyPressed => _alreadyPressed;
  bool get isPressed => _pressed;
  String get select => _select;
  int get index => _index;
  bool get quizDone => _quizDone;
  bool get changeWidget => _changeWidget;

  //! Create function
  void nextQuestion(int lengtQUestion) {
    if (index == lengtQUestion - 1) {
      _quizDone = true;
      notifyListeners();
    } else if (isPressed) {
      _index++;
      _alreadyPressed = false;
      _pressed = false;
      notifyListeners();
    }
  }

  void checkAnswerQuestion(String answer) {
    if (alreadyPressed) {
      notifyListeners();
    } else {
      Future.delayed(
        Duration(seconds: 1),
        () {
          _pressed = true;
          _alreadyPressed = true;
          _select = answer;
          _changeWidget = !_changeWidget;
          notifyListeners();
        },
      );
    }
  }

  void startOver() {
    _index = 0;
    _pressed = false;
    _alreadyPressed = false;
    _changeWidget = false;
    selectedIndex = null;
    _quizDone = false;
  }
}
