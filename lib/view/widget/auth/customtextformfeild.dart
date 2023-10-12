import 'package:flutter/material.dart';

class CustomTextFormFeild extends StatelessWidget {
  final String hinttext;
  final String labletext;
  final IconData suffixIcon;
  final TextEditingController mycontroller;
  final String? Function(String?) valid;
  final bool isNumber;
  final bool? obscureText;
  final void Function()? onTapicon;
  const CustomTextFormFeild(
      {super.key,
      this.onTapicon,
      this.obscureText = false,
      required this.hinttext,
      required this.labletext,
      required this.suffixIcon,
      required this.mycontroller,
      required this.valid,
      required this.isNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: TextFormField(
        obscureText: obscureText!,
        keyboardType: isNumber
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        validator: valid,
        cursorColor: Colors.white,
        //enabled: false,           هذه القيمة لا تسمح بالكتابه في الحقل
        controller: mycontroller,
        decoration: InputDecoration(
            hintText: hinttext,
            hintStyle: const TextStyle(fontSize: 16),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            floatingLabelStyle: const TextStyle(
                color: Colors.white,
                fontFamily: 'PlayfairDisplay ',
                fontWeight: FontWeight.w700),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  labletext,
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                )),
            suffixIcon: InkWell(
              onTap: onTapicon,
              child: Icon(
                suffixIcon,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(30)),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 3),
              borderRadius: BorderRadius.circular(30),
            )),
      ),
    );
  }
}
