import 'package:examenia/models/CarteleraResponseModel.dart';
import 'package:examenia/models/LoginModel.dart';
import 'package:examenia/models/LoginResponseModel.dart';
import 'package:examenia/models/UsuarioResponseModel.dart';
import 'package:examenia/services/ApiService.dart';
import 'package:examenia/services/localstorage.dart';
import 'package:examenia/services/locator.dart';
import 'package:flutter/material.dart';

class UsuarioProvider with ChangeNotifier {
  ApiService api = ApiService();

  bool _loading = false;
  LoginResponseModel _loginData;
  UsuarioResponseModel _usermodel;
  CarteleraResponseModel _cartelera;
  String _cardCinepolis;
  var _dataCardCinepolis;

  //Getter
  bool get getLoading => _loading;
  LoginResponseModel get getLoginData => _loginData;
  UsuarioResponseModel get getUserModel => _usermodel;
  CarteleraResponseModel get getCartelera => _cartelera;
  String get getCardCinepolis => _cardCinepolis;
  get getDataCardCinepolis => _dataCardCinepolis;

  //Constructor
  UsuarioProvider() {
    this.getDataInLocalStorage();
  }

  //Setter
  setLoading(bool valor) {
    _loading = valor;
    notifyListeners();
  }

  setCardCinepolis(String valor) {
    _cardCinepolis = valor;
    notifyListeners();
  }

  //Methods

  Future<bool> login(LoginModel login) async {
    if (!_loading) {
      _loading = true;
      var d = await api.login(login);
      if (d == null) {
        _loading = false;
        return false;
      }
      _loginData = d;
      saveInLocalStorage(d);
      _loading = false;
      return true;
    }
  }

  Future<UsuarioResponseModel> getUserData() async {
    _usermodel = await api
        .getUserData("${_loginData.tokenType} ${_loginData.accessToken}");
    return _usermodel;
  }

  Future<CarteleraResponseModel> getBillboard() async {
    _cartelera = await api
        .getCartelera("${_loginData.tokenType} ${_loginData.accessToken}");
    return _cartelera;
  }

  Future getInformationCard() async {}

  saveInLocalStorage(LoginResponseModel valor) {
    final LocalStorageService localstorage = getIt<LocalStorageService>();
    localstorage.setUserInfo = valor;
  }

  getDataInLocalStorage() {
    final LocalStorageService localstorage = getIt<LocalStorageService>();
    if (_loginData == null) {
      _loginData = localstorage.getUserInfo;
    }
  }
}
