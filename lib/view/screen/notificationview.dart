import 'package:ecommerce/controller/orders/notificationcontroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/functionn/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    NotificatonController controller = Get.put(NotificatonController());
    return Container(
      padding: const EdgeInsets.all(10),
      child: GetBuilder<NotificatonController>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView(children: [
                const Center(
                  child: Text(
                    'Notification',
                    style: TextStyle(
                      color: AppColor.colorfour,
                      fontSize: 22,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ...List.generate(
                    controller.data.length,
                    (index) => Stack(
                          children: [
                            ListTile(
                              title: Text(
                                "${controller.data[index]['notification_title']}",
                                style: const TextStyle(
                                  color: AppColor.colorfour,
                                  fontSize: 22,
                                ),
                              ),
                              subtitle: Text(
                                "${controller.data[index]['notification_body']}",
                                style: const TextStyle(
                                  color: AppColor.colorfour,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 10,
                              right: 5,
                              child: Text(
                                  Jiffy.parse(controller.data[index]
                                          ['notification_datetime'])
                                      .fromNow(),
                                  style: const TextStyle(
                                    color: AppColor.colorThird,
                                    fontSize: 15,
                                  )),
                            )
                          ],
                        )),
              ]))),
    );
  }
}
