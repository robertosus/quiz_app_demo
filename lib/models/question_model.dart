// ignore_for_file: public_member_api_docs, sort_constructors_first
class Question {
  final String title;
  final String image;
  final String description;
  final List<Option> options;

  Question({
    required this.title,
    required this.options,
    required this.image,
    required this.description,
  });

  Question.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        image = json['image'],
        description = json['description'],
        options =
            List.from(json['options'].map((option) => Option.FromJson(option)));

  @override
  String toString() {
    return 'Question(title: $title, image: $image, description: $description, options: $options)';
  }
}

class Option {
  final String option;
  final bool isCorrect;
  Option({
    required this.option,
    required this.isCorrect,
  });

  Option.FromJson(Map<String, dynamic> json)
      : option = json['option'],
        isCorrect = json['isCorrect'];

  @override
  String toString() => 'Option(option: $option, isCorrect: $isCorrect)';
}
