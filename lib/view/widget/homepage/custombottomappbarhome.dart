import 'package:ecommerce/controller/homescreencontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custombuttonappbar.dart';

class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          child: Row(
            children: [
              ...List.generate(controller.lestpage.length + 1, (index) {
                int i = index > 2 ? index - 1 : index;
                return index == 2
                    ? const Spacer()
                    : CustomButtonAppBar(
                        onPressed: () {
                          controller.channagePage(i);
                        },
                        text: controller.listnameicone[i]['title'].toString(),
                        icondata: controller.listnameicone[i]['icon'],
                        active: controller.currentpage == i ? true : false,
                      );
              }),
            ],
          )),
    );
  }
}
