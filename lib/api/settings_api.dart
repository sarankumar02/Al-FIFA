import 'dart:convert';
import 'package:al_fifa/models/about_us.dart';
import 'package:al_fifa/models/contact_us.dart';
import 'package:al_fifa/models/country_model.dart';
import 'package:al_fifa/models/passport_submit.dart';
import 'package:al_fifa/screens/passport%20and%20releated%20services/passport.dart';
import 'package:al_fifa/utils/constants.dart';
import 'package:http/http.dart' as http;

class SettingsApiProvider {
 

  Future<AboutModelResponse> getAboutus() async {
    try {
      String url = AppConstants.BASE_URL + "about.php";
     
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      );
      // print(response.);
      print(response.body.toString() + "ressppponon");
      var responseBody = jsonDecode(response.body);
      if (response.statusCode == 200 &&
          responseBody.containsKey("success") &&
          responseBody["success"] == 1) {
        var responseData = json.decode(response.body);
        return AboutModelResponse.fromJson(data: responseData);
      } else if (response.statusCode == 200 &&
          responseBody.containsKey("success") &&
          responseBody["success"] != 1) {
        var responseData = json.decode(response.body);
        return AboutModelResponse.fromJson(data: responseData);
      }
      return AboutModelResponse.withError(
          errorMessage: response.reasonPhrase);
    } catch (e) {
      return AboutModelResponse.withError(errorMessage: e.toString());
    }
  }
   Future<ContactModelResponse> contactUsSubmit({required Map body}) async {
    try {
      String url = "${AppConstants.BASE_URL}contactform.php";
  
      final response = await http.post(Uri.parse(url),
       
          body: jsonEncode(body));
             print("body $body");
      // print(response.);
      print(response.body.toString() + "ressppponon");
      var responseBody = jsonDecode(response.body);
      print(responseBody);
      if (response.statusCode == 200 &&
          responseBody.containsKey("success_msg") &&
          responseBody["success_msg"] == 1) {
        AppConstants.logger("innner", responseBody.toString());
        return ContactModelResponse.fromJson(data: responseBody);
      } else if (response.statusCode == 200 &&
          responseBody.containsKey("success") &&
          responseBody["success"] != 1) {
        return ContactModelResponse.fromJson(data: responseBody);
      }
      AppConstants.logger("response.reasonPhrase", response.reasonPhrase);
      return ContactModelResponse.withError(
          errorMessage: response.reasonPhrase);
    } catch (e) {
      return ContactModelResponse.withError(errorMessage: e.toString());
    }
  }

  
}
