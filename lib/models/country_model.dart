// To parse this JSON data, do
//
//     final countrylistModel = countrylistModelFromJson(jsonString);

import 'dart:convert';
class CountrylistModelResponse {
  CountrylistModel? countrylistModel;
  String? error;

  CountrylistModelResponse(this.countrylistModel, this.error);
  CountrylistModelResponse.fromJson({
    Map<String, dynamic>? data,
  })  : countrylistModel = CountrylistModel.fromJson(data!),
        error = "";
  CountrylistModelResponse.withError({String? errorMessage}) : error = errorMessage;
}
CountrylistModel countrylistModelFromJson(String str) => CountrylistModel.fromJson(json.decode(str));

String countrylistModelToJson(CountrylistModel data) => json.encode(data.toJson());

class CountrylistModel {
    CountrylistModel({
         this.countrylist,
         this.success,
    });

    List<Countrylist>? countrylist;
    int? success;

    factory CountrylistModel.fromJson(Map<String, dynamic> json) => CountrylistModel(
        countrylist: List<Countrylist>.from(json["countrylist"].map((x) => Countrylist.fromJson(x))),
        success: json["success"],
    );

    Map<String, dynamic> toJson() => {
        "countrylist": List<dynamic>.from(countrylist!.map((x) => x.toJson())),
        "success": success,
    };
}

class Countrylist {
    Countrylist({
           this.countryId,
         this.countryname,
         this.countryimage,
         this.createdat,
    });
    String? countryId;
    String? countryname;
    String? countryimage;
    DateTime? createdat;

    factory Countrylist.fromJson(Map<String, dynamic> json) => Countrylist(
        countryId: json["countryId"]??"",
        countryname: json["countryname"]??"",
        countryimage: json["countryimage"]??"",
        createdat: DateTime.parse(json["createdat"]??""),
    );

    Map<String, dynamic> toJson() => {
        "countryId": countryId,
        "countryname": countryname,
        "countryimage": countryimage,
        "createdat": createdat!.toIso8601String(),
    };
}
