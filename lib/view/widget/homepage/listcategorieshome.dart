import 'package:ecommerce/controller/homepagecontroller.dart';

import 'package:ecommerce/data/model/categorisemodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';
import '../../../core/functionn/translatgetdatabase.dart';
import '../../../linkapi.dart';

class ListCategoriesHome extends GetView<HomePageControllerImp> {
  const ListCategoriesHome({super.key});

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

class Categories extends GetView<HomePageControllerImp> {
  final CategoryModel categoryModel;
  final int i;
  const Categories({super.key, required this.categoryModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(
            controller.categories, i, categoryModel.categoriesId!);
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColor.colorOnBooardingscreen_2,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 70,
            width: 85,
            child: SvgPicture.network(
              "${AppLink.categoriesimage}/${categoryModel.categoriesImage}",
              // ignore: deprecated_member_use
              color: AppColor.colorfour,
            ),
          ),
          Text(
            //"${categoryModel.categoriesName}",
            '${tanslateGetdataBase(
              categoryModel.categoriesNameAr,
              categoryModel.categoriesName,
            )}',
            style: const TextStyle(
              fontSize: 18,
              color: AppColor.colorfour,
            ),
          )
        ],
      ),
    );
  }
}
