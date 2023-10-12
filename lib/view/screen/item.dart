import 'package:ecommerce/core/constant/approutes.dart';
import 'package:ecommerce/core/functionn/alertexitapp.dart';
import 'package:ecommerce/core/functionn/handlingdataview.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/view/screen/homepage.dart';
import 'package:ecommerce/view/widget/homepage/customeappbar.dart';

import 'package:ecommerce/view/widget/items/listitemscategories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/favouritecontroller.dart';
import '../../controller/itemscontroller.dart';

import '../widget/items/itemsgetbuilder.dart';

class Items extends StatelessWidget {
  const Items({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    ItemsModel itemsModel;
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    FavouriteController favcontroller = Get.put(FavouriteController());
    return Scaffold(
      body: WillPopScope(
        onWillPop: alertExitApp2,
        child: Container(
          padding: EdgeInsets.all(15),
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
              const ListItemsCategories(),
              GetBuilder<ItemsControllerImp>(
                  init: ItemsControllerImp(),
                  builder: (controller) {
                    return HandlingDataView(
                        statusRequest: controller.statusRequest,
                        widget: !controller.isSearch
                            ? GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: controller.itemslistdata.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: 0.71,
                                        crossAxisCount: 2),
                                itemBuilder: (context, index) {
                                  favcontroller.isFavourite[controller
                                          .itemslistdata[index]['items_id']] =
                                      controller.itemslistdata[index]
                                          ['favourite'];
                                  return ItemsGetBuilder(
                                    itemsModel: ItemsModel.fromJson(
                                        controller.itemslistdata[index]),
                                  );
                                })
                            : ListItemsSearch(
                                listdatamodel: controller.listdata,
                              ));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
