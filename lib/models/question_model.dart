class Question {
  final String title;
  final String image;
  final String desc;
  final Map<String, bool> options;

  Question({
    required this.title,
    required this.image,
    required this.desc,
    required this.options,
  });

  @override
  String toString() {
    return 'Question(desc: $desc, title: $title, options: $options)';
  }
}

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
