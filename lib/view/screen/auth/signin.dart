import 'package:ecommerce/controller/auth/signincontroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/functionn/alertexitapp.dart';
import 'package:ecommerce/core/functionn/handlingdataview.dart';
import 'package:ecommerce/core/functionn/validinput.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextformfeild.dart';
import '../../widget/auth/logoimageapp.dart';
import '../../widget/auth/textsigninorsignup.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignInControllerImp());
    return Scaffold(
        backgroundColor: AppColor.colorOnBooardingscreen_2,
        appBar: AppBar(
          backgroundColor: AppColor.colorOnBooardingscreen_2,
          elevation: 0.0,
          centerTitle: true,
          title: Text('4'.tr),
        ),
        body: WillPopScope(
            onWillPop: alertExitApp,
            child: GetBuilder<SignInControllerImp>(
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
                              const LogoImageApp(),
                              Text(
                                '5'.tr, textAlign: TextAlign.center,
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
                              GetBuilder<SignInControllerImp>(
                                builder: (controller) => CustomTextFormFeild(
                                  isNumber: false,
                                  obscureText: controller.isShowpassword,
                                  onTapicon: () {
                                    controller.showPassword();
                                  },
                                  valid: (val) {
                                    return validInput(val!, 5, 40, 'password');
                                  },
                                  mycontroller: controller.password,
                                  hinttext: '9'.tr,
                                  labletext: '10'.tr,
                                  suffixIcon: Icons.lock_clock_outlined,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  controller.goToForgetPassword();
                                },
                                child: Text(
                                  '11'.tr,
                                  textAlign: TextAlign.end,
                                ),
                              ),
                              CustomButtonAuth(
                                onPressed: () {
                                  controller.signin();
                                },
                                text: '12'.tr,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextSigninORsignUp(
                                onTap: () {
                                  controller.goToSignUp();
                                },
                                text1: '13'.tr,
                                text2: '14'.tr,
                              )
                            ],
                          ),
                        ),
                      ),
                    ))));
  }
}
