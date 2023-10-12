import 'package:ecommerce/controller/itemscontroller.dart';
import 'package:ecommerce/data/model/categorisemodel.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../core/functionn/translatgetdatabase.dart';

class ListItemsCategories extends GetView<ItemsControllerImp> {
  const ListItemsCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      height: 120,
      child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
          itemCount: controller.categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Categories(
                i: index,
                categoryModel:
                    CategoryModel.fromJson(controller.categories[index]));
          }),
    );
  }
}

class Categories extends GetView<ItemsControllerImp> {
  final CategoryModel categoryModel;
  final int i;
  const Categories({super.key, required this.categoryModel, required this.i});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    return InkWell(
      onTap: () {
        controller.changeSelected(i, categoryModel.categoriesId!);
      },
      child: Column(
        children: [
          GetBuilder<ItemsControllerImp>(
            builder: (controller) => Container(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 8),
              decoration: controller.selected == i
                  ? const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 4,
                              color: AppColor.colorOnBooardingscreen_2)))
                  : null,
              child: Text(
                "${tanslateGetdataBase(
                  categoryModel.categoriesNameAr,
                  categoryModel.categoriesName,
                )}",
                style: const TextStyle(
                  fontSize: 20,
                  color: AppColor.colorfour,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
