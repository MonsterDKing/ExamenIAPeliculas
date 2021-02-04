import 'package:examenia/models/LoginModel.dart';
import 'package:flutter/material.dart';

class TapBarProvider with ChangeNotifier {
  int _tabIndex = 0;
  // List<Widget> _listScreens;
  List<String> _listTitle = ["Perfil", "Cartelera", "Complejo"];

  //Getter
  get getTabIndex => _tabIndex;
  // get getListScreens => _listScreens;
  get getListTitle => _listTitle;

  //Setter
  setTabIndex(int valor) {
    this._tabIndex = valor;
    notifyListeners();
  }

  //Methods

}
