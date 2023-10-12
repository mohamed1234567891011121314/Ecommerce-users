import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/functionn/alertexitapp.dart';
import 'package:ecommerce/core/functionn/handlingdataview.dart';
import 'package:ecommerce/core/functionn/validinput.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/signupcontroller.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextformfeild.dart';
import '../../widget/auth/textsigninorsignup.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.colorOnBooardingscreen_2,
        appBar: AppBar(
          backgroundColor: AppColor.colorOnBooardingscreen_2,
          elevation: 0.0,
          centerTitle: true,
          title: Text('14'.tr),
        ),
        body: WillPopScope(
            onWillPop: alertExitApp,
            child: GetBuilder<SignUpControllerImp>(
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
                              CustomTextFormFeild(
                                isNumber: false,
                                valid: (val) {
                                  return validInput(val!, 5, 40, 'username');
                                },
                                mycontroller: controller.username,
                                hinttext: '16'.tr,
                                labletext: '15'.tr,
                                suffixIcon: Icons.person_pin,
                              ),
                              CustomTextFormFeild(
                                isNumber: true,
                                valid: (val) {
                                  return validInput(val!, 5, 40, 'phone');
                                },
                                mycontroller: controller.phone,
                                hinttext: '18'.tr,
                                labletext: '17'.tr,
                                suffixIcon: Icons.phone_iphone_sharp,
                              ),
                              CustomTextFormFeild(
                                isNumber: false,
                                valid: (val) {
                                  return validInput(val!, 5, 40, 'password');
                                },
                                mycontroller: controller.password,
                                hinttext: '9'.tr,
                                labletext: '10'.tr,
                                suffixIcon: Icons.lock_clock_outlined,
                              ),
                              CustomButtonAuth(
                                onPressed: () {
                                  controller.signUp();
                                },
                                text: '14'.tr,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextSigninORsignUp(
                                onTap: () {
                                  controller.goToSignIn();
                                },
                                text1: '19'.tr,
                                text2: '12'.tr,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ))));
  }
}
