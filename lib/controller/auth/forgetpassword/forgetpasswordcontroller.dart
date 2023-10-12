import 'package:ecommerce/core/constant/approutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/statusrequest.dart';
import '../../../core/functionn/hanlingdata.dart';
import '../../../data/datasource/remote/auth/forgetpassword/checkemaildata.dart';

abstract class ForgetPasswordController extends GetxController {
  goToVerifyPassword();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController email;
  StatusRequest statusRequest = StatusRequest.none;
  ForgetPasswordCheckEmailData forgetPasswordCheckEmail =
      ForgetPasswordCheckEmailData(Get.find());
  List data = [];

  @override
  goToVerifyPassword() async {
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response =
          await forgetPasswordCheckEmail.getDatacheckemail(email.text);
      print(response);
      statusRequest = hanlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          //data.add(response['data']);
          Get.offNamed(AppRoute.verify, arguments: {
            'email': email.text,
          });
        } else {
          Get.defaultDialog(
              title: 'worning', middleText: 'Email Adress Not Correct');
          statusRequest = StatusRequest.serverfailure;
        }
      }
    }
    update();
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
