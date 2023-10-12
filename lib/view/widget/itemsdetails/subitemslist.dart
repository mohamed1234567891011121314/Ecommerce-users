import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../controller/itemsdetailsconroller.dart';
import '../../../core/constant/color.dart';

class SubItemsList extends GetView<ItemsDetailsControllerImp> {
  const SubItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsDetailsControllerImp());
    return Row(
      children: [
        ...List.generate(
          controller.subitems.length,
          (index) => Container(
            margin: EdgeInsets.only(right: 10),
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 5),
            height: 60,
            width: 90,
            decoration: BoxDecoration(
              color: controller.subitems[index]['active'] == "1"
                  ? AppColor.colorOnBooardingscreen_1
                  : AppColor.colorOnBooardingscreen_3,
              border: Border.all(color: AppColor.colorOnBooardingscreen_1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              "${controller.subitems[index]['name']}",
              style: TextStyle(
                color: controller.subitems[index]['active'] == "1"
                    ? AppColor.colorOnBooardingscreen_3
                    : AppColor.colorOnBooardingscreen_1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
