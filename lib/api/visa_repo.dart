import 'dart:convert';
import 'package:al_fifa/models/Visa/country_model.dart';
import 'package:al_fifa/models/Visa/visa_place_model.dart';
import 'package:al_fifa/models/Visa/visa_requirement_model.dart';
import 'package:al_fifa/models/Visa/visa_submit_model.dart';
import 'package:al_fifa/models/Visa/visa_type_model.dart';
import 'package:al_fifa/models/country_model.dart';
import 'package:al_fifa/models/passport_submit.dart';
import 'package:al_fifa/screens/passport%20and%20releated%20services/passport.dart';
import 'package:al_fifa/utils/constants.dart';
import 'package:http/http.dart' as http;

class VisaApiProvider {
 

  Future<VisaCountryModelResponse> getCountry() async {
    try {
      String url = AppConstants.BASE_URL + "visa_requirement_country_dropdown.php";
     
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
        return VisaCountryModelResponse.fromJson(data: responseData);
      } else if (response.statusCode == 200 &&
          responseBody.containsKey("success") &&
          responseBody["success"] != 1) {
        var responseData = json.decode(response.body);
        return VisaCountryModelResponse.fromJson(data: responseData);
      }
      return VisaCountryModelResponse.withError(
          errorMessage: response.reasonPhrase);
    } catch (e) {
      return VisaCountryModelResponse.withError(errorMessage: e.toString());
    }
  }
 Future<VisaTypeModelResponse> getVisaType({required Map body}) async {
    try {
      String url = "${AppConstants.BASE_URL}visatype_dropdown.php";
  
      final response = await http.post(Uri.parse(url),
       
          body: jsonEncode(body));
             print("body $body");
      // print(response.);
    
      var responseBody = jsonDecode(response.body);

      if (response.statusCode == 200) {
        AppConstants.logger("innner", responseBody.toString());
        return VisaTypeModelResponse.fromJson(data: responseBody);
      } else if (response.statusCode != 200) {
        return VisaTypeModelResponse.fromJson(data: responseBody);
      }
      // AppConstants.logger("response.reasonPhrase", response.reasonPhrase);
      return VisaTypeModelResponse.withError(
          errorMessage: response.reasonPhrase);
    } catch (e) {
      return VisaTypeModelResponse.withError(errorMessage: e.toString());
    }
  }
 Future<VisaPlaceModelResponse> getVisaplace({required Map body}) async {
    try {
      String url = "${AppConstants.BASE_URL}visa_place_dropdown.php";
  
      final response = await http.post(Uri.parse(url),
       
          body: jsonEncode(body));
             print("body $body");
      // print(response.);
    
      var responseBody = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return VisaPlaceModelResponse.fromJson(data: responseBody);
      } else if (response.statusCode != 200) {
        return VisaPlaceModelResponse.fromJson(data: responseBody);
      }
      // AppConstants.logger("response.reasonPhrase", response.reasonPhrase);
      return VisaPlaceModelResponse.withError(
          errorMessage: response.reasonPhrase);
    } catch (e) {
      return VisaPlaceModelResponse.withError(errorMessage: e.toString());
    }
  }
 Future<VisaRequirementModelResponse> getVisaRequirement({required Map body}) async {
    try {
      String url = "${AppConstants.BASE_URL}visa_requirements.php";
  
      final response = await http.post(Uri.parse(url),
       
          body: jsonEncode(body));
             print("body $body");
      // print(response.);
    
      var responseBody = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return VisaRequirementModelResponse.fromJson(data: responseBody);
      } else if (response.statusCode != 200) {
        return VisaRequirementModelResponse.fromJson(data: responseBody);
      }
      // AppConstants.logger("response.reasonPhrase", response.reasonPhrase);
      return VisaRequirementModelResponse.withError(
          errorMessage: response.reasonPhrase);
    } catch (e) {
      return VisaRequirementModelResponse.withError(errorMessage: e.toString());
    }
  }
   Future visaSubmit({required Map body}) async {


    try {
      String url = "${AppConstants.BASE_URL}addform_visasubmission.php";
      var request = http.MultipartRequest('POST', Uri.parse(url))
        ..fields['countryId'] = body["countryId"]
        ..fields['visaType'] = body["visaType"]
        ..fields['visaPlace'] = body["visaPlace"].toString()
        ..fields['adultCount'] = body["adultCount"].toString()
        ..fields['adultCost'] = body["adultCost"].toString()
        ..fields['childCount'] = body["childCount"].toString()
        ..fields['childCost'] = body["childCost"].toString()
        ..fields['totalCost'] = body["totalCost"].toString()
        ..fields['travelDate'] = body["travelDate"]
        ..fields['firstName'] = body["firstName"]
        ..fields["lastName"] = body["lastName"]
        ..fields["phone"] = body["phone"]
        ..fields["email"] = body["email"]
        ..fields["motherFirstName"] = body["motherFirstName"]
        ..fields["motherLastName"] = body["motherLastName"]
        ..fields["addressLine_1"] = body["addressLine_1"]
        ..fields["addressLine_2"] = body["addressLine_2"]
        ..fields["city"] = body["city"]
        ..fields["zipcode"] = body["zipcode"]
        ..fields["paymentStatus"] = body["paymentStatus"]
        ..fields["payment_type"] = body["payment_type"]
        ..fields["usertype"] = body["usertype"]
        ..fields["created_by"] = body["created_by"]
        ..files.add(await http.MultipartFile.fromPath(
          'passport',
          body["passport"],
        ))
        ..files.add(await http.MultipartFile.fromPath(
          'photo',
          body["photo"],
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
        return VisaSubmitModelResponse.fromJson(data: responseBody);
      } else if (response.statusCode == 200 &&
          responseBody.containsKey("success") &&
          responseBody["success"] != 1) {
        return VisaSubmitModelResponse.fromJson(data: responseBody);
      }
      AppConstants.logger("response.reasonPhrase", response.reasonPhrase);
      return VisaSubmitModelResponse.withError(errorMessage: response.reasonPhrase);
    } catch (e) {
      print(e);
      return VisaSubmitModelResponse.withError(errorMessage: e.toString());
    }
  }
  
}
