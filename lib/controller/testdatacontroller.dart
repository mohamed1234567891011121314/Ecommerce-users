import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/data/datasource/remote/testdata.dart';
import 'package:get/get.dart';
import '../core/functionn/hanlingdata.dart';

class TestDataController extends GetxController {
  TestData testdata = TestData(Get.find());
  List data = [];
  late StatusRequest statusRequest = StatusRequest.success;

  getdaTa() async {
    statusRequest = StatusRequest.loading;
    var response = await testdata.getData();
    statusRequest = hanlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        data.add(response['data']);
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
