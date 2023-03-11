import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/main.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/screens/quiz_screen.dart';
import 'package:quiz_app/widgets/menu_card.dart';
import 'package:quiz_app/widgets/next_button.dart';
import '../constants.dart';
import '../models/menuQuiz_model.dart';

bool playQuiz = true;
List<Question>? questions;
List<Menu>? listMenu;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void loadData() async {
    String getData = await rootBundle.loadString('assets/question.json');
    List data = jsonDecode(getData);
    List<Question> datas = data.map((e) => Question.fromJson(e)).toList();
    setState(() {
      playQuiz = !playQuiz;
      questions = datas;
    });
  }

  Future<List<Menu>> loadMenu() async {
    String getMenu = await rootBundle.loadString('assets/menu.json');
    List objMenu = jsonDecode(getMenu);
    List<Menu> menus = objMenu.map((e) => Menu.fromJson(e)).toList();

    return menus;
  }

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
                  FutureBuilder(
                    future: loadMenu(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        listMenu = snapshot.data;
                        return Container(
                            height: 157,
                            child: ListView.builder(
                              padding: EdgeInsets.symmetric(horizontal: 24),
                              scrollDirection: Axis.horizontal,
                              itemCount: listMenu?.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 16),
                                  child: MenuCard(
                                      id: listMenu![index].id,
                                      name: listMenu![index].name,
                                      image: listMenu![index].image,
                                      total: listMenu![index].total,
                                      pressed: () async => loadData()),
                                );
                              },
                            ));
                      }
                      return CircularProgressIndicator();
                    },
                  ),
                ],
              )
            : QuizScreen(),
      ),
    );
  }
}
