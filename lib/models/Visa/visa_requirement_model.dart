// To parse this JSON data, do
//
//     final visaRequirementModel = visaRequirementModelFromJson(jsonString);

import 'dart:convert';

class VisaRequirementModelResponse {
  VisaRequirementModel? visaRequirementModel;
  String? error;

  VisaRequirementModelResponse(this.visaRequirementModel, this.error);
  VisaRequirementModelResponse.fromJson({
    Map<String, dynamic>? data,
  })  : visaRequirementModel = VisaRequirementModel.fromJson(data!),
        error = "";
  VisaRequirementModelResponse.withError({String? errorMessage})
      : error = errorMessage;
}

VisaRequirementModel visaRequirementModelFromJson(String str) {
  final jsonData = json.decode(str);
  return VisaRequirementModel.fromJson(jsonData);
}

String visaRequirementModelToJson(VisaRequirementModel data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class VisaRequirementModel {
  List<Requirement>? requirements;
  int? success;

  VisaRequirementModel({
    this.requirements,
    this.success,
  });

  factory VisaRequirementModel.fromJson(Map<String, dynamic> json) =>
      new VisaRequirementModel(
        requirements: new List<Requirement>.from(json["requirements"].isEmpty
            ? []
            : json["requirements"].map((x) => Requirement.fromJson(x))),
        success: json["success"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "requirements":
            new List<dynamic>.from(requirements!.map((x) => x.toJson())),
        "success": success,
      };
}

class Requirement {
  String? title;
  String? descriptions;

  Requirement({
    this.title,
    this.descriptions,
  });

  factory Requirement.fromJson(Map<String, dynamic> json) => new Requirement(
        title: json["title"] ?? "",
        descriptions: json["descriptions"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "descriptions": descriptions,
      };
}
