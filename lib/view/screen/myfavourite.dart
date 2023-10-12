import 'package:ecommerce/controller/myfavouriteviewcontroller.dart';
import 'package:ecommerce/core/functionn/alertexitapp.dart';
import 'package:ecommerce/core/functionn/handlingdataview.dart';
import 'package:ecommerce/view/widget/customeappbar.dart';
import 'package:ecommerce/view/widget/myfavourite/customemyfavourite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavourite extends StatelessWidget {
  const MyFavourite({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    Get.put(MyFavouriteViewController());
    return Scaffold(
      body: WillPopScope(
        onWillPop: alertExitApp2,
        child: Container(
          padding: EdgeInsets.all(10),
          child: GetBuilder<MyFavouriteViewController>(
              builder: (controller) => ListView(
                    children: [
                      CustomeAppbar(
                        title: '24'.tr,
                        onPressedSearch: () {},
                        onPressedNotification: () {},
                        onPressedfavourite: () {},
                      ),
                      HandlingDataView(
                          statusRequest: controller.statusRequest,
                          widget: GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.data.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 0.71,
                                      crossAxisCount: 2),
                              itemBuilder: (context, index) {
                                return CustomeFavouriteView(
                                  itemsModel: controller.data[index],
                                );
                              }))
                    ],
                  )),
        ),
      ),
    );
  }
}
