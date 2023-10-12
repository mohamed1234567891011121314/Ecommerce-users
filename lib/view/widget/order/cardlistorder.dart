import 'package:ecommerce/controller/orders/pendingordercontroller.dart';
import 'package:ecommerce/core/constant/approutes.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/data/model/ordersmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CardOrders extends GetView<OrdersPendingcontroller> {
  final OrdersModel listdata;
  const CardOrders({super.key, required this.listdata});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Order Number : #${listdata.ordersId}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColor.colorOnBooardingscreen_1,
                  ),
                ),
                const Spacer(),
                Text(
                  Jiffy.parse(listdata.ordersDatetime!).fromNow(),
                  style: TextStyle(color: AppColor.colorfour),
                ),
              ],
            ),
            const Divider(),
            Text(
              "Order Type : ${controller.printOrderType(listdata.ordersType!)}",
              style: const TextStyle(
                color: AppColor.colorOnBooardingscreen_1,
              ),
            ),
            Text(
              "Order Price : ${listdata.ordersPrice}\$",
              style: const TextStyle(
                color: AppColor.colorOnBooardingscreen_1,
              ),
            ),
            Text(
              'Delivery Price : ${listdata.ordersPricedelivery} \$',
              style: const TextStyle(
                color: AppColor.colorOnBooardingscreen_1,
              ),
            ),
            Text(
              'Payment Method : ${controller.printPaymentMethod(listdata.ordersPaymentmethod!)}',
              style: const TextStyle(
                color: AppColor.colorOnBooardingscreen_1,
              ),
            ),
            Text(
              'Orders Status : ${controller.printOrderState(listdata.ordersStatus!)}',
              style: const TextStyle(
                color: AppColor.colorOnBooardingscreen_1,
              ),
            ),
            const Divider(),
            Row(
              children: [
                const Text(
                  'Total Price : 820 \$',
                  style: TextStyle(
                      color: AppColor.colorOnBooardingscreen_2,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                MaterialButton(
                  onPressed: () {
                    Get.toNamed(AppRoute.orderdetails,
                        arguments: {"ordersmodel": listdata});
                  },
                  color: AppColor.colorfour,
                  child: const Text(
                    "Details",
                    style: TextStyle(
                        color: AppColor.colorOnBooardingscreen_3,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                if (listdata.ordersStatus == 0)
                  MaterialButton(
                    onPressed: () {
                      controller.deletedata(listdata.ordersId!);
                    },
                    color: AppColor.colorfour,
                    child: const Text(
                      "Delete",
                      style: TextStyle(
                          color: AppColor.colorOnBooardingscreen_3,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
