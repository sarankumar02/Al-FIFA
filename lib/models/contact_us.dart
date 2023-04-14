// To parse this JSON data, do
//
//     final contactModel = contactModelFromJson(jsonString);

import 'dart:convert';
class ContactModelResponse {
  ContactModel? contactModel;
  String? error;

  ContactModelResponse(this.contactModel, this.error);
  ContactModelResponse.fromJson({
    Map<String, dynamic>? data,
  })  : contactModel = ContactModel.fromJson(data!),
        error = "";
  ContactModelResponse.withError({String? errorMessage}) : error = errorMessage;
}
ContactModel contactModelFromJson(String str) => ContactModel.fromJson(json.decode(str));

String contactModelToJson(ContactModel data) => json.encode(data.toJson());

class ContactModel {
    ContactModel({
         this.successMsg,
         this.message,
    });

    int? successMsg;
    String? message;

    factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
        successMsg: json["success_msg"]??0,
        message: json["message"]??"",
    );

    Map<String, dynamic> toJson() => {
        "success_msg": successMsg,
        "message": message,
    };
}
