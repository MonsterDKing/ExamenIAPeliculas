import 'dart:convert';

import 'package:examenia/config/AppConfig.dart';
import 'package:examenia/models/LoginModel.dart';
import 'package:examenia/models/LoginResponseModel.dart';
import 'package:http/http.dart' as http;

class ApiService {
  var headers = {"api_key": "stage_HNYh3RaK_Test"};

  Future<LoginResponseModel> login(LoginModel login) async {
    try {
      final String _url = Appconfig.loginUrl;
      var body = utf8.encode("country_code=MX&username=" +
          login.username +
          "&password=" +
          login.password +
          "&grant_type=password&client_id=IATestCandidate&client_secret=c840457e777b4fee9b510fbcd4985b68");

      final resp = await http.post(_url, headers: headers, body: body);

      if (resp.statusCode == 200) {
        final decodedData = loginResponseModelFromJson(resp.body);
        return decodedData;
      }

      return null;
    } catch (ex) {
      return null;
    }
  }
}
