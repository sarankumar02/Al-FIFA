// To parse this JSON data, do
//
//     final visaTypeModel = visaTypeModelFromJson(jsonString);

import 'dart:convert';
class VisaTypeModelResponse {
  VisaTypeModel? visaTypeModel;
  String? error;

  VisaTypeModelResponse(this.visaTypeModel, this.error);
  VisaTypeModelResponse.fromJson({
    Map<String, dynamic>? data,
  })  : visaTypeModel = VisaTypeModel.fromJson(data!),
        error = "";
  VisaTypeModelResponse.withError({String? errorMessage})
      : error = errorMessage;
}
VisaTypeModel visaTypeModelFromJson(String str) => VisaTypeModel.fromJson(json.decode(str));

String visaTypeModelToJson(VisaTypeModel data) => json.encode(data.toJson());

class VisaTypeModel {
    VisaTypeModel({
         this.visatype,
         this.message,
    });

    List<Visatype>? visatype;
    String? message;

    factory VisaTypeModel.fromJson(Map<String, dynamic> json) => VisaTypeModel(
        visatype: List<Visatype>.from(json["visatype"].isEmpty?[]:json["visatype"].map((x) => Visatype.fromJson(x))),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "visatype": List<dynamic>.from(visatype!.map((x) => x.toJson())),
        "message": message,
    };
}

class Visatype {
    Visatype({
         this.visaId,
         this.visaType,
    });

    String? visaId;
    String? visaType;

    factory Visatype.fromJson(Map<String, dynamic> json) => Visatype(
        visaId: json["visaId"],
        visaType: json["visaType"],
    );

    Map<String, dynamic> toJson() => {
        "visaId": visaId,
        "visaType": visaType,
    };
}
