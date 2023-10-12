import 'package:ecommerce/controller/settingcontroller.dart';
import 'package:ecommerce/core/constant/approutes.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SettingController controller = Get.put(SettingController());
    return Container(
      child: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                height: Get.width / 3,
                color: AppColor.colorOnBooardingscreen_2,
              ),
              Positioned(
                  top: Get.width / 3.9,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey[100],
                      backgroundImage: const AssetImage(AppImageAsset.person),
                    ),
                  ))
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                ListTile(
                  trailing: Switch(
                    onChanged: (val) {},
                    value: true,
                  ),
                  title: Text('Disable Notification'),
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRoute.orderpending);
                  },
                  trailing: Icon(Icons.baby_changing_station_rounded),
                  title: Text('Orders'),
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRoute.orderarchive);
                  },
                  trailing: Icon(Icons.edit_note_sharp),
                  title: Text('archive'),
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRoute.addressview);
                  },
                  trailing: Icon(Icons.location_on_outlined),
                  title: Text('Address'),
                ),
                ListTile(
                  onTap: () {},
                  trailing: Icon(Icons.help_outline_outlined),
                  title: Text('About Us'),
                ),
                ListTile(
                  onTap: () {
                    launchUrl(Uri.parse("tel:+01016558570"));
                  },
                  trailing: Icon(Icons.phone_callback),
                  title: Text('Contact Us'),
                ),
                ListTile(
                  onTap: () {
                    controller.logout();
                  },
                  trailing: Icon(Icons.logout),
                  title: Text('Logout'),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
