import 'dart:convert';

class VisaSubmitModelResponse {
  VisaSubmitModel? visaSubmitModel;
  String? error;

  VisaSubmitModelResponse(this.visaSubmitModel, this.error);

  VisaSubmitModelResponse.fromJson({Map<String, dynamic>? data})
      : visaSubmitModel = data != null ? VisaSubmitModel.fromJson(data) : null,
        error = "";

  VisaSubmitModelResponse.withError({String? errorMessage})
      : visaSubmitModel = null,
        error = errorMessage;
}

VisaSubmitModel visaSubmitModelFromJson(String str) =>
    VisaSubmitModel.fromJson(json.decode(str));

String visaSubmitModelToJson(VisaSubmitModel data) =>
    json.encode(data.toJson());

class VisaSubmitModel {
  VisaSubmitModel({
    required this.successMsg,
    required this.visaId,
    required this.paymentToken,
    required this.message,
  });

  int successMsg;
  int visaId;
  String paymentToken;
  String message;

  factory VisaSubmitModel.fromJson(Map<String, dynamic> json) =>
      VisaSubmitModel(
        successMsg: json["success_msg"],
        visaId: json["visa_id"],
        paymentToken: json["payment_token"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success_msg": successMsg,
        "visa_id": visaId,
        "payment_token": paymentToken,
        "message": message,
      };
}

/*
import 'dart:convert';

class VisaSubmitModelResponse {
  VisaSubmitModel? visaSubmitModel;
  String? error;

  VisaSubmitModelResponse(this.visaSubmitModel, this.error);

  VisaSubmitModelResponse.fromJson(Map<String, dynamic>? data)
      : visaSubmitModel = data != null ? VisaSubmitModel.fromJson(data) : null,
        error = "";

  VisaSubmitModelResponse.withError({String? errorMessage})
      : visaSubmitModel = null,
        error = errorMessage;
}

VisaSubmitModel visaSubmitModelFromJson(String str) =>
    VisaSubmitModel.fromJson(json.decode(str));

String visaSubmitModelToJson(VisaSubmitModel data) =>
    json.encode(data.toJson());

class VisaSubmitModel {
  VisaSubmitModel({
    required this.successMsg,
    required this.visaId,
    required this.paymentToken,
    required this.message,
  });

  int successMsg;
  int visaId;
  String paymentToken;
  String message;

  factory VisaSubmitModel.fromJson(Map<String, dynamic> json) =>
      VisaSubmitModel(
        successMsg: json["success_msg"],
        visaId: json["visa_id"],
        paymentToken: json["payment_token"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success_msg": successMsg,
        "visa_id": visaId,
        "payment_token": paymentToken,
        "message": message,
      };
}


*/