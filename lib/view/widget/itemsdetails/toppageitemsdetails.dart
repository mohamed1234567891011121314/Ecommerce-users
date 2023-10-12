import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../controller/itemsdetailsconroller.dart';
import '../../../core/constant/color.dart';
import '../../../linkapi.dart';

class TopPageItemsDetails extends GetView<ItemsDetailsControllerImp> {
  const TopPageItemsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsDetailsControllerImp());
    return Stack(
      clipBehavior: Clip.none, // ظهورة بما يكفى مايحتويه
      children: [
        Container(
          height: 250,
          width: double.infinity,
          decoration: const BoxDecoration(
              color: AppColor.colorOnBooardingscreen_2,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25))),
        ),
        Positioned(
          top: 50,
          left: Get.width / 50,
          right: Get.width / 3,
          child: Hero(
            tag: controller.itemsModel.itemsId!,
            child: FastCachedImage(
              url: "${AppLink.itemsimage}/${controller.itemsModel.itemsImage}",
              height: 250,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}
