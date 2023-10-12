import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/approutes.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/homepagedata.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../core/functionn/hanlingdata.dart';

abstract class HomePageController extends SearchMixController {
  initialdata();
  getData();
  goToItems(List categories, int selected, int catid);
  goToItemsDetailss(itemsModel, categorie, catid);
}

class HomePageControllerImp extends HomePageController {
  MyServices myServices = Get.find();
  String? username;
  int? id;
  int? catid;
  String? lang;

  StatusRequest statusRequest = StatusRequest.loading;
  HomePageData homePageData = HomePageData(Get.find());
  List categories = [];
  List items = [];
  List settingText = [];
  String titleText = "";
  String bodyText = "";
  int deliverytime = 0;

  @override
  void onInit() {
    initialdata();
    getData();
    super.onInit();
  }

  @override
  initialdata() {
    username = myServices.sharedPreferences.getString('username');
    id = myServices.sharedPreferences.getInt('id');
    lang = myServices.sharedPreferences.getString('lang');
    catid = myServices.sharedPreferences.getInt('catid');
    print(catid);
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homePageData.getData();
    statusRequest = hanlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        categories.addAll(response["categories"]['data']);
        items.addAll(response["items"]['data']);
        settingText.addAll(response['settings']['data']);
        titleText = settingText[0]['settings_titlehome'];
        bodyText = settingText[0]['settings_bodyhome'];
        deliverytime = settingText[0]['settings_deliverytime'];
        myServices.sharedPreferences.setInt('deliverytime', deliverytime);
      } else {
        statusRequest = StatusRequest.noData;
      }
    }
    update();
  }

  @override
  goToItems(categories, selected, catid) {
    Get.toNamed(AppRoute.items, arguments: {
      'categories': categories,
      'selected': selected,
      "catid": catid,
    });
  }

  @override
  goToItemsDetailss(itemsModel, Categorie, catid) {
    Get.toNamed(AppRoute.itemsdetails, arguments: {
      "catid": catid,
      'categories': categories,
      'itemsModel': itemsModel,
    });
  }
}

class SearchMixController extends GetxController {
  bool isSearch = false;
  TextEditingController? search;
  StatusRequest statusRequest = StatusRequest.loading;
  HomePageData homePageData = HomePageData(Get.find());
  List<ItemsModel> listdata = [];

  chechSearch(val) {
    if (val == "") {
      isSearch = false;
      statusRequest = StatusRequest.none;
    }
    update();
  }

  onSearchItems() {
    isSearch = true;
    searchData();
    update();
  }

  void onInit() {
    super.onInit();
    search = TextEditingController();
  }

  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await homePageData.searchData(search!.text);
    statusRequest = hanlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        listdata.clear();
        List responsedata = response['data'];
        listdata.addAll(responsedata.map((e) {
          return ItemsModel.fromJson(e);
        }));
      } else {
        statusRequest = StatusRequest.noData;
      }
    }
    update();
  }
}
