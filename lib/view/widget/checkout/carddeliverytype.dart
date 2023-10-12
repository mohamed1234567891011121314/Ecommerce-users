import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CardDeliveryType extends StatelessWidget {
  final String? text;
  final bool isActive;
  final void Function() onTap;
  const CardDeliveryType(
      {super.key,
      required this.text,
      required this.isActive,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            color: isActive
                ? AppColor.colorfour
                : AppColor.colorOnBooardingscreen_2,
            borderRadius: BorderRadius.circular(20)),
        child: Text(
          text!,
          style: TextStyle(
              color: isActive
                  ? AppColor.colorOnBooardingscreen_3
                  : AppColor.colorfour,
              height: 1,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
