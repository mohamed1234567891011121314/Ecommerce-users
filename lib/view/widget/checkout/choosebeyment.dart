import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class ChooseBeymentType extends StatelessWidget {
  final String text;
  final String imageName;
  final bool isActive;
  final void Function()? onTap;
  const ChooseBeymentType(
      {super.key,
      required this.text,
      required this.imageName,
      required this.isActive,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 120,
        width: 120,
        decoration: BoxDecoration(
          color:
              isActive ? AppColor.colorfour : AppColor.colorOnBooardingscreen_3,
          border: Border.all(
              color: isActive
                  ? AppColor.colorfour
                  : AppColor.colorOnBooardingscreen_2),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            imageName,
            width: 70,
          ),
          Text(
            text,
            style: TextStyle(
                color: isActive
                    ? AppColor.colorOnBooardingscreen_3
                    : AppColor.colorfour),
          )
        ]),
      ),
    );
  }
}
