import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CardAddressShipping extends StatelessWidget {
  final String title;
  final String subtite;
  final bool isActive;
  final void Function()? onTap;
  const CardAddressShipping(
      {super.key,
      required this.title,
      required this.subtite,
      required this.isActive,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color:
            isActive ? AppColor.colorfour : AppColor.colorOnBooardingscreen_2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(
                color: isActive ? Colors.white : AppColor.colorfour,
                fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            subtite,
            style: TextStyle(
                color: isActive ? Colors.white : AppColor.colorfour,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
