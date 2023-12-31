import 'package:ecommerce/controller/orders/ordersarchivecontroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';

void showRating(BuildContext context, int orderid) {
  showDialog(
      context: context,
      barrierDismissible: true, // set to false if you want to force a rating
      builder: (context) => RatingDialog(
            initialRating: 1.0,
            // your app's name?
            title: const Text(
              'Rating Dialog',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            // encourage your user to leave a high rating?
            message: const Text(
              'Tap a star to set your rating. Add more description here if you want.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
            // your app's logo?
            image: Image.asset(
              AppImageAsset.onBoardingImage_one,
              height: 250,
              width: 250,
            ),
            submitButtonText: 'Submit',
            submitButtonTextStyle: const TextStyle(
                color: AppColor.colorOnBooardingscreen_2, fontSize: 18),

            commentHint: 'Set your custom comment hint',
            onCancelled: () => print('cancelled'),
            onSubmitted: (response) {
              OrdersArchiveController controller = Get.find();
              // print('rating: ${response.rating}, comment: ${response.comment}');
              controller.submitRating(
                  orderid, response.rating, response.comment);
            },
          ));
}
