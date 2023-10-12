import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/functionn/hanlingdata.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/orders/archiveordersdatat.dart';
import 'package:ecommerce/data/model/ordersmodel.dart';
import 'package:get/get.dart';

class OrdersArchiveController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  ArchiveOrdersData archiveOrdersData = ArchiveOrdersData(Get.find());

  List<OrdersModel> data = [];

  @override
  void onInit() {
    getOrdersArchive();
    super.onInit();
  }

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
    getOrdersArchive();
    update();
  }

  getOrdersArchive() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await archiveOrdersData
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

  submitRating(int orderid, double rating, String comment) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await archiveOrdersData.getratingData(orderid, rating, comment);
    statusRequest = hanlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        getOrdersArchive();
      } else {
        statusRequest = StatusRequest.noData;
      }
    }
    update();
  }
}
