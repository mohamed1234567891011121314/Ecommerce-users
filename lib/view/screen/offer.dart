import 'package:ecommerce/controller/favouritecontroller.dart';

import 'package:ecommerce/controller/offerscontroller.dart';
import 'package:ecommerce/core/constant/approutes.dart';
import 'package:ecommerce/core/functionn/handlingdataview.dart';
import 'package:ecommerce/view/screen/homepage.dart';
import 'package:ecommerce/view/widget/homepage/customeappbar.dart';

import 'package:ecommerce/view/widget/offers/offerslistitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfferView extends StatelessWidget {
  const OfferView({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    OffersController controller = Get.put(OffersController());
    // ignore: unused_local_variable
    FavouriteController controllerfav = Get.put(FavouriteController());
    return GetBuilder<OffersController>(
        init: OffersController(),
        builder: (controller) => Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ListView(
                children: [
                  CustomeAppbarr(
                    mycontroller: controller.search!,
                    onPressedSearch: () {
                      controller.onSearchItems();
                    },
                    onChanged: (val) {
                      controller.chechSearch(val);
                    },
                    title: '24'.tr,
                    onPressedfavourite: () {
                      Get.offAllNamed(AppRoute.myfavourite);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  !controller.isSearch
                      ? HandlingDataView(
                          statusRequest: controller.statusRequest,
                          widget: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.data.length,
                              itemBuilder: (context, index) =>
                                  OffersItemsGetBuilder(
                                      itemsModel: controller.data[index])))
                      : ListItemsSearch(
                          listdatamodel: controller.listdata,
                        )
                ],
              ),
            ));
  }
}
