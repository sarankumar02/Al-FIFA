// To parse this JSON data, do
//
//     final forgotPassword = forgotPasswordFromJson(jsonString);

import 'dart:convert';
class ForgotPasswordResponse {
  ForgotPassword? forgotPassword;
  String? error;

  ForgotPasswordResponse(this.forgotPassword, this.error);
  ForgotPasswordResponse.fromJson({
    Map<String, dynamic>? data,
  })  : forgotPassword = ForgotPassword.fromJson(data!),
        error = "";
  ForgotPasswordResponse.withError({String? errorMessage}) : error = errorMessage;
}
ForgotPassword forgotPasswordFromJson(String str) => ForgotPassword.fromJson(json.decode(str));

String forgotPasswordToJson(ForgotPassword data) => json.encode(data.toJson());

class ForgotPassword {
    ForgotPassword({
         this.successMsg,
         this.message,
    });

    int? successMsg;
    String? message;

    factory ForgotPassword.fromJson(Map<String, dynamic> json) => ForgotPassword(
        successMsg: json["success_msg"]??0,
        message: json["message"]??"",
    );

    Map<String, dynamic> toJson() => {
        "success_msg": successMsg,
        "message": message,
    };
}
