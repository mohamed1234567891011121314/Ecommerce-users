import 'package:ecommerce/controller/orders/pendingordercontroller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

requestPermissionNotification() async {
  // ignore: unused_local_variable
  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

fcmConfig() {
  FirebaseMessaging.onMessage.listen((message) {
    print(
        '============================Notification===========================');
    print(message.notification!.title);
    print(message.notification!.body);
    FlutterRingtonePlayer.playNotification();
    Get.snackbar(message.notification!.title!, message.notification!.body!);
    refreshPageNotification(message.data);
  });
}

refreshPageNotification(data) {
  print("=============pageid");
  print(data['pageid']);
  print("=================pagename");
  print(data['pagename']);

  print(Get.currentRoute);
  if (Get.currentRoute == "/orderpending" &&
      data['pagename'] == "refreshorderpending") {
    OrdersPendingcontroller controller = Get.find();
    controller.refreshPage();
  }
}
