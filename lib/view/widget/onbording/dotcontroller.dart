import 'package:ecommerce/controller/onboardingcontroll.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CostumControllerOnBoarding extends StatelessWidget {
  const CostumControllerOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  onBoardingList.length,
                  (index) => AnimatedContainer(
                      duration: const Duration(microseconds: 900),
                      margin: const EdgeInsets.only(right: 5),
                      width: controller.currentPage == index ? 20 : 5,
                      height: 6,
                      decoration: BoxDecoration(
                        color: AppColor.colorOnBooardingscreen_2,
                        borderRadius: BorderRadius.circular(20),
                      )),
                )
              ],
            ));
  }
}
