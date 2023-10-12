import 'package:ecommerce/core/constant/approutes.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  MyServices myServices = Get.find();
  logout() {
    int userid = myServices.sharedPreferences.getInt('id')!;
    FirebaseMessaging.instance.unsubscribeFromTopic('user');
    FirebaseMessaging.instance.unsubscribeFromTopic('user${userid}');
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.language);
  }
}
