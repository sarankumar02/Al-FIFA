// To parse this JSON data, do
//
//     final othersModel = othersModelFromJson(jsonString);

import 'dart:convert';
class OthersModelResponse {
  OthersModel? othersResponse;
  String? error;

  OthersModelResponse(this.othersResponse, this.error);
  OthersModelResponse.fromJson({
    Map<String, dynamic>? data,
  })  : othersResponse = OthersModel.fromJson(data!),
        error = "";
  OthersModelResponse.withError({String? errorMessage}) : error = errorMessage;
}
OthersModel othersModelFromJson(String str) => OthersModel.fromJson(json.decode(str));

String othersModelToJson(OthersModel data) => json.encode(data.toJson());

class OthersModel {
    OthersModel({
         this.successMsg,
         this.message,
    });

    int? successMsg;
    String? message;

    factory OthersModel.fromJson(Map<String, dynamic> json) => OthersModel(
        successMsg: json["success_msg"]??0,
        message: json["message"]??"",
    );

    Map<String, dynamic> toJson() => {
        "success_msg": successMsg,
        "message": message,
    };
}
