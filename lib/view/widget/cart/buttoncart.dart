import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtonCart extends StatelessWidget {
  final String textbutton;
  final void Function()? onPressed;

  const CustomButtonCart(
      {super.key, required this.onPressed, required this.textbutton});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: MaterialButton(
        onPressed: onPressed,
        color: AppColor.colorOnBooardingscreen_2,
        textColor: Colors.white,
        child: Text(
          textbutton,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
