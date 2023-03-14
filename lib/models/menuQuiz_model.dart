// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:quiz_app/models/question_model.dart';

class Menu {
  final int id;
  final String name;
  final String image;
  final List<Question> question;
  Menu({
    required this.id,
    required this.name,
    required this.image,
    required this.question,
  });

  Menu.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        image = json['image'],
        question = List<Question>.from(json['question']
            .map((questions) => Question.fromJson(questions))).toList();
}
