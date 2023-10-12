import 'package:ecommerce/controller/favouritecontroller.dart';
import 'package:ecommerce/controller/offerscontroller.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';
import '../../../core/functionn/translatgetdatabase.dart';
import '../../../linkapi.dart';

class OffersItemsGetBuilder extends GetView<OffersController> {
  final ItemsModel itemsModel;
  const OffersItemsGetBuilder({
    super.key,
    required this.itemsModel,
  });
  @override
  Widget build(BuildContext context) {
    Get.put(OffersController());
    return InkWell(
      onTap: () {},
      child: Card(
        elevation: 20,
        child: Stack(
          children: [
            Padding(
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
                  // Container(
                  //   padding: const EdgeInsets.only(top: 8),
                  //   alignment: Alignment.bottomCenter,
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       const Text(
                  //         "Rating : ",
                  //         style: TextStyle(
                  //             fontSize: 14,
                  //             color: AppColor.colorOnBooardingscreen_2),
                  //       ),
                  //       ...List.generate(
                  //           5,
                  //           (index) => const Icon(
                  //                 Icons.star,
                  //                 size: 15,
                  //               ))
                  //     ],
                  //   ),
                  // ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      children: [
                        Text(
                          '${itemsModel.itemsPriceDiscount} \$',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 15,
                              color: AppColor.colorOnBooardingscreen_2),
                        ),
                        const Spacer(),
                        GetBuilder<FavouriteController>(
                            builder: (favController) => IconButton(
                                onPressed: () {
                                  if (favController
                                          .isFavourite[itemsModel.itemsId] ==
                                      1) {
                                    favController.setFavourite(
                                        itemsModel.itemsId, 0);
                                    favController.removeFavData(
                                        itemsModel.itemsId!.toString());
                                  } else {
                                    favController.setFavourite(
                                        itemsModel.itemsId, 1);
                                    favController.addFavData(
                                        itemsModel.itemsId!.toString());
                                  }
                                },
                                icon: favController
                                            .isFavourite[itemsModel.itemsId] ==
                                        1
                                    ? const Icon(
                                        Icons.favorite,
                                        size: 25,
                                        color: AppColor.colorThird,
                                      )
                                    : const Icon(
                                        Icons.favorite_border_outlined,
                                        size: 25,
                                        color: AppColor.colorThird,
                                      ))),
                      ],
                    ),
                  )
                ],
              ),
            ),
            if (itemsModel.itemsDiscount != 0)
              Image.asset(
                AppImageAsset.discount,
                width: 65,
              )
          ],
        ),
      ),
    );
  }
}
