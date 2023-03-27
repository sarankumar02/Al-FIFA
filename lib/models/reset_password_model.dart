// To parse this JSON data, do
//
//     final changePasswordModel = changePasswordModelFromJson(jsonString);

import 'dart:convert';
class ChangePasswordModelResponse {
  final ChangePasswordModel? changePasswordModel;
  final String? error;

  ChangePasswordModelResponse(this.changePasswordModel, this.error);
 ChangePasswordModelResponse.fromJson({
    Map<String, dynamic>? data,
  })  : changePasswordModel = ChangePasswordModel.fromJson(data!),
        error = "";
  ChangePasswordModelResponse.withError({String? errorMessage})
      : error = errorMessage,
        changePasswordModel = ChangePasswordModel();
}
ChangePasswordModel changePasswordModelFromJson(String str) => ChangePasswordModel.fromJson(json.decode(str));

String changePasswordModelToJson(ChangePasswordModel data) => json.encode(data.toJson());

class ChangePasswordModel {
    ChangePasswordModel({
         this.successMsg,
         this.message,
    });

    int? successMsg;
    String? message;

    factory ChangePasswordModel.fromJson(Map<String, dynamic> json) => ChangePasswordModel(
        successMsg: json["success_msg"]??0,
        message: json["message"]??"",
    );

    Map<String, dynamic> toJson() => {
        "success_msg": successMsg,
        "message": message,
    };
}
