import 'dart:async';

import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/approutes.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressAddControler extends GetxController {
  Completer<GoogleMapController> completercontroller =
      Completer<GoogleMapController>();
  StatusRequest statusRequest = StatusRequest.loading;
  Position? position;
  CameraPosition? kGooglePlex;
  List<Marker> markers = [];
  double? lat;
  double? long;

  addMarkers(LatLng latLng) {
    markers.clear();
    markers.add(Marker(markerId: MarkerId('1'), position: latLng));
    lat = latLng.latitude;
    long = latLng.longitude;
    update();
  }

  goToAddAddressPartTwo() {
    Get.toNamed(AppRoute.addressaddtwo,
        arguments: {'lat': lat.toString(), 'long': long.toString()});
  }

  getCurrentLocation() async {
    position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 14.4746,
    );
    addMarkers(
      LatLng(position!.latitude, position!.longitude),
    );
    statusRequest = StatusRequest.none;
    update();
  }

  @override
  void onInit() {
    getCurrentLocation();
    completercontroller = Completer<GoogleMapController>();
    super.onInit();
  }
}
