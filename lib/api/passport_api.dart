import 'dart:convert';
import 'package:al_fifa/models/country_model.dart';
import 'package:al_fifa/models/passport_submit.dart';
import 'package:al_fifa/screens/passport%20and%20releated%20services/passport.dart';
import 'package:al_fifa/utils/constants.dart';
import 'package:http/http.dart' as http;

class PasssPortApiProvider {
 

  Future<CountrylistModelResponse> getCountry() async {
    try {
      String url = AppConstants.BASE_URL + "country.php";
     
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
        return CountrylistModelResponse.fromJson(data: responseData);
      } else if (response.statusCode == 200 &&
          responseBody.containsKey("success") &&
          responseBody["success"] != 1) {
        var responseData = json.decode(response.body);
        return CountrylistModelResponse.fromJson(data: responseData);
      }
      return CountrylistModelResponse.withError(
          errorMessage: response.reasonPhrase);
    } catch (e) {
      return CountrylistModelResponse.withError(errorMessage: e.toString());
    }
  }
 Future<PassportSubmitModelResponse> passPartSubmit({required Map body}) async {
    try {
      String url = "${AppConstants.BASE_URL}add_passportform.php";
  
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
        return PassportSubmitModelResponse.fromJson(data: responseBody);
      } else if (response.statusCode == 200 &&
          responseBody.containsKey("success") &&
          responseBody["success"] != 1) {
        return PassportSubmitModelResponse.fromJson(data: responseBody);
      }
      AppConstants.logger("response.reasonPhrase", response.reasonPhrase);
      return PassportSubmitModelResponse.withError(
          errorMessage: response.reasonPhrase);
    } catch (e) {
      return PassportSubmitModelResponse.withError(errorMessage: e.toString());
    }
  }
  
}
