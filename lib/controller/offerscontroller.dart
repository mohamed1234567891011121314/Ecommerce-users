import 'package:ecommerce/controller/homepagecontroller.dart';
import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/data/datasource/remote/offersdata.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../core/functionn/hanlingdata.dart';

class OffersController extends SearchMixController {
  OffersData offersData = OffersData(Get.find());
  List<ItemsModel> data = [];
  late StatusRequest statusRequest = StatusRequest.none;
  TextEditingController? search;

  @override
  void onInit() {
    search = TextEditingController();
    getdaTa();
    super.onInit();
  }

  getdaTa() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await offersData.getData();
    statusRequest = hanlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List datalist = response['data'];
        data.addAll(datalist.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.noData;
      }
    }
    update();
  }
}
