import 'package:al_fifa/api/auth_api.dart';
import 'package:al_fifa/api/passport_api.dart';
import 'package:al_fifa/models/country_model.dart';
import 'package:al_fifa/models/forgot_password_model.dart';
import 'package:al_fifa/models/login_model.dart';
import 'package:al_fifa/models/passport_submit.dart';
import 'package:al_fifa/models/profile_model.dart';
import 'package:al_fifa/models/profile_update_model.dart';
import 'package:al_fifa/models/register_model.dart';
import 'package:al_fifa/models/reset_password_model.dart';

class PassPortRepository {
  final _passportApiProvider = PasssPortApiProvider();
  Future<CountrylistModelResponse> getCountry() async {
    return await _passportApiProvider.getCountry();
  }
  Future<PassportSubmitModelResponse> passPartSubmit({required Map body}) async {
    return await _passportApiProvider.passPartSubmit(body: body);
  }
 
}
