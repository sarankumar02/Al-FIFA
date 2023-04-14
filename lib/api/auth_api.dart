import 'dart:convert';
import 'package:al_fifa/models/forgot_password_model.dart';
import 'package:al_fifa/models/login_model.dart';
import 'package:al_fifa/models/profile_model.dart';
import 'package:al_fifa/models/profile_update_model.dart';
import 'package:al_fifa/models/register_model.dart';
import 'package:al_fifa/models/reset_password_model.dart';
import 'package:al_fifa/utils/constants.dart';
import 'package:http/http.dart' as http;

class AuthApiProvider {
  Future<RegisterModelResponse> registerUser({required Map body}) async {
    try {
      String url = "${AppConstants.BASE_URL}register.php";

      final response = await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          body: jsonEncode(body));
      // print(response.);
      print("${response.body}ressppponon");
      var responseBody = jsonDecode(response.body);
      print(responseBody);
      if (response.statusCode == 200 &&
          responseBody.containsKey("success_msg") &&
          responseBody["success_msg"] == 1) {
        AppConstants.logger("innner", responseBody.toString());
        return RegisterModelResponse.fromJson(data: responseBody);
      } else if (response.statusCode == 200 &&
          responseBody.containsKey("success") &&
          responseBody["success"] != 1) {
        return RegisterModelResponse.fromJson(data: responseBody);
      }
      AppConstants.logger("response.reasonPhrase", response.reasonPhrase);
      return RegisterModelResponse.withError(
          errorMessage: response.reasonPhrase);
    } catch (e) {
      print("object$e");
      return RegisterModelResponse.withError(errorMessage: e.toString());
    }
  }

  Future<LoginModelResponse> loginUser({required Map body}) async {
    try {
      String url = "${AppConstants.BASE_URL}login.php";
      final response = await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          body: jsonEncode(body));
      // print(response.);
      print("${response.body}ressppponon");
      var responseBody = jsonDecode(response.body);
      print(responseBody);
      if (response.statusCode == 200 &&
          responseBody.containsKey("success") &&
          responseBody["success"] == 1) {
        AppConstants.logger("innner", responseBody.toString());
        return LoginModelResponse.fromJson(data: responseBody);
      } else if (response.statusCode == 200 &&
          responseBody.containsKey("success") &&
          responseBody["success"] != 1) {
        return LoginModelResponse.fromJson(data: responseBody);
      }
      AppConstants.logger("response.reasonPhrase", response.reasonPhrase);
      return LoginModelResponse.withError(errorMessage: response.reasonPhrase);
    } catch (e) {
      print("failure$e");
      return LoginModelResponse.withError(errorMessage: e.toString());
    }
  }

  Future<ForgotPasswordResponse> forgotUserPassword({required Map body}) async {
    try {
      String url = "${AppConstants.BASE_URL}forgot_password.php";

      final response = await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          body: jsonEncode(body));
      // print(response.);
      print("${response.body}ressppponon");
      var responseBody = jsonDecode(response.body);
      print(responseBody);
      if (response.statusCode == 200 &&
          responseBody.containsKey("success_msg") &&
          responseBody["success_msg"] == 1) {
        AppConstants.logger("innner", responseBody.toString());
        return ForgotPasswordResponse.fromJson(data: responseBody);
      } else if (response.statusCode == 200 &&
          responseBody.containsKey("success") &&
          responseBody["success"] != 1) {
        return ForgotPasswordResponse.fromJson(data: responseBody);
      }
      AppConstants.logger("response.reasonPhrase", response.reasonPhrase);
      return ForgotPasswordResponse.withError(
          errorMessage: response.reasonPhrase);
    } catch (e) {
      return ForgotPasswordResponse.withError(errorMessage: e.toString());
    }
  }

  Future<UserDetailsModelResponse> userDetails({required Map body}) async {
    try {
      String url = "${AppConstants.BASE_URL}profile.php";

      final response = await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          body: jsonEncode(body));
      // print(response.);
      print("${response.body}ressppponon");
      var responseBody = jsonDecode(response.body);
      if (response.statusCode == 200 &&
          responseBody.containsKey("success") &&
          responseBody["success"] == 1) {
        var responseData = json.decode(response.body);
        return UserDetailsModelResponse.fromJson(data: responseData);
      } else if (response.statusCode == 200 &&
          responseBody.containsKey("success") &&
          responseBody["success"] != 1) {
        var responseData = json.decode(response.body);
        return UserDetailsModelResponse.fromJson(data: responseData);
      }
      return UserDetailsModelResponse.withError(
          errorMessage: response.reasonPhrase);
    } catch (e) {
      return UserDetailsModelResponse.withError(errorMessage: e.toString());
    }
  }
  Future<UserDetailsUpdateModelResponse> updateUserDetails({required Map body}) async {
    try {
      String url =
          "${AppConstants.BASE_URL}profile_update.php";
   
      final response = await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          
          },
          body: jsonEncode(body));
      // print(response.);
      print("${response.body}ressppponon");
      var responseBody = jsonDecode(response.body);
      if (response.statusCode == 200 &&
          responseBody.containsKey("success_msg") &&
          responseBody["success_msg"] == 1) {
        var responseData = json.decode(response.body);
        return UserDetailsUpdateModelResponse.fromJson(data: responseData);
      } else if (response.statusCode == 200 &&
          responseBody.containsKey("success") &&
          responseBody["success"] != 1) {
        var responseData = json.decode(response.body);
        return UserDetailsUpdateModelResponse.fromJson(data: responseData);
      }
      return UserDetailsUpdateModelResponse.withError(
          errorMessage: response.reasonPhrase);
    } catch (e) {
      return UserDetailsUpdateModelResponse.withError(errorMessage: e.toString());
    }
  }
  Future<ChangePasswordModelResponse> changePassword({required Map body}) async {
    try {
      String url = "${AppConstants.BASE_URL}password_update.php";
  
      final response = await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          },
          body: jsonEncode(body));
      // print(response.);
      print("${response.body}ressppponon");
      var responseBody = jsonDecode(response.body);
      print(responseBody);
      if (response.statusCode == 200 &&
          responseBody.containsKey("success_msg") &&
          responseBody["success_msg"] == 1) {
        AppConstants.logger("innner", responseBody.toString());
        return ChangePasswordModelResponse.fromJson(data: responseBody);
      } else if (response.statusCode == 200 &&
          responseBody.containsKey("success") &&
          responseBody["success"] != 1) {
        return ChangePasswordModelResponse.fromJson(data: responseBody);
      }
      AppConstants.logger("response.reasonPhrase", response.reasonPhrase);
      return ChangePasswordModelResponse.withError(
          errorMessage: response.reasonPhrase);
    } catch (e) {
      return ChangePasswordModelResponse.withError(errorMessage: e.toString());
    }
  }
}
