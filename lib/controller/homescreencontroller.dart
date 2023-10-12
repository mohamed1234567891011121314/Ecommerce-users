import 'package:ecommerce/view/screen/homepage.dart';
import 'package:ecommerce/view/screen/notificationview.dart';
import 'package:ecommerce/view/screen/offer.dart';
import 'package:ecommerce/view/screen/settingscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  channagePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;
  List<Widget> lestpage = [
    const HomePage(),
    const SettingScreen(),
    const OfferView(),
    const NotificationView(),
  ];
  List listnameicone = [
    {
      'title': 'Home',
      'icon': Icons.home,
    },
    {
      'title': 'Setting',
      'icon': Icons.settings,
    },
    {
      'title': 'Offer',
      'icon': Icons.local_offer_outlined,
    },
    {'title': 'Notific', 'icon': Icons.notifications_active_outlined},
  ];

  @override
  channagePage(int i) {
    currentpage = i;
    update();
  }
}
