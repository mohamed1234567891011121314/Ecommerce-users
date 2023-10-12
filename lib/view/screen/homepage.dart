import 'package:ecommerce/core/constant/approutes.dart';
import 'package:ecommerce/core/functionn/handlingdataview.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:ecommerce/view/widget/homepage/ListItemsHome.dart';
import 'package:ecommerce/view/widget/homepage/listcategorieshome.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/homepagecontroller.dart';
import '../widget/homepage/customcardehome.dart';
import '../widget/homepage/customeappbar.dart';
import '../widget/homepage/customtexthome.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(HomePageControllerImp());
    return GetBuilder<HomePageControllerImp>(
      init: HomePageControllerImp(),
      builder: (controller) => Container(
        padding: const EdgeInsets.all(15),
        child: ListView(children: [
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
          HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: !controller.isSearch
                  ? Column(
                      children: [
                        // if (controller.settingText.isNotEmpty)
                        CustomCardHome(
                          title: "${controller.titleText}",
                          subtitle: "${controller.bodyText}",
                        ),
                        CustmeTextHome(title: '27'.tr),
                        const ListCategoriesHome(),
                        CustmeTextHome(
                          title: '28'.tr,
                        ),
                        const ListItemsHome(),
                        CustmeTextHome(
                          title: '29'.tr,
                        ),
                        const ListItemsHome(),
                      ],
                    )
                  : ListItemsSearch(
                      listdatamodel: controller.listdata,
                    ))
        ]),
      ),
    );
  }
}

class ListItemsSearch extends GetView<HomePageControllerImp> {
  final List<ItemsModel> listdatamodel;
  const ListItemsSearch({super.key, required this.listdatamodel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listdatamodel.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.goToItemsDetailss(
                  listdatamodel[index], controller.categories[index], index);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                          child: FastCachedImage(
                              url:
                                  '${AppLink.itemsimage}/${listdatamodel[index].itemsImage}')),
                      Expanded(
                          child: ListTile(
                        title: Text(listdatamodel[index].itemsName!),
                        subtitle: Text(listdatamodel[index].categoriesName!),
                      ))
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
