import 'package:al_fifa/api/home_api.dart';
import 'package:al_fifa/api/other_services_api.dart';
import 'package:al_fifa/models/otherServices_model.dart';
import 'package:al_fifa/models/slider_model.dart';

class HomeRepository {
  final _homeApiProvider = HomeApiProvider();
  Future<SliderModelResponse> getHomeBannerImages() async {
    return await _homeApiProvider.getHomeBannerImages();
  }
}
