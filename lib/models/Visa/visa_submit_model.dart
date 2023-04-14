// To parse this JSON data, do
//
//     final visaSubmitModel = visaSubmitModelFromJson(jsonString);

import 'dart:convert';
class VisaSubmitModelResponse {
  VisaSubmitModel? visaSubmitModel;
  String? error;

  VisaSubmitModelResponse(this.visaSubmitModel, this.error);
  VisaSubmitModelResponse.fromJson({
    Map<String, dynamic>? data,
  })  : visaSubmitModel = VisaSubmitModel.fromJson(data!),
        error = "";
  VisaSubmitModelResponse.withError({String? errorMessage})
      : error = errorMessage;
}

VisaSubmitModel visaSubmitModelFromJson(String str) => VisaSubmitModel.fromJson(json.decode(str));

String visaSubmitModelToJson(VisaSubmitModel data) => json.encode(data.toJson());

class VisaSubmitModel {
    VisaSubmitModel({
        required this.successMsg,
        required this.message,
    });

    int successMsg;
    String message;

    factory VisaSubmitModel.fromJson(Map<String, dynamic> json) => VisaSubmitModel(
        successMsg: json["success_msg"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "success_msg": successMsg,
        "message": message,
    };
}
