import 'dart:async';

import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/functionn/hanlingdata.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/orders/orderspendingdata.dart';
import 'package:ecommerce/data/model/ordersmodel.dart';
import 'package:get/get.dart';

class OrdersPendingcontroller extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  OrdersPendingData ordersPendingData = OrdersPendingData(Get.find());

  List<OrdersModel> data = [];

  String printOrderType(int val) {
    if (val == 0) {
      return "Delivery";
    } else {
      return "Recive";
    }
  }

  String printPaymentMethod(int val) {
    if (val == 0) {
      return "Cash On Delivery";
    } else {
      return "Payment Card";
    }
  }

  String printOrderState(int val) {
    if (val == 0) {
      return "Await Approval";
    } else if (val == 1) {
      return "The Order is being Prepared";
    } else if (val == 2) {
      return "On The Way";
    } else if (val == 3) {
      return "on the way in delivery";
    } else {
      return "Archive";
    }
  }

  refreshPage() {
    getOrdersPending();
    update();
  }

  deletedata(int orderid) async {
    statusRequest = StatusRequest.loading;
    data.clear();
    update();
    var response = await ordersPendingData.deleteData(orderid);
    statusRequest = hanlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        statusRequest = StatusRequest.loading;
        Timer.periodic(Duration(seconds: 1), (timer) {
          statusRequest = StatusRequest.success;
          getOrdersPending();
          timer.cancel();
          update();
        });
      } else {
        statusRequest = StatusRequest.noData;
      }
    }
    update();
  }

  getOrdersPending() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersPendingData
        .getData(myServices.sharedPreferences.getInt('id')!);
    statusRequest = hanlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List datalist = response['data'];
        data.addAll(datalist.map((e) => OrdersModel.fromJson(e)));
        update();
        print(response['data']);
      } else {
        statusRequest = StatusRequest.noData;
      }
    }
    update();
  }

  @override
  void onInit() {
    getOrdersPending();
    super.onInit();
  }
}
