import 'package:ecommerce/controller/onboardingcontroll.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/datasource/static/static.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val) {
          controller.onPagechnaged(val);
        },
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) => Column(
              children: [
                Text(onBoardingList[i].title!,
                    // ignore: deprecated_member_use
                    style: Theme.of(context).textTheme.headline1),
                Image.asset(
                  onBoardingList[i].image!,
                  height: 400,
                ),
                // ignore: sized_box_for_whitespace
                Container(
                    width: double.infinity,
                    child: Text(
                      onBoardingList[i].body!,
                      // ignore: deprecated_member_use
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.center,
                    )),
              ],
            ));
  }
}
