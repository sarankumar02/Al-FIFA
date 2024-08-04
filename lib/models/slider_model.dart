import 'dart:convert';

class SliderModelResponse {
  SliderModel? sliderModel;
  String? error;

  SliderModelResponse(this.sliderModel, this.error);
  SliderModelResponse.fromJson({
    Map<String, dynamic>? data,
  })  : sliderModel = SliderModel.fromJson(data!),
        error = "";
  SliderModelResponse.withError({String? errorMessage}) : error = errorMessage;
}

SliderModel sliderModelFromJson(String str) =>
    SliderModel.fromJson(json.decode(str));

String sliderModelToJson(SliderModel data) => json.encode(data.toJson());

class SliderModel {
  List<Slider> slider;
  int success;

  SliderModel({
    required this.slider,
    required this.success,
  });

  factory SliderModel.fromJson(Map<String, dynamic> json) => SliderModel(
        slider: List<Slider>.from(
            (json["slider"] ?? []).map((x) => Slider.fromJson(x))),
        success: json["success"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "slider": List<dynamic>.from(slider.map((x) => x.toJson())),
        "success": success,
      };
}

class Slider {
  String title;
  String bannerImage;
  String descriptions;

  Slider({
    required this.title,
    required this.bannerImage,
    required this.descriptions,
  });

  factory Slider.fromJson(Map<String, dynamic> json) => Slider(
        title: json["title"] ?? "",
        bannerImage: json["bannerImage"] ?? "",
        descriptions: json["descriptions"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "bannerImage": bannerImage,
        "descriptions": descriptions,
      };
}
