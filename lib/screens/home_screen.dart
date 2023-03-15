import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/main.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/providers/menu_provider.dart';
import 'package:quiz_app/screens/quiz_screen.dart';
import 'package:quiz_app/widgets/menu_card.dart';
import 'package:quiz_app/widgets/next_button.dart';
import '../constants.dart';
import '../models/menuQuiz_model.dart';

bool playQuiz = true;
List<Menu> listMenu = [];
int? selectedIndex;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var menu = Provider.of<MenuProvider>(context);
    menu.getDataMenu();
    return SafeArea(
      child: Scaffold(
          backgroundColor: background,
          body: selectedIndex != null
              ? QuizScreen(
                  listQuestion: selectedIndex != null
                      ? listMenu[selectedIndex!].question
                      : null!)
              : Column(
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
                      future: menu.getDataMenu(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          listMenu = snapshot.data!;
                          return Container(
                            height: 157,
                            child: ListView(
                                padding: EdgeInsets.symmetric(horizontal: 24),
                                scrollDirection: Axis.horizontal,
                                children: listMenu
                                    .map((e) => Padding(
                                          padding:
                                              const EdgeInsets.only(right: 16),
                                          child: MenuCard(
                                              menu: e,
                                              pressed: () => setState(() {
                                                    selectedIndex = e.id;
                                                  }),
                                              total: e.question.length),
                                        ))
                                    .toList()),
                          );
                        } else if (snapshot.hasError) {
                          return Text('No Data');
                        }
                        return CircularProgressIndicator();
                      },
                    )
                  ],
                )),
    );
  }
}
