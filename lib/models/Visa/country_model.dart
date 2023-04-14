// To parse this JSON data, do
//
//     final visaCountryModel = visaCountryModelFromJson(jsonString);

import 'dart:convert';

class VisaCountryModelResponse {
  VisaCountryModel? visaCountryModel;
  String? error;

  VisaCountryModelResponse(this.visaCountryModel, this.error);
  VisaCountryModelResponse.fromJson({
    Map<String, dynamic>? data,
  })  : visaCountryModel = VisaCountryModel.fromJson(data!),
        error = "";
  VisaCountryModelResponse.withError({String? errorMessage})
      : error = errorMessage;
}

VisaCountryModel visaCountryModelFromJson(String str) =>
    VisaCountryModel.fromJson(json.decode(str));

String visaCountryModelToJson(VisaCountryModel data) =>
    json.encode(data.toJson());

class VisaCountryModel {
  VisaCountryModel({
    this.countrydropdown,
    this.success,
  });

  List<Countrydropdown>? countrydropdown;
  int? success;

  factory VisaCountryModel.fromJson(Map<String, dynamic> json) =>
      VisaCountryModel(
        countrydropdown: List<Countrydropdown>.from(json["countrydropdown"]
                .isEmpty
            ? []
            : json["countrydropdown"].map((x) => Countrydropdown.fromJson(x))),
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "countrydropdown":
            List<dynamic>.from(countrydropdown!.map((x) => x.toJson())),
        "success": success,
      };
}

class Countrydropdown {
  Countrydropdown({
     this.countryId,
     this.countryname,
  });

  String ?countryId;
  String ?countryname;

  factory Countrydropdown.fromJson(Map<String, dynamic> json) =>
      Countrydropdown(
        countryId: json["countryId"]??"",
        countryname: json["countryname"]??"",
      );

  Map<String, dynamic> toJson() => {
        "countryId": countryId,
        "countryname": countryname,
      };
}
