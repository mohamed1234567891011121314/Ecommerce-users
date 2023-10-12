import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/functionn/hanlingdata.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/orders/notificationdata.dart';
import 'package:get/get.dart';

class NotificatonController extends GetxController {
  NotificationData notificationData = NotificationData(Get.find());
  List data = [];
  late StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  getdaTa() async {
    statusRequest = StatusRequest.loading;
    var response = await notificationData
        .getData(myServices.sharedPreferences.getInt('id')!);
    statusRequest = hanlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        data.addAll(response['data']);
        print(data);
      } else {
        statusRequest = StatusRequest.noData;
      }
    }
    update();
  }

  @override
  void onInit() {
    getdaTa();
    super.onInit();
  }
}
