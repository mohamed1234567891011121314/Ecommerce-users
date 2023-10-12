import 'package:ecommerce/controller/orders/ordersarchivecontroller.dart';
import 'package:ecommerce/core/constant/approutes.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/data/model/ordersmodel.dart';
import 'package:ecommerce/view/widget/order/rating.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CardOrdersArchive extends GetView<OrdersArchiveController> {
  final OrdersModel listdata;
  const CardOrdersArchive({super.key, required this.listdata});

  @override
  Widget build(BuildContext context) {
    //OrdersArchiveController controller = Get.put(OrdersArchiveController());
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
                  width: 7,
                ),
                if (listdata.ordersRating == 0)
                  MaterialButton(
                    onPressed: () {
                      showRating(context, listdata.ordersId!);
                    },
                    color: AppColor.colorfour,
                    child: const Text(
                      "Rating",
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
