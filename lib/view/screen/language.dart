import 'package:ecommerce/core/constant/approutes.dart';
import 'package:ecommerce/core/localization/changeloacal.dart';
import 'package:ecommerce/view/widget/Language/custombuttonlang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language extends GetView<LocaleController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ignore: deprecated_member_use
            Text(
              '1'.tr,
              // ignore: deprecated_member_use
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(
              height: 50,
            ),
            CustomButtonLanguage(
                onPressed: () {
                  controller.changeLang('ar');
                  Get.toNamed(AppRoute.boardingScreen);
                },
                textbutton: '3'.tr),
            CustomButtonLanguage(
                onPressed: () {
                  controller.changeLang('en');
                  Get.toNamed(AppRoute.boardingScreen);
                },
                textbutton: '2'.tr),
          ],
        ),
      ),
    );
  }
}
