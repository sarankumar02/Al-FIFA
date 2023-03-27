// To parse this JSON data, do
//
//     final passportSubmitModel = passportSubmitModelFromJson(jsonString);

import 'dart:convert';

class PassportSubmitModelResponse {
  PassportSubmitModel? passportSubmitModel;
  String? error;

  PassportSubmitModelResponse(this.passportSubmitModel, this.error);
  PassportSubmitModelResponse.fromJson({
    Map<String, dynamic>? data,
  })  : passportSubmitModel = PassportSubmitModel.fromJson(data!),
        error = "";
  PassportSubmitModelResponse.withError({String? errorMessage})
      : error = errorMessage;
}

PassportSubmitModel passportSubmitModelFromJson(String str) =>
    PassportSubmitModel.fromJson(json.decode(str));

String passportSubmitModelToJson(PassportSubmitModel data) =>
    json.encode(data.toJson());

class PassportSubmitModel {
  PassportSubmitModel({
     this.successMsg,
     this.message,
  });

  int? successMsg;
  String? message;

  factory PassportSubmitModel.fromJson(Map<String, dynamic> json) =>
      PassportSubmitModel(
        successMsg: json["success_msg"]??0,
        message: json["message"]??"",
      );

  Map<String, dynamic> toJson() => {
        "success_msg": successMsg,
        "message": message,
      };
}
