import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/approutes.dart';
import 'package:ecommerce/core/functionn/hanlingdata.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/cartdata.dart';
import 'package:ecommerce/data/model/cartmodel.dart';
import 'package:ecommerce/data/model/couponmodel.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.loading;
  CartData cartData = CartData(Get.find());
  List<CartModel> data = [];
  double totalprice = 0.0;
  int totalcountitems = 0;
  TextEditingController? controllercoupon = TextEditingController();
  CouponModel? couponModel;
  int discountcoupon = 0;
  String? couponname;
  int? couponid;

  @override
  void onInit() {
    controllercoupon = TextEditingController();
    refreshPage();
    super.onInit();
  }

  resetVarcart() {
    totalprice = 0;
    totalcountitems = 0;
    data.clear();
  }

  refreshPage() {
    resetVarcart();
    viewCart();
  }

  gotochekout() {
    if (data.isEmpty) return Get.snackbar('تنبيه', 'السلة فارغة');
    Get.toNamed(AppRoute.checkout, arguments: {
      "couponid": couponid ?? "0",
      "priceorders": totalprice.toString(),
      "descountcoupon": discountcoupon.toString(),
    });
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

  viewCart() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData
        .viewCart(myServices.sharedPreferences.getInt('id').toString());
    statusRequest = hanlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        if (response['datacart']['status'] == 'success') {
          List responsdata = response['datacart']['data'];
          Map responsedatacounterprice = response['countprice'];
          data.addAll(responsdata.map((e) => CartModel.fromJson(e)));
          totalcountitems =
              int.parse(responsedatacounterprice['totalcount'].toString());
          totalprice =
              double.parse(responsedatacounterprice['totalprice'].toString());
        }
      } else {
        statusRequest = StatusRequest.noData;
      }
      update();
    }
  }

  gettotalprice() {
    return (totalprice - totalprice * discountcoupon / 100);
  }

  checkCoupon() async {
    var response = await cartData.checkCoupon(controllercoupon!.text);
    statusRequest = hanlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Map<String, dynamic> datacoupon = response['data'];
        couponModel = CouponModel.fromJson(datacoupon);
        discountcoupon = (couponModel!.couponDiscount!);
        couponname = couponModel!.couponName;
        couponid = couponModel!.couponId;
        update();
        print(response);
      } else {
        discountcoupon = 0;
        couponname = null;
        Get.snackbar('warning', 'coupon Not Valid');
        update();
      }
      update();
    }
    update();
  }
}
