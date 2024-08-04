import 'dart:convert';

import 'package:al_fifa/models/slider_model.dart';
import 'package:al_fifa/utils/constants.dart';
import 'package:http/http.dart' as http;

class HomeApiProvider {
  Future<SliderModelResponse> getHomeBannerImages() async {
    try {
      String url = AppConstants.BASE_URL + "slider.php";

      final response = await http.get(Uri.parse(url));
      // print(response.);
      print(response.body.toString() + "ressppponon");
      var responseBody = jsonDecode(response.body);
      print(responseBody);
      if (response.statusCode == 200 &&
          responseBody.containsKey("success") &&
          responseBody["success"] == 1) {
        AppConstants.logger("getHomeBannerImages", responseBody.toString());
        return SliderModelResponse.fromJson(data: responseBody);
      } else if (response.statusCode == 200 &&
          responseBody.containsKey("success") &&
          responseBody["success"] != 1) {
        return SliderModelResponse.fromJson(data: responseBody);
      }
      AppConstants.logger("response.reasonPhrase", response.reasonPhrase);
      return SliderModelResponse.withError(errorMessage: response.reasonPhrase);
    } catch (e) {
      return SliderModelResponse.withError(errorMessage: e.toString());
    }
  }
}
