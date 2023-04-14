import 'dart:convert';
import 'package:al_fifa/models/country_model.dart';
import 'package:al_fifa/models/otherServices_model.dart';
import 'package:al_fifa/models/passport_submit.dart';
import 'package:al_fifa/screens/passport%20and%20releated%20services/passport.dart';
import 'package:al_fifa/utils/constants.dart';
import 'package:http/http.dart' as http;

class OtherServicesApiProvider {
  Future<OthersModelResponse> otherServicesSubmit(
      {required Map body, required String endPoint}) async {
    try {
      String url = AppConstants.BASE_URL + endPoint;

      final response = await http.post(Uri.parse(url), body: jsonEncode(body));
      print("body $body");
      // print(response.);
      print(response.body.toString() + "ressppponon");
      var responseBody = jsonDecode(response.body);
      print(responseBody);
      if (response.statusCode == 200 &&
          responseBody.containsKey("success_msg") &&
          responseBody["success_msg"] == 1) {
        AppConstants.logger("innner", responseBody.toString());
        return OthersModelResponse.fromJson(data: responseBody);
      } else if (response.statusCode == 200 &&
          responseBody.containsKey("success") &&
          responseBody["success"] != 1) {
        return OthersModelResponse.fromJson(data: responseBody);
      }
      AppConstants.logger("response.reasonPhrase", response.reasonPhrase);
      return OthersModelResponse.withError(errorMessage: response.reasonPhrase);
    } catch (e) {
      return OthersModelResponse.withError(errorMessage: e.toString());
    }
  }

  Future translation({required Map body, required String endPoint}) async {
    try {
      String url = AppConstants.BASE_URL + endPoint;
      var request = http.MultipartRequest('POST', Uri.parse(url))
        ..fields['quantity'] = body["paper"]
        ..fields['content'] = body["content"]
        ..fields['applicant_name'] = body["name"]
        ..fields['mobile'] = body["mobile"]
        ..fields['email'] = body["email"]
        ..fields['usertype'] = body["usertype"]
        ..fields["created_by"] = body["created_by"]
        ..files.add(await http.MultipartFile.fromPath(
          'document',
          body["document"],
        ));
      var response = await request.send();
      dynamic responseBody = await response.stream
          .transform(utf8.decoder)
          .transform(json.decoder)
          .first;

      if (response.statusCode == 200 &&
          responseBody.containsKey("success_msg") &&
          responseBody["success_msg"] == 1) {
        AppConstants.logger("innner", responseBody.toString());
        return OthersModelResponse.fromJson(data: responseBody);
      } else if (response.statusCode == 200 &&
          responseBody.containsKey("success") &&
          responseBody["success"] != 1) {
        return OthersModelResponse.fromJson(data: responseBody);
      }
      AppConstants.logger("response.reasonPhrase", response.reasonPhrase);
      return OthersModelResponse.withError(errorMessage: response.reasonPhrase);
    } catch (e) {
      print(e);
      return OthersModelResponse.withError(errorMessage: e.toString());
    }
  }
}
