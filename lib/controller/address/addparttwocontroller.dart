import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/approutes.dart';
import 'package:ecommerce/core/functionn/hanlingdata.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/addressdata.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AddAddressPartTwoControler extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  AddressData addAddressData = AddressData(Get.find());
  MyServices myServices = Get.find();
  TextEditingController? name;
  TextEditingController? city;
  TextEditingController? street;
  String? lat;
  String? long;
  initalData() {
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    lat = Get.arguments['lat'];
    long = Get.arguments['long'];
  }

  addDataAddress() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addAddressData.addData(
        myServices.sharedPreferences.getInt('id')!,
        name!.text,
        city!.text,
        street!.text,
        lat!,
        long!);

    statusRequest = hanlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.offAllNamed(AppRoute.homePage);
        Get.snackbar('Success', 'Now You Can Created Orders');
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  @override
  void onInit() {
    initalData();
    super.onInit();
  }
}
