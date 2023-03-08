import 'package:flutter/material.dart';
import 'package:quiz_app/main.dart';
import 'package:quiz_app/screens/quiz_screen.dart';
import 'package:quiz_app/widgets/menu_card.dart';
import 'package:quiz_app/widgets/next_button.dart';
import '../constants.dart';
import '../models/menuQuiz_model.dart';

bool playQuiz = true;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: background,
        body: playQuiz
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Center(child: Image.asset('assets/logo.png', width: 50)),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Happy Learning',
                            style: const TextStyle(
                                color: correct, fontWeight: FontWeight.w600)),
                        SizedBox(height: 4),
                        Text('Materi Terbaru',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                      height: 157,
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        scrollDirection: Axis.horizontal,
                        itemCount: menu.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: MenuCard(
                              name: menu[index].name,
                              total: menu[index].total,
                              image: menu[index].image,
                              pressed: () => setState(() {
                                playQuiz = !playQuiz;
                              }),
                            ),
                          );
                        },
                      ))
                ],
              )
            : Container(),
      ),
    );
  }
}
