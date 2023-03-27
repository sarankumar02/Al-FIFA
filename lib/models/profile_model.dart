// To parse this JSON data, do
//
//     final userDetailsModel = userDetailsModelFromJson(jsonString);

import 'dart:convert';
class UserDetailsModelResponse {
  UserDetailsModel? userDetailsModel;
  String? error;

  UserDetailsModelResponse(this.userDetailsModel, this.error);
  UserDetailsModelResponse.fromJson({
    Map<String, dynamic>? data,
  })  : userDetailsModel = UserDetailsModel.fromJson(data!),
        error = "";
  UserDetailsModelResponse.withError({String? errorMessage})
      : error = errorMessage;
}
UserDetailsModel userDetailsModelFromJson(String str) => UserDetailsModel.fromJson(json.decode(str));

String userDetailsModelToJson(UserDetailsModel data) => json.encode(data.toJson());

class UserDetailsModel {
    UserDetailsModel({
         this.users,
         this.success,
         this.message,
    });

    List<User>? users;
    int? success;
    String? message;

    factory UserDetailsModel.fromJson(Map<String, dynamic> json) => UserDetailsModel(
        users: List<User>.from(json["users"]==null?[]:json["users"].map((x) => User.fromJson(x))),
        success: json["success"]??"",
        message: json["message"]??"",
    );

    Map<String, dynamic> toJson() => {
        "users": List<dynamic>.from(users!.map((x) => x.toJson())),
        "success": success,
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
