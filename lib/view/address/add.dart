import 'package:ecommerce/controller/address/addcontroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/functionn/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    AddressAddControler controllerpage = Get.put(AddressAddControler());
    return Scaffold(
      appBar: AppBar(
        title: Text("address add"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: Container(
        child: GetBuilder<AddressAddControler>(
            builder: (controllerpage) => HandlingDataView(
                  statusRequest: controllerpage.statusRequest,
                  widget: Column(children: [
                    if (controllerpage.kGooglePlex != null)
                      Expanded(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            GoogleMap(
                              mapType: MapType.hybrid,
                              markers: controllerpage.markers.toSet(),
                              onTap: (latLng) {
                                controllerpage.addMarkers(latLng);
                              },
                              initialCameraPosition:
                                  controllerpage.kGooglePlex!,
                              onMapCreated:
                                  (GoogleMapController controllermap) {
                                controllerpage.completercontroller
                                    .complete(controllermap);
                              },
                            ),
                            Positioned(
                                bottom: 10,
                                child: Container(
                                  child: MaterialButton(
                                    minWidth: 200,
                                    onPressed: () {
                                      controllerpage.goToAddAddressPartTwo();
                                    },
                                    child: const Text(
                                      'إكمال',
                                      style: TextStyle(fontSize: 22),
                                    ),
                                    color: AppColor.colorOnBooardingscreen_2,
                                    textColor: Colors.white,
                                  ),
                                ))
                          ],
                        ),
                      ),
                  ]),
                )),
      ),
    );
  }
}
