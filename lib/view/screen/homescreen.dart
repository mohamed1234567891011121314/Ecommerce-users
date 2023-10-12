import 'dart:io';

import 'package:ecommerce/core/constant/approutes.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/homescreencontroller.dart';
import '../widget/homepage/custombottomappbarhome.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (contrller) => Scaffold(
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppColor.colorOnBooardingscreen_2,
              onPressed: () {
                Get.toNamed(AppRoute.cart);
              },
              child: const Icon(Icons.shopping_basket_outlined),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: const CustomBottomAppBarHome(),
            body: WillPopScope(
                child: contrller.lestpage.elementAt(contrller.currentpage),
                onWillPop: () {
                  Get.defaultDialog(
                    title: 'Warning',
                    titleStyle:
                        TextStyle(color: AppColor.colorOnBooardingscreen_2),
                    middleText: 'Do You Wont To Exit App',
                    middleTextStyle: TextStyle(color: AppColor.colorfour),
                    onCancel: () {},
                    cancelTextColor: AppColor.colorfour,
                    buttonColor: AppColor.colorOnBooardingscreen_2,
                    confirmTextColor: AppColor.colorOnBooardingscreen_1,
                    onConfirm: () {
                      exit(0);
                    },
                  );
                  return Future.value(false);
                })));
  }
}
