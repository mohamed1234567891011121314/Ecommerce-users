import 'package:ecommerce/controller/cartcontroller.dart';
import 'package:ecommerce/core/constant/approutes.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/functionn/handlingdataview.dart';

import 'package:ecommerce/view/widget/itemsdetails/itemecounterandprice.dart';
import 'package:ecommerce/view/widget/itemsdetails/subitemslist.dart';
import 'package:ecommerce/view/widget/itemsdetails/toppageitemsdetails.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/itemscontroller.dart';
import '../../controller/itemsdetailsconroller.dart';

class ItemsDetails extends StatelessWidget {
  const ItemsDetails({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    Get.put(ItemsDetailsControllerImp());
    Get.put(ItemsControllerImp());
    CartController controller = Get.put(CartController());
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: AppColor.colorOnBooardingscreen_2,
          borderRadius: BorderRadius.circular(15),
        ),
        height: 60,
        child: MaterialButton(
          onPressed: () {
            controller.refreshPage();
            Get.toNamed(AppRoute.cart);
          },
          child: const Text("Go To Cart"),
        ),
      ),
      body: GetBuilder<ItemsDetailsControllerImp>(
          builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(
                  children: [
                    const TopPageItemsDetails(),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Hero(
                            tag: "${controller.itemsModel.itemsId}",
                            child: Text(
                              "${controller.itemsModel.itemsName}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                    color: AppColor.colorThird,
                                  ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ItemsCounterAndPrice(
                              onAdd: () {
                                controller.add();
                              },
                              onRemove: () {
                                controller.remove();
                              },
                              counter: '${controller.countitems}',
                              price:
                                  '${controller.itemsModel.itemsPriceDiscount}\$'),
                          Text(
                              "${controller.itemsModel.itemsDesc}}${controller.itemsModel.itemsDesc}${controller.itemsModel.itemsDesc}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                      color: AppColor.colorOnBooardingscreen_1,
                                      fontSize: 18)),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Color :",
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(
                                    color: AppColor.colorThird, fontSize: 22),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const SubItemsList(),
                        ],
                      ),
                    )
                  ],
                ),
              )),
    );
  }
}
