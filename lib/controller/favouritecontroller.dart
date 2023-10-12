import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/functionn/hanlingdata.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/favouritedata.dart';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FavouriteController extends GetxController {
  Map isFavourite = {};

  FavouriteData favouriteData = FavouriteData(Get.find());
  List data = [];
  MyServices myServices = Get.find();
  late StatusRequest statusRequest = StatusRequest.none;
  setFavourite(id, val) {
    isFavourite[id] = val;
    update();
  }

  addFavData(String itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await favouriteData.addFavourite(
        myServices.sharedPreferences.getInt('id').toString(),
        itemsid.toString());
    statusRequest = hanlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(
            title: "إشعار",
            messageText: const Text("تم إضافة المنتج إلى المفضلة"));
      } else {
        statusRequest = StatusRequest.noData;
      }
      update();
    }
  }

  removeFavData(String itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await favouriteData.removeFavourite(
        myServices.sharedPreferences.getInt('id').toString(),
        itemsid.toString());
    statusRequest = hanlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        if (response['status'] == 'success') {
          Get.rawSnackbar(
              title: "إشعار",
              messageText: const Text("تم حذف المنتج من المفضلة"));
        } else {
          statusRequest = StatusRequest.noData;
        }
      }
      update();
    }
  }
}
