// To parse this JSON data, do
//
//     final internationalDrivingLicenseModel = internationalDrivingLicenseModelFromJson(jsonString);

import 'dart:convert';
class InternationalDrivingLicenseModelResponse {
  InternationalDrivingLicenseModel? internationalDrivingLicenseModel;
  String? error;

  InternationalDrivingLicenseModelResponse(this.internationalDrivingLicenseModel, this.error);
  InternationalDrivingLicenseModelResponse.fromJson({
    Map<String, dynamic>? data,
  })  : internationalDrivingLicenseModel = InternationalDrivingLicenseModel.fromJson(data!),
        error = "";
  InternationalDrivingLicenseModelResponse.withError({String? errorMessage}) : error = errorMessage;
}
InternationalDrivingLicenseModel internationalDrivingLicenseModelFromJson(String str) => InternationalDrivingLicenseModel.fromJson(json.decode(str));

String internationalDrivingLicenseModelToJson(InternationalDrivingLicenseModel data) => json.encode(data.toJson());

class InternationalDrivingLicenseModel {
    InternationalDrivingLicenseModel({
         this.successMsg,
         this.message,
    });

    int? successMsg;
    String? message;

    factory InternationalDrivingLicenseModel.fromJson(Map<String, dynamic> json) => InternationalDrivingLicenseModel(
        successMsg: json["success_msg"]??0,
        message: json["message"]??"",
    );

    Map<String, dynamic> toJson() => {
        "success_msg": successMsg,
        "message": message,
    };
}
