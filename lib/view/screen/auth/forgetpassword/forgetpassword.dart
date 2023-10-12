import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/functionn/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/auth/forgetpassword/forgetpasswordcontroller.dart';
import '../../../../core/functionn/alertexitapp.dart';
import '../../../../core/functionn/validinput.dart';
import '../../../widget/auth/custombuttonauth.dart';
import '../../../widget/auth/customtextformfeild.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.colorOnBooardingscreen_2,
      appBar: AppBar(
        backgroundColor: AppColor.colorOnBooardingscreen_2,
        elevation: 0.0,
        centerTitle: true,
        title: Text("11".tr),
      ),
      body: WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<ForgetPasswordControllerImp>(
              init: ForgetPasswordControllerImp(),
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
                              '21'.tr, textAlign: TextAlign.center,
                              // ignore: deprecated_member_use
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              child: Text(
                                textAlign: TextAlign.center,
                                // ignore: deprecated_member_use
                                '6'.tr,
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextFormFeild(
                              isNumber: false,
                              valid: (val) {
                                return validInput(val!, 5, 40, 'email');
                              },
                              mycontroller: controller.email,
                              hinttext: '7'.tr,
                              labletext: '8'.tr,
                              suffixIcon: Icons.email_outlined,
                            ),
                            CustomButtonAuth(
                              onPressed: () {
                                controller.goToVerifyPassword();
                              },
                              text: '20'.tr,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            // CustomTextSigninORForgetPassword(
                            //   onTap: () {
                            //     controller.goToSignIn();
                            //   },
                            //   text1: '19'.tr,
                            //   text2: '12'.tr,
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ))),
    );
  }
}
