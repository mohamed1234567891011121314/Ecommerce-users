import 'dart:io';

import 'package:ecommerce/core/constant/approutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
      title: 'Alert',
      middleText: 'Do you want Exit Application',
      actions: [
        ElevatedButton(
          onPressed: () {
            exit(0);
          },
          child: const Text('Confirm'),
        ),
        ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('Cancel'),
        ),
      ]);
  return Future.value(true);
}

Future<bool> alertExitApp2() {
  Get.defaultDialog(
      title: 'Alert',
      middleText: 'Do you want Go to Home',
      actions: [
        ElevatedButton(
          onPressed: () {
            Get.offAllNamed(AppRoute.homePage);
          },
          child: const Text('Yes'),
        ),
        ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('No'),
        ),
      ]);
  return Future.value(true);
}
