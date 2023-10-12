import 'dart:async';

import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/functionn/hanlingdata.dart';
import 'package:ecommerce/data/datasource/remote/orders/detailsorderdata.dart';
import 'package:ecommerce/data/model/cartmodel.dart';
import 'package:ecommerce/data/model/ordersmodel.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrdersDetailsController extends GetxController {
  Completer<GoogleMapController> completercontroller =
      Completer<GoogleMapController>();
  late OrdersModel ordersModel;
  CameraPosition? cameraPosition;
  Position? position;
  List<Marker> markers = [];
  StatusRequest statusRequest = StatusRequest.none;
  double? lat;
  double? long;
  DetailsOrderData detailsOrderData = DetailsOrderData(Get.find());
  List<CartModel> data = [];
  @override
  void onInit() {
    ordersModel = Get.arguments['ordersmodel'];
    inialData();
    getdaTa();
    super.onInit();
  }

  inialData() async {
    if (ordersModel.ordersType == 0) {
      cameraPosition = CameraPosition(
        target: LatLng(ordersModel.addressLat!, ordersModel.addressLong!),
        zoom: 12.4746,
      );
      markers.add(Marker(
          markerId: MarkerId('1'),
          position: LatLng(ordersModel.addressLat!, ordersModel.addressLong!)));
      statusRequest = StatusRequest.none;
      update();
    }
  }

  getdaTa() async {
    statusRequest = StatusRequest.loading;
    var response = await detailsOrderData.getData(ordersModel.ordersId!);
    statusRequest = hanlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => CartModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.noData;
      }
    }
    update();
  }
}
