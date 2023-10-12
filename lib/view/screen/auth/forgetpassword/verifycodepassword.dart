import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/functionn/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import '../../../../controller/auth/forgetpassword/verifycodecontroller.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeControllerImp());
    return Scaffold(
        backgroundColor: AppColor.colorOnBooardingscreen_2,
        appBar: AppBar(
          backgroundColor: AppColor.colorOnBooardingscreen_2,
          elevation: 0.0,
          centerTitle: true,
          title: Text("${'22'.tr} password"),
        ),
        body: GetBuilder<VerifyCodeControllerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
              ),
              child: ListView(
                children: [
                  Text(
                    '23'.tr, textAlign: TextAlign.center,
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
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: OTPTextField(
                      length: 5,
                      width: MediaQuery.of(context).size.width,
                      fieldWidth: 20,
                      style: const TextStyle(fontSize: 17),
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldStyle: FieldStyle.underline,
                      onCompleted: (verfiycode) {
                        controller.goToResetPassword(verfiycode);
                      },
                      onChanged: (c) {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
