import 'package:ecommerce/controller/orders/pendingordercontroller.dart';
import 'package:ecommerce/core/functionn/handlingdataview.dart';
import 'package:ecommerce/view/widget/order/cardlistorder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersPending extends StatelessWidget {
  const OrdersPending({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersPendingcontroller());
    return Scaffold(
      appBar: AppBar(title: const Text('Orders')),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<OrdersPendingcontroller>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                      itemCount: controller.data.length,
                      itemBuilder: (context, index) {
                        return CardOrders(
                          listdata: controller.data[index],
                        );
                      }),
                )),
      ),
    );
  }
}
