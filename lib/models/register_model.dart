

import 'dart:convert';
class RegisterModelResponse {
  final RegisterModel? registerModel;
  final String? error;

  RegisterModelResponse(this.registerModel, this.error);
  RegisterModelResponse.fromJson({
    Map<String, dynamic>? data,
  })  : registerModel = RegisterModel.fromJson(data!),
        error = "";
  RegisterModelResponse.withError({String? errorMessage})
      : error = errorMessage,
        registerModel = RegisterModel();
}

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
    RegisterModel({
         this.users,
         this.successMsg,
         this.message,
    });

    List<User>? users;
    int? successMsg;
    String? message;

    factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        users: List<User>.from(json["users"]==null?[]:json["users"].map((x) => User.fromJson(x))??[]),
        successMsg: json["success_msg"]??0,
        message: json["message"]??"",
    );

    Map<String, dynamic> toJson() => {
        "users": List<dynamic>.from(users!.map((x) => x.toJson())),
        "success_msg": successMsg,
        "message": message,
    };
}

class User {
    User({
         this.uid,
         this.firstName,
         this.lastName,
         this.mobile,
         this.active,
         this.email,
    });

    int? uid;
    String? firstName;
    String? lastName;
    String? mobile;
    int? active;
    String? email;

    factory User.fromJson(Map<String, dynamic> json) => User(
        uid: json["uid"]??0,
        firstName: json["first_name"]??"",
        lastName: json["last_name"]??"",
        mobile: json["mobile"]??"",
        active: json["active"]??0,
        email: json["email"]??"",
    );

    Map<String, dynamic> toJson() => {
        "uid": uid,
        "first_name": firstName,
        "last_name": lastName,
        "mobile": mobile,
        "active": active,
        "email": email,
    };
}
