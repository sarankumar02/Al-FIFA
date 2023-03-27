// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';
class LoginModelResponse {
  LoginModel? loginResponse;
  String? error;

  LoginModelResponse(this.loginResponse, this.error);
  LoginModelResponse.fromJson({
    Map<String, dynamic>? data,
  })  : loginResponse = LoginModel.fromJson(data!),
        error = "";
  LoginModelResponse.withError({String? errorMessage}) : error = errorMessage;
}

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    LoginModel({
         this.users,
         this.message,
         this.success,
    });

    List<User>? users;
    String ?message;
    int? success;

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        users: List<User>.from(json["users"]==null?[]:json["users"].map((x) => User.fromJson(x))),
        message: json["message"]??"",
        success: json["success"]??0,
    );

    Map<String, dynamic> toJson() => {
        "users": List<dynamic>.from(users!.map((x) => x.toJson())),
        "message": message,
        "success": success,
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

    String? uid;
    String? firstName;
    String? lastName;
    String? mobile;
    String? active;
    String? email;

    factory User.fromJson(Map<String, dynamic> json) => User(
        uid: json["uid"]??"",
        firstName: json["first_name"]??"",
        lastName: json["last_name"]??"",
        mobile: json["mobile"]??"",
        active: json["active"]??"",
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
