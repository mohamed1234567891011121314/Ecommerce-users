import 'package:ecommerce/controller/myfavouriteviewcontroller.dart';
import 'package:ecommerce/core/constant/approutes.dart';
import 'package:ecommerce/data/model/modelfavouriteview.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';
import '../../../core/functionn/translatgetdatabase.dart';
import '../../../linkapi.dart';

class CustomeFavouriteView extends GetView<MyFavouriteViewController> {
  final ModelFavouiteView itemsModel;
  const CustomeFavouriteView({
    super.key,
    required this.itemsModel,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //controller.goToItemsDetails(itemsModel);
      },
      child: Card(
        elevation: 20,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: itemsModel.itemsId!,
                child: FastCachedImage(
                    url: '${AppLink.itemsimage}/${itemsModel.itemsImage}',
                    height: 130,
                    width: 150,
                    fit: BoxFit.cover),
              ),
              Hero(
                tag: "${itemsModel.itemsId}",
                child: Text(
                    '${tanslateGetdataBase(itemsModel.itemsNameAr, itemsModel.itemsName)}', //'${itemsModel.itemsName}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 13,
                        color: AppColor.colorOnBooardingscreen_1)),
              ),
              Container(
                padding: const EdgeInsets.only(top: 8),
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Rating : ",
                      style: TextStyle(
                          fontSize: 14,
                          color: AppColor.colorOnBooardingscreen_2),
                    ),
                    ...List.generate(
                        5,
                        (index) => const Icon(
                              Icons.star,
                              size: 15,
                            ))
                  ],
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Text(
                      '${itemsModel.itemsPrice} \$',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 15,
                          color: AppColor.colorOnBooardingscreen_2),
                    ),
                    const Spacer(),
                    GetBuilder<MyFavouriteViewController>(
                        builder: (ccontroller) => IconButton(
                            onPressed: () {
                              ccontroller.deleteFavourite(
                                  itemsModel.favouriteId.toString());
                              Get.offAllNamed(AppRoute.myfavourite);
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: AppColor.colorThird,
                            )))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
