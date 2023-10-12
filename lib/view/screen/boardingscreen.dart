import 'package:ecommerce/controller/onboardingcontroll.dart';
import 'package:ecommerce/view/widget/onbording/dotcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/onbording/custombutton.dart';
import '../widget/onbording/customslider.dart';

class BoardingScreen extends StatelessWidget {
  const BoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return const Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Expanded(
          flex: 3,
          child: CustomSliderOnBoarding(),
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              CostumControllerOnBoarding(),
              Spacer(
                flex: 2,
              ),
              CustomButtonOnBoarding(),
            ],
          ),
        ),
      ],
    )));
  }
}
