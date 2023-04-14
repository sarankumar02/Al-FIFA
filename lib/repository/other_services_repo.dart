import 'package:al_fifa/api/other_services_api.dart';
import 'package:al_fifa/models/otherServices_model.dart';

class OtherServicesRepository {
  final _passportApiProvider = OtherServicesApiProvider();

  Future<OthersModelResponse> otherServicesSubmit({required Map body,required String endPoint}) async {
    return await _passportApiProvider.otherServicesSubmit(body: body,endPoint: endPoint);
  }
  Future<OthersModelResponse> translation({required Map body,required String endPoint}) async {
    return await _passportApiProvider.translation(body: body,endPoint: endPoint);
  }
 
}
