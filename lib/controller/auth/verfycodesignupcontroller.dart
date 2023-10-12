import 'package:ecommerce/core/constant/approutes.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functionn/hanlingdata.dart';
import '../../data/datasource/remote/auth/verfiycodedata.dart';

abstract class VerifyCodeSignInEmailController extends GetxController {
  goToSuccessEmail(String verfiycodeSignup);
}

class VerifyCodeSignInEmailControllerImp
    extends VerifyCodeSignInEmailController {
  String? email;
  StatusRequest statusRequest = StatusRequest.none;
  VerfiyCodeSignupData verfiyCodeSignupData = VerfiyCodeSignupData(Get.find());
  @override
  goToSuccessEmail(verfiycodeSignup) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await verfiyCodeSignupData.getDataVerfiycode(email!, verfiycodeSignup);
    statusRequest = hanlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        //data.add(response['data']);
        Get.offNamed(AppRoute.successSignUp);
      } else {
        Get.defaultDialog(
            title: 'worning', middleText: 'verfiyCode not correct');
        statusRequest = StatusRequest.noData;
      }
    }
    update();
  }

//resendverfiy
  reSendVerfiyCode() {
    verfiyCodeSignupData.reSendVerfiycode(email!);
  }

  @override
  void onInit() {
    email = Get.arguments["email"];
    super.onInit();
  }
}
