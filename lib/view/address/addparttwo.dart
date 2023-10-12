import 'package:ecommerce/controller/address/addparttwocontroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/functionn/handlingdataview.dart';
import 'package:ecommerce/core/shared/custombutton.dart';
import 'package:ecommerce/view/widget/auth/customtextformfeild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddressPartTwo extends StatelessWidget {
  const AddAddressPartTwo({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    AddAddressPartTwoControler controller =
        Get.put(AddAddressPartTwoControler());
    return Scaffold(
      backgroundColor: AppColor.colorOnBooardingscreen_2,
      appBar: AppBar(
        foregroundColor: AppColor.colorOnBooardingscreen_2,
        backgroundColor: AppColor.colorOnBooardingscreen_3,
        title: const Text(
          "add address two",
          style: TextStyle(color: AppColor.colorOnBooardingscreen_2),
        ),
      ),
      body: GetBuilder<AddAddressPartTwoControler>(
          builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding: const EdgeInsets.all(15),
                  child: ListView(
                    children: [
                      CustomTextFormFeild(
                          hinttext: 'name',
                          labletext: 'name',
                          suffixIcon: Icons.near_me,
                          mycontroller: controller.name!,
                          valid: (val) {},
                          isNumber: false),
                      CustomTextFormFeild(
                          hinttext: 'city',
                          labletext: 'city',
                          suffixIcon: Icons.location_city,
                          mycontroller: controller.city!,
                          valid: (val) {},
                          isNumber: false),
                      CustomTextFormFeild(
                          hinttext: 'street',
                          labletext: 'street',
                          suffixIcon: Icons.streetview,
                          mycontroller: controller.street!,
                          valid: (val) {},
                          isNumber: false),
                      CustomButton(
                          onPressed: () {
                            controller.addDataAddress();
                          },
                          text: 'Add')
                    ],
                  ),
                ),
              )),
    );
  }
}
