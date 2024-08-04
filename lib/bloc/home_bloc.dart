import 'package:al_fifa/models/slider_model.dart';
import 'package:al_fifa/repository/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeBloc {
  final _homeRepo = HomeRepository();

  final BehaviorSubject<SliderModelResponse> _sliderResponse =
      BehaviorSubject<SliderModelResponse>();
  Stream<SliderModelResponse> get sliderResponse => _sliderResponse;

  Future<SliderModelResponse> getHomeBannerImages({
    required BuildContext context,
  }) async {
    // context.loaderOverlay.show(widget: customLoader());
    var response = await _homeRepo.getHomeBannerImages();
    // changeIsLoading(false);
    // context.loaderOverlay.hide();
    _sliderResponse.sink.add(response);

    return response;
  }

  getUserId() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var result = _prefs.setString("uid", "0");
    return result;
  }
}
