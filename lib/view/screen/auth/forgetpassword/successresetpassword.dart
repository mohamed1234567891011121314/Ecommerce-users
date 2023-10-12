import 'package:ecommerce/controller/auth/successresetpassword.controller.dart';
import 'package:ecommerce/core/functionn/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/color.dart';
import '../../../widget/auth/custombuttonauth.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SuccessResetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Success Reset Password',
            style: TextStyle(color: AppColor.colorOnBooardingscreen_3),
          ),
          backgroundColor: AppColor.colorOnBooardingscreen_2,
          elevation: 0,
        ),
        body: GetBuilder<SuccessResetPasswordControllerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Container(
              color: AppColor.colorOnBooardingscreen_2,
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  const Center(
                      child: Icon(
                    Icons.check_circle_outline,
                    size: 200,
                    color: AppColor.colorOnBooardingscreen_3,
                  )),
                  const Text(
                    'Congratulations',
                    style: TextStyle(fontSize: 25),
                  ),
                  const Spacer(),
                  Container(
                    width: double.infinity,
                    child: CustomButtonAuth(
                      onPressed: () {
                        controller.goToSignUp();
                      },
                      text: "Sign Up",
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
