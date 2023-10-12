import 'package:ecommerce/controller/homepagecontroller.dart';
import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/approutes.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/itemsdata.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:get/get.dart';

import '../core/functionn/hanlingdata.dart';

abstract class ItemsController extends SearchMixController {
  inialData();
  changeSelected(val, int catid);
  getdaTa(int catid, MyServices myServices);
  goToItemsDetails(ItemsModel itemsModel);
}

class ItemsControllerImp extends ItemsController {
  ItemsData itemsdata = ItemsData(Get.find());
  List itemslistdata = [];
  List categories = [];
  int? selected;
  int? catid;
  int deliveryTime = 0;
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  @override
  void onInit() {
    inialData();
    super.onInit();
  }

  @override
  inialData() {
    deliveryTime = myServices.sharedPreferences.getInt('deliverytime')!;
    categories = Get.arguments['categories'];
    selected = Get.arguments['selected'];
    catid = Get.arguments['catid'];
    getdaTa(catid!, myServices);
  }

  getdaTa(catid, myServices) async {
    itemslistdata.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsdata.getData(
        catid, myServices.sharedPreferences.getInt('id')!.toString());
    statusRequest = hanlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        itemslistdata.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.noData;
      }
    }
    update();
  }

  @override
  changeSelected(val, int catid) {
    selected = val;
    getdaTa(catid, myServices);
    update();
  }

  @override
  goToItemsDetails(itemsModel) {
    Get.toNamed(AppRoute.itemsdetails, arguments: {'itemsModel': itemsModel});
  }
}
