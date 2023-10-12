import 'package:flutter/material.dart';

class CustomButtonAuth extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  const CustomButtonAuth(
      {super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        padding: const EdgeInsets.symmetric(vertical: 13),
        color: const Color(0xffC49F79),
        textColor: Colors.white,
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
              fontFamily: 'PlayfairDisplay',
              fontSize: 17,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
