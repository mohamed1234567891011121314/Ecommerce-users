// ignore_for_file: body_might_complete_normally_nullable

import 'package:ecommerce/core/constant/approutes.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MyMiddleWare extends GetMiddleware {
  int? priority = 1;
  MyServices myservices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myservices.sharedPreferences.getString('step') == '2') {
      return const RouteSettings(name: AppRoute.homePage);
    }
    if (myservices.sharedPreferences.getString('step') == '1') {
      return const RouteSettings(name: AppRoute.signin);
    }
  }
}
