import 'package:ecommerce/binding.dart';
import 'package:ecommerce/core/localization/changeloacal.dart';
import 'package:ecommerce/core/localization/translation.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      locale: controller.language,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      translations: MyTranslation(),
      theme: controller.appTheme,
      getPages: routs,
      initialBinding: MyBinding(),
    );
  }
}
