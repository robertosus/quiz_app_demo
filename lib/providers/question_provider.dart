import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/screens/home_screen.dart';

class QuestionProvider extends ChangeNotifier {
  //! Private variable
  bool? _pressed;

  String? _select;
  int _index = 0;
  bool _quizDone = false;
  bool _changeWidget = false;

  //! Access variable
  bool? get isPressed => _pressed;
  String? get select => _select;
  int get index => _index;
  bool get quizDone => _quizDone;
  bool get changeWidget => _changeWidget;

  //! Set / input for variable
  set setTextData(String data) => _select = data;
  set setPressed(bool press) => _pressed = press;

  //! Create function
  nextQuestion(int lengtQUestion) {
    if (index == lengtQUestion - 1) {
      _quizDone = true;
      notifyListeners();
    } else if (isPressed == true) {
      _index++;
      setPressed = false;
      _changeWidget = false;
      notifyListeners();
    }
  }

  checkAnswerQuestion(String answer) {
    Future.delayed(
      Duration(seconds: 1),
      () {
        setPressed = true;
        _changeWidget = !_changeWidget;
        setTextData = answer;
        notifyListeners();
      },
    );
  }

  startOver() {
    _index = 0;
    setPressed = false;
    _changeWidget = false;
    selectedIndex = null;
    _quizDone = false;
    notifyListeners();
  }
}
