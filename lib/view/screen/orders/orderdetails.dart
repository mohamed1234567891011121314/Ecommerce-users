import 'package:ecommerce/controller/orders/ordersdetailscontroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/functionn/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    OrdersDetailsController controller = Get.put(OrdersDetailsController());
    return Scaffold(
      appBar: AppBar(title: Text("OrdersDetails")),
      body: Container(
        padding: EdgeInsets.all(10),
        child: GetBuilder<OrdersDetailsController>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView(children: [
                    Card(
                      margin: EdgeInsets.all(20),
                      child: Table(
                        border: TableBorder.all(
                            color: AppColor.colorfour,
                            borderRadius: BorderRadius.circular(10)),
                        children: [
                          const TableRow(children: [
                            Text(
                              'Items',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: AppColor.colorOnBooardingscreen_2,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'QUT',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: AppColor.colorOnBooardingscreen_2,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Price',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: AppColor.colorOnBooardingscreen_2,
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                          ...List.generate(
                              controller.data.length,
                              (index) => TableRow(children: [
                                    Text(
                                      '${controller.data[index].itemsName}',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color:
                                              AppColor.colorOnBooardingscreen_1,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '${controller.data[index].countitems}',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color:
                                              AppColor.colorOnBooardingscreen_1,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '${controller.data[index].itemsPrice}',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color:
                                              AppColor.colorOnBooardingscreen_1,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ])),
                          TableRow(children: [
                            const Text(
                              'Total',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: AppColor.colorThird,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              "5",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: AppColor.colorThird,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${controller.ordersModel.ordersTotalprice} \$',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: AppColor.colorThird,
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    if (controller.ordersModel.ordersType == 0)
                      Card(
                        child: Container(
                          child: ListTile(
                            title: const Text(
                              'Shipping Addres :',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: AppColor.colorOnBooardingscreen_2,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              '${controller.ordersModel.addressCity} ${controller.ordersModel.addressStreet}',
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: AppColor.colorOnBooardingscreen_1,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    if (controller.ordersModel.ordersType == 0)
                      Card(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          height: 450,
                          width: double.infinity,
                          child: GoogleMap(
                            mapType: MapType.hybrid,
                            initialCameraPosition: controller.cameraPosition!,
                            onMapCreated: (GoogleMapController controllermap) {
                              controller.completercontroller
                                  .complete(controllermap);
                            },
                          ),
                        ),
                      )
                  ]),
                )),
      ),
    );
  }
}
