// To parse this JSON data, do
//
//     final signupModel = signupModelFromJson(jsonString);

import 'dart:convert';

SignupModel signupModelFromJson(String str) => SignupModel.fromJson(json.decode(str));

String signupModelToJson(SignupModel data) => json.encode(data.toJson());

class SignupModel {
  SignupModel({
    this.result,
    this.message,
    this.userId,
  });

  bool? result;
  String? message;
  int? userId;

  factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
    result: json["result"],
    message: json["message"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "message": message,
    "user_id": userId,
  };
}
