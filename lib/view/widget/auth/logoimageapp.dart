import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:flutter/material.dart';

class LogoImageApp extends StatelessWidget {
  const LogoImageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImageAsset.logoApp,
      height: 250,
    );
  }
}
