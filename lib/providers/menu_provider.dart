import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/models/menuQuiz_model.dart';

class MenuProvider extends ChangeNotifier {
  getDataMenu() async {
    String getMenu = await rootBundle.loadString('assets/menu.json');
    List objMenu = jsonDecode(getMenu);
    List<Menu> menus = objMenu.map((e) => Menu.fromJson(e)).toList();
    return menus;
  }
}
