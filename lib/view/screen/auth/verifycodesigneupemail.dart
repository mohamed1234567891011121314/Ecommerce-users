import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import '../../../controller/auth/verfycodesignupcontroller.dart';

class VerifyCodeSignInEmail extends StatelessWidget {
  const VerifyCodeSignInEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.colorOnBooardingscreen_2,
        appBar: AppBar(
          backgroundColor: AppColor.colorOnBooardingscreen_2,
          elevation: 0.0,
          centerTitle: true,
          title: Text("${'22'.tr} Email"),
        ),
        body: GetBuilder<VerifyCodeSignInEmailControllerImp>(
          init: VerifyCodeSignInEmailControllerImp(),
          builder: (controller) => controller.statusRequest ==
                  StatusRequest.loading
              ? const Center(
                  child: Text('loading'),
                )
              : Container(
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
                          onCompleted: (String verfiycodeSignup) {
                            controller.goToSuccessEmail(verfiycodeSignup);
                          },
                          onChanged: (c) {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: InkWell(
                          onTap: () {
                            controller.reSendVerfiyCode();
                          },
                          child: const Center(
                              child: Text(
                            'Resend verfiy code',
                            style: TextStyle(
                                fontSize: 22, color: AppColor.colorfour),
                          )),
                        ),
                      )
                    ],
                  ),
                ),
        ));
  }
}
