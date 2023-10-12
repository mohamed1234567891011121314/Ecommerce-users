import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/functionn/hanlingdata.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/myfavouriteviewdata.dart';
import 'package:ecommerce/data/model/modelfavouriteview.dart';

import 'package:get/get.dart';

class MyFavouriteViewController extends GetxController {
  MyFanouriteViewData myFavouriteViewData = MyFanouriteViewData(Get.find());
  List<ModelFavouiteView> data = [];
  MyServices myServices = Get.find();
  ModelFavouiteView? modelFavouiteView;
  late StatusRequest statusRequest = StatusRequest.none;

  getFavouriteData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await myFavouriteViewData.addFavourite(
      myServices.sharedPreferences.getInt('id').toString(),
    );
    statusRequest = hanlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List responsdata = response['data'];
        data.addAll(responsdata.map((e) => ModelFavouiteView.fromJson(e)));
      } else {
        statusRequest = StatusRequest.noData;
      }
    }
    update();
  }

  deleteFavourite(String favouriteid) {
    // ignore: unused_local_variable
    var response = myFavouriteViewData.deleteFavourite(
      favouriteid,
    );
    // ignore: unrelated_type_equality_checks
    data.removeWhere((element) => element.favouriteId == favouriteid);
    update();
  }

  @override
  void onInit() {
    getFavouriteData();
    super.onInit();
  }
}
