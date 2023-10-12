import 'package:ecommerce/controller/orders/ordersarchivecontroller.dart';
import 'package:ecommerce/core/functionn/handlingdataview.dart';
import 'package:ecommerce/view/widget/order/cardordersarchive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersArchive extends StatelessWidget {
  const OrdersArchive({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    OrdersArchiveController conroller = Get.put(OrdersArchiveController());
    return Scaffold(
      appBar: AppBar(title: const Text('Orders Archive')),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<OrdersArchiveController>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                      itemCount: controller.data.length,
                      itemBuilder: (context, index) {
                        return CardOrdersArchive(
                          listdata: controller.data[index],
                        );
                      }),
                )),
      ),
    );
  }
}
