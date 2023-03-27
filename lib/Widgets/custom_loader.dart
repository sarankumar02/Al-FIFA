import 'package:al_fifa/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


Widget customLoader() {
  return  SpinKitFadingCircle(
    color: AppColor.primaryColor,
    size: 50.0,
  );
}

