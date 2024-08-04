import 'dart:convert';

class PaymentModelResponse {
  PaymentModel? paymentModel;
  String? error;

  PaymentModelResponse(this.paymentModel, this.error);
  PaymentModelResponse.fromJson({
    Map<String, dynamic>? data,
  })  : paymentModel = PaymentModel.fromJson(data!),
        error = "";
  PaymentModelResponse.withError({String? errorMessage}) : error = errorMessage;
}

PaymentModel PaymentModelFromJson(String str) =>
    PaymentModel.fromJson(json.decode(str));

String PaymentModelToJson(PaymentModel data) => json.encode(data.toJson());

class PaymentModel {
  List<Result> result;
  int success;
  String message;

  PaymentModel({
    required this.result,
    required this.success,
    required this.message,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) => PaymentModel(
        result: json["result"] != null
            ? List<Result>.from(json["result"].map((x) => Result.fromJson(x)))
            : [], // Default to an empty list if result is null
        success: json["success"] ?? 0, // Default to 0 if success is null
        message: json["message"] ??
            '', // Default to an empty string if message is null
      );

  Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
        "success": success,
        "message": message,
      };
}

class Result {
  String localRefId;
  String userId;

  Result({
    required this.localRefId,
    required this.userId,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        localRefId: json["local_ref_id"] ??
            '', // Default to an empty string if local_ref_id is null
        userId: json["user_id"] ??
            '', // Default to an empty string if user_id is null
      );

  Map<String, dynamic> toJson() => {
        "local_ref_id": localRefId,
        "user_id": userId,
      };
}
