import 'package:ecommerce/core/constant/approutes.dart';
import 'package:ecommerce/data/datasource/remote/auth/signupdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functionn/hanlingdata.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToSignIn();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController username;
  late TextEditingController phone;
  late TextEditingController password;
  SignupData signupData = SignupData(Get.find());
  //List data = [];
  late StatusRequest statusRequest = StatusRequest.none;
  @override
  signUp() async {
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupData.getDataSignup(
          username.text, password.text, email.text, phone.text);
      statusRequest = hanlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          //data.add(response['data']);
          Get.offNamed(AppRoute.verfyCodeSignUp,
              arguments: {"email": email.text});
        } else {
          Get.defaultDialog(
              title: 'worning',
              middleText: 'phone number or email adress already exists');
          statusRequest = StatusRequest.noData;
        }
      }
      update();
    } else {
      print('not valid');
    }
    //
  }

  @override
  goToSignIn() {
    Get.offAllNamed(AppRoute.signin);
  }

  @override
  void onInit() {
    email = TextEditingController();
    username = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    username.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}
