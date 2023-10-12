import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/functionn/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/auth/forgetpassword/resetpasswordcontroller.dart';
import '../../../../core/functionn/validinput.dart';
import '../../../widget/auth/custombuttonauth.dart';
import '../../../widget/auth/customtextformfeild.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
        backgroundColor: AppColor.colorOnBooardingscreen_2,
        appBar: AppBar(
          backgroundColor: AppColor.colorOnBooardingscreen_2,
          elevation: 0.0,
          centerTitle: true,
          title: const Text("ResestPassword"),
        ),
        body: GetBuilder<ResetPasswordControllerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
              ),
              child: Form(
                key: controller.formState,
                child: ListView(
                  children: [
                    Text(
                      'NewPassword', textAlign: TextAlign.center,
                      // ignore: deprecated_member_use
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        textAlign: TextAlign.center,
                        // ignore: deprecated_member_use
                        '6'.tr, style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormFeild(
                      isNumber: false,
                      valid: (val) {
                        return validInput(val!, 5, 40, 'password');
                      },
                      mycontroller: controller.password,
                      hinttext: 'Enter Your Password',
                      labletext: 'Password',
                      suffixIcon: Icons.email_outlined,
                    ),
                    CustomTextFormFeild(
                      isNumber: false,
                      valid: (val) {
                        return validInput(val!, 5, 40, 'password');
                      },
                      mycontroller: controller.rePassword,
                      hinttext: 'Enter Your RePassword',
                      labletext: 'RePassword',
                      suffixIcon: Icons.email_outlined,
                    ),
                    CustomButtonAuth(
                      onPressed: () {
                        controller.goToSuccessPassword();
                      },
                      text: 'Save',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
