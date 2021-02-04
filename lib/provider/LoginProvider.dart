import 'package:examenia/models/LoginModel.dart';
import 'package:examenia/models/LoginResponseModel.dart';
import 'package:examenia/services/ApiService.dart';
import 'package:examenia/services/localstorage.dart';
import 'package:examenia/services/locator.dart';
import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  ApiService api = ApiService();

  bool _loading = false;
  bool _iscorrectlogin = false;
  LoginResponseModel _loginData;

  //Getter
  get getLoading => _loading;
  get getLoginData => _loginData;

  //Setter
  setLoading(bool valor) {
    _loading = valor;
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
      _loading = false;
      return true;
    }
  }

  saveInLocalStorage(valor) {
    final LocalStorageService localstorage = getIt<LocalStorageService>();
    localstorage.setUserInfo(valor);
  }
}
