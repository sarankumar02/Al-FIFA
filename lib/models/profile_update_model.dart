// To parse this JSON data, do
//
//     final userDetailsUpdateModel = userDetailsUpdateModelFromJson(jsonString);

import 'dart:convert';
class UserDetailsUpdateModelResponse {
  UserDetailsUpdateModel? updateProfileModel;
  String? error;

  UserDetailsUpdateModelResponse(this.updateProfileModel, this.error);
  UserDetailsUpdateModelResponse.fromJson({
    Map<String, dynamic>? data,
  })  : updateProfileModel = UserDetailsUpdateModel.fromJson(data!),
        error = "";
  UserDetailsUpdateModelResponse.withError({String? errorMessage}) : error = errorMessage;
}

UserDetailsUpdateModel userDetailsUpdateModelFromJson(String str) => UserDetailsUpdateModel.fromJson(json.decode(str));

String userDetailsUpdateModelToJson(UserDetailsUpdateModel data) => json.encode(data.toJson());

class UserDetailsUpdateModel {
    UserDetailsUpdateModel({
         this.successMsg,
         this.message,
    });

    int? successMsg;
    String? message;

    factory UserDetailsUpdateModel.fromJson(Map<String, dynamic> json) => UserDetailsUpdateModel(
        successMsg: json["success_msg"]??"",
        message: json["message"]??"",
    );

    Map<String, dynamic> toJson() => {
        "success_msg": successMsg,
        "message": message,
    };
}
