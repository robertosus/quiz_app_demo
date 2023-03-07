import 'models/question_model.dart';

final List<Question> testing = [
  Question(
    title: 'Apakah nama dari UI component di atas?',
    image: 'assets/asset1.png',
    desc:
        'Button adalah komponen pada UI yang membantu pengguna untuk melakukan sebuah aksi misalnya memasukkan item kepada keranjang pada website atau aplikasi toko online.',
    options: {
      'Button': true,
      'Click': false,
      'Anchor': false,
      'TapClick': false
    },
  ),
  Question(
    title: 'Apakah nama dari UI component di atas?',
    image: 'assets/asset2.png',
    desc:
        'Checkbox dapat membantu pengguna untuk memilih item apa saja (lebih dari satu item) yang dibutuhkan oleh pengguna sebelum melakukan proses checkout.',
    options: {
      'Option': false,
      'Choices': false,
      'Checkbox': true,
      'Select': false
    },
  ),
  Question(
      title: 'Apakah nama dari UI component di atas?',
      image: 'assets/asset3.png',
      desc:
          'Checkbox dapat membantu pengguna untuk memilih item apa saja (lebih dari satu item) yang dibutuhkan oleh pengguna sebelum melakukan proses checkout.',
      options: {
        'Add Value': false,
        'Column': false,
        'Email Input': false,
        'Text Field': true
      })
];

void main(List<String> args) {}
