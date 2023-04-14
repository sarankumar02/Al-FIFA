// To parse this JSON data, do
//
//     final aboutModel = aboutModelFromJson(jsonString);

import 'dart:convert';
class AboutModelResponse {
  AboutModel? aboutModel;
  String? error;

  AboutModelResponse(this.aboutModel, this.error);
  AboutModelResponse.fromJson({
    Map<String, dynamic>? data,
  })  : aboutModel = AboutModel.fromJson(data!),
        error = "";
  AboutModelResponse.withError({String? errorMessage}) : error = errorMessage;
}
AboutModel aboutModelFromJson(String str) => AboutModel.fromJson(json.decode(str));

String aboutModelToJson(AboutModel data) => json.encode(data.toJson());

class AboutModel {
    AboutModel({
         this.aboutus,
         this.success,
    });

    List<Aboutus>? aboutus;
    int? success;

    factory AboutModel.fromJson(Map<String, dynamic> json) => AboutModel(
        aboutus: List<Aboutus>.from(json["aboutus"]==[]?[]:json["aboutus"].map((x) => Aboutus.fromJson(x))),
        success: json["success"]??0,
    );

    Map<String, dynamic> toJson() => {
        "aboutus": List<dynamic>.from(aboutus!.map((x) => x.toJson())),
        "success": success,
    };
}

class Aboutus {
    Aboutus({
         this.title,
         this.bannerImage,
         this.content,
         this.updatedAt,
    });

    String? title;
    String? bannerImage;
    String? content;
    String? updatedAt;

    factory Aboutus.fromJson(Map<String, dynamic> json) => Aboutus(
        title: json["title"]??"",
        bannerImage: json["bannerImage"]??"",
        content: json["content"]??"",
        updatedAt: json["updated_at"]??"",
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "bannerImage": bannerImage,
        "content": content,
        "updated_at": updatedAt,
    };
}
