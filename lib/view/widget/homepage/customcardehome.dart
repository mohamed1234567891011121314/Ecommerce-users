import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/homepagecontroller.dart';
import '../../../core/constant/color.dart';

class CustomCardHome extends GetView<HomePageControllerImp> {
  final String title;
  final String subtitle;
  const CustomCardHome(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: Stack(children: [
        Container(
          alignment: Alignment.center,
          height: 150,
          decoration: BoxDecoration(
              color: AppColor.colorOnBooardingscreen_2,
              borderRadius: BorderRadius.circular(15)),
          child: ListTile(
            title: Text(title,
                style: const TextStyle(
                  fontSize: 20,
                )),
            subtitle: Text(
              subtitle,
              style: const TextStyle(fontSize: 30),
            ),
          ),
        ),
        Positioned(
            top: -20,
            right: controller.lang == 'en' ? -20 : null,
            left: controller.lang == 'ar' ? -20 : null,
            child: Container(
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(160)),
            ))
      ]),
    );
  }
}
