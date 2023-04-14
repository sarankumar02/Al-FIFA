import 'package:al_fifa/api/settings_api.dart';
import 'package:al_fifa/models/about_us.dart';
import 'package:al_fifa/models/contact_us.dart';
import 'package:al_fifa/models/country_model.dart';
import 'package:al_fifa/models/passport_submit.dart';

class SettingsRepository {
  final _settingsApiProvider = SettingsApiProvider();
  Future<AboutModelResponse> getAboutus() async {
    return await _settingsApiProvider.getAboutus();
  }
  Future<ContactModelResponse> contactUsSubmit({required Map body}) async {
    return await _settingsApiProvider.contactUsSubmit(body: body);
  }
  
}
