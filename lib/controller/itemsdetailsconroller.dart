import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/functionn/hanlingdata.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/cartdata.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class ItemsDetailsController extends GetxController {}

class ItemsDetailsControllerImp extends ItemsDetailsController {
  //CartController cartController = Get.put(CartController());
  CartData cartData = CartData(Get.find());
  MyServices myServices = Get.find();
  int countitems = 0;
  StatusRequest statusRequest = StatusRequest.none;
  ItemsModel itemsModel = Get.arguments['itemsModel'];
  List subitems = [
    {'name': 'red', 'id': 1, 'active': '0'},
    {'name': 'black', 'id': 2, 'active': '0'},
    {'name': 'yallow', 'id': 3, 'active': '1'},
  ];
  void inialData() async {
    statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments['itemsModel'];
    countitems = await getCountCart(itemsModel.itemsId!.toString());
    statusRequest = StatusRequest.success;
    update();
  }

  add() {
    addCart(itemsModel.itemsId!);
    countitems++;
    update();
  }

  remove() {
    if (countitems > 0) {
      deleteCart(itemsModel.itemsId!);
      countitems--;
      update();
    }
  }

  addCart(int itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.addCart(
        myServices.sharedPreferences.getInt('id')!.toString(),
        itemsid.toString());
    print("${response}");
    statusRequest = hanlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(
            title: "إشعار",
            messageText: const Text("تم إضافة المنتج إلى السلة"));
      } else {
        statusRequest = StatusRequest.noData;
      }
      update();
    }
  }

  deleteCart(int itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.deleteCart(
        myServices.sharedPreferences.getInt('id').toString(),
        itemsid.toString());
    statusRequest = hanlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(
            title: "إشعار", messageText: const Text("تم حذف المنتج من السلة"));
      } else {
        statusRequest = StatusRequest.noData;
      }
      update();
    }
  }

  getCountCart(String itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.getcountitems(
        myServices.sharedPreferences.getInt('id').toString(),
        itemsid.toString());
    statusRequest = hanlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        var countitems;
        countitems = response['data'];
        //print(response['data'].runtimeType);
        return countitems;
      } else {
        statusRequest = StatusRequest.noData;
      }
      update();
    }
  }

  @override
  void onInit() {
    inialData();
    super.onInit();
  }
}
