import 'package:ecommerce/controller/cartcontroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/cart/buttoncart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonNavegtionCart extends StatelessWidget {
  final String price;
  final String totalprice;
  final String discount;
  final String shipping;
  final TextEditingController controllercoupon;
  final void Function()? onApplyCoupon;
  final void Function() gotochekout;
  const CustomButtonNavegtionCart(
      {super.key,
      required this.price,
      required this.totalprice,
      required this.discount,
      required this.controllercoupon,
      required this.onApplyCoupon,
      required this.shipping,
      required this.gotochekout});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GetBuilder<CartController>(
            builder: (controller) => controller.couponname == null
                ? Container(
                    padding: EdgeInsets.only(left: 12),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: TextFormField(
                              controller: controllercoupon,
                              decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  hintText: 'Coupon Code',
                                  border: OutlineInputBorder()),
                            )),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            flex: 1,
                            child: CustomButtonCart(
                                onPressed: onApplyCoupon, textbutton: 'apply')),
                      ],
                    ),
                  )
                : Container(
                    child: Text(
                      "Coupon Code Is: ${controller.couponname}",
                      style: TextStyle(
                          color: AppColor.colorOnBooardingscreen_2,
                          fontSize: 18),
                    ),
                  ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                border: Border.all(
                    color: AppColor.colorOnBooardingscreen_2, width: 1),
                borderRadius: BorderRadius.circular(10)),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      'Price',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(price,
                          style: TextStyle(color: Colors.black, fontSize: 16))),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      'discount',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(discount,
                          style: TextStyle(color: Colors.black, fontSize: 16))),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      'shipping',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(shipping,
                          style: TextStyle(color: Colors.black, fontSize: 16))),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Divider(
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Total Price',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(totalprice,
                          style: TextStyle(color: Colors.black, fontSize: 16))),
                ],
              ),
            ]),
          ),
          CustomButtonCart(onPressed: gotochekout, textbutton: 'Order')
        ],
      ),
    );
  }
}
