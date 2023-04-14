// To parse this JSON data, do
//
//     final visaPlaceModel = visaPlaceModelFromJson(jsonString);

import 'dart:convert';
class VisaPlaceModelResponse {
  VisaPlaceModel? visaPlaceModel;
  String? error;

  VisaPlaceModelResponse(this.visaPlaceModel, this.error);
  VisaPlaceModelResponse.fromJson({
    Map<String, dynamic>? data,
  })  : visaPlaceModel = VisaPlaceModel.fromJson(data!),
        error = "";
  VisaPlaceModelResponse.withError({String? errorMessage})
      : error = errorMessage;
}

VisaPlaceModel visaPlaceModelFromJson(String str) => VisaPlaceModel.fromJson(json.decode(str));

String visaPlaceModelToJson(VisaPlaceModel data) => json.encode(data.toJson());

class VisaPlaceModel {
    VisaPlaceModel({
        required this.visaplaces,
        required this.message,
    });

    List<Visaplace> visaplaces;
    String message;

    factory VisaPlaceModel.fromJson(Map<String, dynamic> json) => VisaPlaceModel(
        visaplaces: List<Visaplace>.from(json["visaplaces"].map((x) => Visaplace.fromJson(x))),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "visaplaces": List<dynamic>.from(visaplaces.map((x) => x.toJson())),
        "message": message,
    };
}

class Visaplace {
    Visaplace({
        required this.places,
        required this.travelersPrice,
    });

    Map<String, String> places;
    TravelersPrice travelersPrice;

    factory Visaplace.fromJson(Map<String, dynamic> json) => Visaplace(
        places: Map.from(json["places"]).map((k, v) => MapEntry<String, String>(k, v)),
        travelersPrice: TravelersPrice.fromJson(json["Travelers_price"]),
    );

    Map<String, dynamic> toJson() => {
        "places": Map.from(places).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "Travelers_price": travelersPrice.toJson(),
    };
}

class TravelersPrice {
    TravelersPrice({
        required this.adults,
        required this.children,
    });

    String adults;
    String children;

    factory TravelersPrice.fromJson(Map<String, dynamic> json) => TravelersPrice(
        adults: json["adults"],
        children: json["children"],
    );

    Map<String, dynamic> toJson() => {
        "adults": adults,
        "children": children,
    };
}
