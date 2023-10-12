import 'package:ecommerce/core/constant/approutes.dart';
import 'package:ecommerce/data/datasource/remote/auth/signindata.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functionn/hanlingdata.dart';
import '../../core/services/services.dart';

abstract class SignInController extends GetxController {
  signin();
  goToSignUp();
  goToForgetPassword();
}

class SignInControllerImp extends SignInController {
  late TextEditingController email;
  late TextEditingController password;
  StatusRequest statusRequest = StatusRequest.none;
  SigninData signinData = SigninData(Get.find());

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late bool isShowpassword = true;
  MyServices myservices = Get.find();
  @override
  signin() async {
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signinData.getDataSignin(
        email.text,
        password.text,
      );
      statusRequest = hanlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          print('llllllllllllllllllllllllllllllllllllllllllllllljhhhhhhhhh');
          if (response['data']['users_approve'] == 1) {
            // data.add(response['data']);

            myservices.sharedPreferences
                .setInt('id', response['data']['users_id']);
            int userid = myservices.sharedPreferences.getInt('id')!;
            myservices.sharedPreferences
                .setString('username', response['data']['users_name']);
            myservices.sharedPreferences
                .setString('email', response['data']['users_email']);
            myservices.sharedPreferences
                .setString('phone', response['data']['users_phone']);
            myservices.sharedPreferences.setString('step', '2');
            FirebaseMessaging.instance.subscribeToTopic('user');
            FirebaseMessaging.instance.subscribeToTopic("user${userid}");
            Get.offNamed(AppRoute.homePage);
          } else {
            Get.toNamed(AppRoute.verfyCodeSignUp,
                arguments: {'email': email.text});
          }
        } else {
          Get.defaultDialog(
              title: 'worning',
              middleText: 'Password Number or Email Adress Not Correct');
          statusRequest = StatusRequest.noData;
        }
      }
    }
    update();
  }

  showPassword() {
    isShowpassword = isShowpassword == false ? true : false;
    update();
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signup);
  }

  @override
  void onInit() async {
    email = TextEditingController();
    password = TextEditingController();
    await FirebaseMessaging.instance.getToken().then((value) {
      print("=======$value=====");
    });
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.offNamed(AppRoute.forgetPassword);
  }
}
