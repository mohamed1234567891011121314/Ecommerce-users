import 'dart:ui';
import 'package:ecommerce/core/constant/apptheme.dart';
import 'package:ecommerce/core/functionn/fcmconfig.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();
  ThemeData appTheme = themeEnglish;

  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString('lang', langcode);
    appTheme = langcode == 'ar' ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  requestPerLocation() async {
    bool serviceEnable;
    LocationPermission permission;
    serviceEnable = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnable) {
      return Get.snackbar('تنبيه', 'الرجاء تشغيل  خدمة تحديد الموقع');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar('تنبيه', 'الرجاء إعطاء صلاحية الموقع للتطبيق');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Get.snackbar(
          'تنبيه', 'لايمكن إستخدام التطبيق من دون تشغيل خدمة تحديد الموقع');
    }
  }

  @override
  void onInit() {
    requestPermissionNotification();
    fcmConfig();
    requestPerLocation();
    String? sharedPrefLang = myServices.sharedPreferences.getString('lang');
    if (sharedPrefLang == 'ar') {
      language = const Locale('ar');
      appTheme = themeArabic;
    } else if (sharedPrefLang == 'en') {
      language = const Locale('en');
      appTheme = themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = themeEnglish;
    }
    super.onInit();
  }
}
