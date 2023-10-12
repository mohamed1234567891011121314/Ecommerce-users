import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtonAppBar extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final IconData? icondata;
  final bool active;
  const CustomButtonAppBar(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.icondata,
      required this.active});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Icon(
          icondata,
          color: active == true
              ? AppColor.colorOnBooardingscreen_2
              : AppColor.colorOnBooardingscreen_1,
        ),
        Text(
          text,
          style: TextStyle(
            color: active == true
                ? AppColor.colorOnBooardingscreen_2
                : AppColor.colorOnBooardingscreen_1,
          ),
        )
      ]),
    );
  }
}
