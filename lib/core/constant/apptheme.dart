import 'package:flutter/material.dart';
import 'color.dart';

ThemeData themeEnglish = ThemeData(
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColor.colorOnBooardingscreen_2),
    appBarTheme: AppBarTheme(
      color: AppColor.colorOnBooardingscreen_3,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColor.colorOnBooardingscreen_2),
      elevation: 0,
      titleTextStyle: TextStyle(
        color: AppColor.colorOnBooardingscreen_2,
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
    ),
    textTheme: const TextTheme(
        // ignore: deprecated_member_use
        headline1: TextStyle(
            fontFamily: 'PlayfairDisplay',
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: AppColor.colorOnBooardingscreen_1),
        // ignore: deprecated_member_use
        bodyText1: TextStyle(
            fontFamily: 'PlayfairDisplay',
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: AppColor.colorOnBooardingscreen_2),
        // ignore: deprecated_member_use
        headline2: TextStyle(
            fontFamily: 'PlayfairDisplay',
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: AppColor.colorOnBooardingscreen_3),
        // ignore: deprecated_member_use
        bodyText2: TextStyle(
            fontFamily: 'PlayfairDisplay',
            fontSize: 15,
            fontWeight: FontWeight.w800,
            color: AppColor.colorOnBooardingscreen_4)));

ThemeData themeArabic = ThemeData(
    textTheme: const TextTheme(
        // ignore: deprecated_member_use
        headline1: TextStyle(
            fontFamily: 'PlayfairDisplay', //عند الرغبة في تفير السيم
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: AppColor.colorOnBooardingscreen_1),
        // ignore: deprecated_member_use
        bodyText1: TextStyle(
            fontFamily: 'PlayfairDisplay',
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: AppColor.colorOnBooardingscreen_2),
        // ignore: deprecated_member_use
        headline2: TextStyle(
            fontFamily: 'PlayfairDisplay',
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: AppColor.colorOnBooardingscreen_3),
        // ignore: deprecated_member_use
        bodyText2: TextStyle(
            fontFamily: 'PlayfairDisplay',
            fontSize: 15,
            fontWeight: FontWeight.w800,
            color: AppColor.colorOnBooardingscreen_4)));
