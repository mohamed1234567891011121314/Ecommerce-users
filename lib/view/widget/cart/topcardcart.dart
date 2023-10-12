import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class TopCardCart extends StatelessWidget {
  final String chooseproduct;
  const TopCardCart({super.key, required this.chooseproduct});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      alignment: Alignment.center,
      padding: const EdgeInsets.only(bottom: 5),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColor.colorOnBooardingscreen_2,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        chooseproduct, //'You Have 2 Items In Your List'
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
