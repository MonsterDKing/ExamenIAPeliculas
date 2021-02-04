// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

class LoginResponseModel {
  LoginResponseModel({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.refreshToken,
    this.asClientId,
    this.username,
    this.countryCode,
    this.issued,
    this.expires,
  });

  String accessToken;
  String tokenType;
  int expiresIn;
  String refreshToken;
  String asClientId;
  String username;
  String countryCode;
  String issued;
  String expires;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
        refreshToken: json["refresh_token"],
        asClientId: json["as:client_id"],
        username: json["username"],
        countryCode: json["country_code"],
        issued: json[".issued"],
        expires: json[".expires"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_in": expiresIn,
        "refresh_token": refreshToken,
        "as:client_id": asClientId,
        "username": username,
        "country_code": countryCode,
        ".issued": issued,
        ".expires": expires,
      };
}
