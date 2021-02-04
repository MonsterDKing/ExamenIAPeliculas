import 'package:examenia/Screens/MovieDetailView.dart';
import 'package:examenia/models/CarteleraResponseModel.dart';
import 'package:examenia/ui/BillboardView.dart';
import 'package:examenia/ui/ComplexView.dart';
import 'package:examenia/ui/ProfileView.dart';
import 'package:flutter/material.dart';

class TapBarProvider with ChangeNotifier {
  int _tabIndex = 0;
  List<Widget> _listScreens = [
    ProfileView(),
    BillboardView(),
    ComplexView(),
  ];
  List<String> _listTitle = ["Perfil", "Cartelera", "Complejo"];
  Movie _movie;

  //Getter
  get getTabIndex => _tabIndex;
  get getListScreens => _listScreens;
  get getListTitle => _listTitle;
  get getMovieSelected => _movie;

  //Setter
  set setTabIndex(int valor) {
    this._tabIndex = valor;
    notifyListeners();
  }

  set setMovie(Movie valor) {
    this._movie = valor;
    notifyListeners();
  }

  //Methods

}
