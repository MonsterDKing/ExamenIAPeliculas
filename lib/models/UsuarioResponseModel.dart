// To parse this JSON data, do
//
//     final usuarioResponseModel = usuarioResponseModelFromJson(jsonString);

import 'dart:convert';

UsuarioResponseModel usuarioResponseModelFromJson(String str) =>
    UsuarioResponseModel.fromJson(json.decode(str));

String usuarioResponseModelToJson(UsuarioResponseModel data) =>
    json.encode(data.toJson());

class UsuarioResponseModel {
  UsuarioResponseModel({
    this.email,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.profilePicture,
    this.cardNumber,
  });

  String email;
  String firstName;
  String lastName;
  String phoneNumber;
  String profilePicture;
  String cardNumber;

  factory UsuarioResponseModel.fromJson(Map<String, dynamic> json) =>
      UsuarioResponseModel(
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phoneNumber: json["phone_number"],
        profilePicture: json["profile_picture"],
        cardNumber: json["card_number"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "phone_number": phoneNumber,
        "profile_picture": profilePicture,
        "card_number": cardNumber,
      };
}
