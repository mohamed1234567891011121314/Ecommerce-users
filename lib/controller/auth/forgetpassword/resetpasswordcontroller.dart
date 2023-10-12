import 'package:ecommerce/core/constant/approutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/statusrequest.dart';
import '../../../core/functionn/hanlingdata.dart';
import '../../../data/datasource/remote/auth/forgetpassword/resetpasswoddata.dart';

abstract class ResetPasswordController extends GetxController {
  goToSuccessPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late TextEditingController password;
  late TextEditingController rePassword;
  String? email;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());

  @override
  goToSuccessPassword() async {
    // ignore: curly_braces_in_flow_control_structures
    if (password.text != rePassword.text) {
      Get.defaultDialog(
          title: 'warning', middleText: 'Password Number Not Match');
    }
    if (password.text == rePassword.text) {
      var formdata = formState.currentState;
      if (formdata!.validate()) {
        statusRequest = StatusRequest.loading;
        update();
        var response =
            await resetPasswordData.getDataVerfiyCode(email!, password.text);
        print(response);
        statusRequest = hanlingData(response);
        if (StatusRequest.success == statusRequest) {
          if (response['status'] == 'success') {
            //data.add(response['data']);
            Get.offNamed(AppRoute.successResetPassword);
          } else {
            Get.defaultDialog(title: 'worning', middleText: 'try again');
            statusRequest = StatusRequest.serverfailure;
          }
        }
        update();
        //Get.toNamed(AppRoute.successResetPassword);
      } else {
        print('not valid');
      }
    }
  }

  @override
  void onInit() {
    password = TextEditingController();
    rePassword = TextEditingController();
    email = Get.arguments['email'];

    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    rePassword.dispose();
    super.dispose();
  }
}
