import 'package:ecommerce/controller/homepagecontroller.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../linkapi.dart';

class ListItemsHome extends GetView<HomePageControllerImp> {
  const ListItemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
          itemCount: controller.items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            return ItemsHome(
                itemsModel: ItemsModel.fromJson(controller.items[i]));
          }),
    );
  }
}

class ItemsHome extends GetView<HomePageControllerImp> {
  final ItemsModel itemsModel;
  const ItemsHome({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItemsDetailss(
            itemsModel, controller.categories, controller.catid = 0);
      },
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Image.network(
              '${AppLink.itemsimage}/${itemsModel.itemsImage}',
              height: 250,
              width: 250,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            height: 200,
            width: 270,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20)),
          ),
          Positioned(
            left: 10,
            child: Text(
              '${itemsModel.itemsName}',
              style: const TextStyle(
                  fontSize: 17, color: AppColor.colorOnBooardingscreen_3),
            ),
          )
        ],
      ),
    );
  }
}
