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
  bool _loadingCardInformation = false;
  LoginResponseModel _loginData;
  UsuarioResponseModel _usermodel;
  CarteleraResponseModel _cartelera;
  String _cardCinepolis;
  var _dataCardCinepolis;

  //Getter
  bool get getLoading => _loading;
  bool get getLoadingCardInformation => _loadingCardInformation;
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
  set setLoading(bool valor) {
    this._loading = valor;
    notifyListeners();
  }

  set setCardCinepolis(String valor) {
    this._cardCinepolis = valor;
    notifyListeners();
  }

  set setLoadingCardInformation(bool valor) {
    this._loadingCardInformation = valor;
    notifyListeners();
  }

  //Methods

  Future<bool> login(LoginModel login) async {
    if (!_loading) {
      setLoading = true;
      var d = await api.login(login);
      if (d == null) {
        setLoading = false;
        return false;
      }

      this._loginData = d;
      saveInLocalStorage(d);
      setLoading = false;
      return true;
    }
  }

  Future<UsuarioResponseModel> getUserData() async {
    this._usermodel = await api
        .getUserData("${_loginData.tokenType} ${_loginData.accessToken}");
    return _usermodel;
  }

  Future<CarteleraResponseModel> getBillboard() async {
    this._cartelera = await api
        .getCartelera("${_loginData.tokenType} ${_loginData.accessToken}");
    return _cartelera;
  }

  Future getInformationCard() async {
    setLoadingCardInformation = true;
    this._dataCardCinepolis = await api.getDataCard(
        "${_loginData.tokenType} ${_loginData.accessToken}", _cardCinepolis);

    setLoadingCardInformation = false;
    return this._dataCardCinepolis;
  }

  saveInLocalStorage(LoginResponseModel valor) {
    final LocalStorageService localstorage = getIt<LocalStorageService>();
    localstorage.setUserInfo = valor;
  }

  getDataInLocalStorage() {
    final LocalStorageService localstorage = getIt<LocalStorageService>();
    if (_loginData == null) {
      this._loginData = localstorage.getUserInfo;
    }
  }
}
