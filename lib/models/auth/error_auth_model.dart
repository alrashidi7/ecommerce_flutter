// To parse this JSON data, do
//
//     final errorAuthModel = errorAuthModelFromJson(jsonString);

import 'dart:convert';

ErrorAuthModel errorAuthModelFromJson(String str) => ErrorAuthModel.fromJson(json.decode(str));

String errorAuthModelToJson(ErrorAuthModel data) => json.encode(data.toJson());

class ErrorAuthModel {
  ErrorAuthModel({
    this.result,
    this.message,
    this.user,
  });

  bool? result;
  String? message;
  dynamic user;

  factory ErrorAuthModel.fromJson(Map<String, dynamic> json) => ErrorAuthModel(
    result: json["result"],
    message: json["message"],
    user: json["user"],
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "message": message,
    "user": user,
  };
}
