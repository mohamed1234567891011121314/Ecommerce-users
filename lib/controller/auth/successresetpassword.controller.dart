import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/approutes.dart';
import 'package:get/get.dart';

abstract class SuccessResetPasswordController extends GetxController {
  goToSignUp();
}

class SuccessResetPasswordControllerImp extends SuccessResetPasswordController {
  StatusRequest statusRequest = StatusRequest.none;
  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signin);
  }
}
