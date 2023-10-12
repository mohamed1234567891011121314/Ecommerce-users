import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/approutes.dart';
import 'package:ecommerce/core/functionn/hanlingdata.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/addressdata.dart';
import 'package:ecommerce/data/datasource/remote/checkoutdata.dart';
import 'package:ecommerce/data/model/addressmodel.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  AddressData addressData = Get.put(AddressData(Get.find()));
  ChechoutData chechoutData = Get.put(ChechoutData(Get.find()));
  MyServices myServices = Get.find();
  String? payment;
  String? deliveryType;
  int Addressid = 0;
  late String couponid;
  late String priceorders;
  late String descountcoupon;
  List<AddressModel> listAddress = [];

  choosePaymentMethod(val) {
    payment = val;
    update();
  }

  chooseDeliveryTypeMethod(val) {
    deliveryType = val;
    update();
  }

  chooseShippingAddress(int val) {
    Addressid = val;
    update();
  }

  void onInit() {
    couponid = Get.arguments['couponid'].toString();
    priceorders = Get.arguments['priceorders'];
    descountcoupon = Get.arguments['descountcoupon'].toString();
    getShippingAddress();
    super.onInit();
  }

  getShippingAddress() async {
    statusRequest = StatusRequest.loading;
    var response =
        await addressData.viewData(myServices.sharedPreferences.getInt("id")!);
    statusRequest = hanlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List listdata = response['data'];
        listAddress.addAll(listdata.map((e) => AddressModel.fromJson(e)));
        Addressid = listAddress[0].addressId!;
      } else {
        statusRequest = StatusRequest.noData;
      }
    }
    update();
  }

  checkout() async {
    if (payment == null)
      return Get.snackbar('Error', 'Please selected Payment Method');
    if (deliveryType == null)
      return Get.snackbar('Error', 'Please selected delivery Type Method');
    if (listAddress.isEmpty) {
      return Get.snackbar('Error', 'Please Choose Your Address');
    }
    statusRequest = StatusRequest.loading;
    update();
    Map data = {
      "usersid": myServices.sharedPreferences.getInt("id")!.toString(),
      "addressid": Addressid.toString(),
      "orderstype": deliveryType.toString(),
      "pricedelivery": 10.toString(),
      "ordersprice": priceorders.toString(),
      "couponid": couponid.toString(),
      "paymentmethod": payment.toString(),
      "descountcoupon": descountcoupon.toString(),
    };
    var response = await chechoutData.getData(data);
    statusRequest = hanlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.offAllNamed(AppRoute.homePage);
        Get.snackbar('Success', 'Orders Was Successfully');
      } else {
        statusRequest = StatusRequest.noData;
        Get.snackbar('Error', 'Please Try Again');
      }
    }
    update();
  }
}
