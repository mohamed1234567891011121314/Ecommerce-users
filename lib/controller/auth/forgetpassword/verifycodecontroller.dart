import 'package:ecommerce/core/constant/approutes.dart';
import 'package:ecommerce/data/datasource/remote/auth/forgetpassword/verfiycodedata.dart';
import 'package:get/get.dart';

import '../../../core/class/statusrequest.dart';
import '../../../core/functionn/hanlingdata.dart';

abstract class VerifyCodeController extends GetxController {
  goToResetPassword(String verfiycode);
}

class VerifyCodeControllerImp extends VerifyCodeController {
  late String? email;
  StatusRequest statusRequest = StatusRequest.none;
  VerfiyCodeCheckEmailData verfiyCodeCheckEmail =
      VerfiyCodeCheckEmailData(Get.find());

  @override
  goToResetPassword(verfiycode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await verfiyCodeCheckEmail.getDataVerfiyCode(email!, verfiycode);
    print(response);
    statusRequest = hanlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        //data.add(response['data']);
        Get.offNamed(AppRoute.resetPassword, arguments: {'email': email});
      } else {
        Get.defaultDialog(
            title: 'worning', middleText: 'VerifyCode Not Correct');
        statusRequest = StatusRequest.serverfailure;
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];

    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
