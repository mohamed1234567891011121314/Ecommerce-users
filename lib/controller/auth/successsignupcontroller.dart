import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/approutes.dart';
import 'package:get/get.dart';

abstract class SuccessSignUpController extends GetxController {
  goToSignUp();
}

class SuccessSignUpControllerImp extends SuccessSignUpController {
  StatusRequest statusRequest = StatusRequest.none;
  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signin);
  }
}
