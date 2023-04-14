import 'package:al_fifa/api/visa_repo.dart';
import 'package:al_fifa/models/Visa/country_model.dart';
import 'package:al_fifa/models/Visa/visa_place_model.dart';
import 'package:al_fifa/models/Visa/visa_requirement_model.dart';
import 'package:al_fifa/models/Visa/visa_submit_model.dart';
import 'package:al_fifa/models/Visa/visa_type_model.dart';

class VisaRepository {
  final _visaApiProvider = VisaApiProvider();
  Future<VisaCountryModelResponse> getCountry() async {
    return await _visaApiProvider.getCountry();
  }
  Future<VisaTypeModelResponse> getVisaType({required Map body}) async {
    return await _visaApiProvider.getVisaType(body: body);
  }
  Future<VisaPlaceModelResponse> getVisaplace({required Map body}) async {
    return await _visaApiProvider.getVisaplace(body: body);
  }
  Future<VisaRequirementModelResponse> getVisaRequirement({required Map body}) async {
    return await _visaApiProvider.getVisaRequirement(body: body);
  }
  Future<VisaSubmitModelResponse> visaSubmit({required Map body}) async {
    return await _visaApiProvider.visaSubmit(body: body);
  }
 
}
