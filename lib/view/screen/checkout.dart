import 'package:ecommerce/controller/checkoutcontroller.dart';
import 'package:ecommerce/core/constant/approutes.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:ecommerce/core/functionn/handlingdataview.dart';
import 'package:ecommerce/view/widget/checkout/cardaddressshipping.dart';
import 'package:ecommerce/view/widget/checkout/carddeliverytype.dart';
import 'package:ecommerce/view/widget/checkout/choosebeyment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutController controller = Get.put(CheckoutController());
    return Scaffold(
        appBar: AppBar(
          title: Text('CheckOut'),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: MaterialButton(
            color: AppColor.colorfour,
            onPressed: () {
              controller.checkout();
            },
            child: const Text(
              'Checkout',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: GetBuilder<CheckoutController>(
          init: CheckoutController(),
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: EdgeInsets.all(20),
              child: ListView(
                children: [
                  const Text(
                    "Choose Payment Method",
                    style: TextStyle(
                      color: AppColor.colorfour,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CardDeliveryType(
                      onTap: () {
                        controller.choosePaymentMethod("0"); //0=>cash
                      },
                      text: "Cash On Delivery",
                      isActive: controller.payment == '0' ? true : false),
                  const SizedBox(
                    height: 10,
                  ),
                  CardDeliveryType(
                      onTap: () {
                        controller.choosePaymentMethod("1"); //1=>card
                      },
                      text: 'Payment Card',
                      isActive: controller.payment == '1' ? true : false),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Choose Delivery Type",
                    style: TextStyle(
                      color: AppColor.colorfour,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      ChooseBeymentType(
                          onTap: () {
                            controller
                                .chooseDeliveryTypeMethod('0'); //0=>delivery
                          },
                          text: 'Delivery',
                          imageName: AppImageAsset.delivery,
                          isActive:
                              controller.deliveryType == '0' ? true : false),
                      const SizedBox(
                        width: 10,
                      ),
                      ChooseBeymentType(
                        onTap: () {
                          controller
                              .chooseDeliveryTypeMethod('1'); //1=DriveThru
                        },
                        text: 'Drive Thru',
                        imageName: AppImageAsset.deriveThru,
                        isActive: controller.deliveryType == '1' ? true : false,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (controller.deliveryType == '0')
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Shipping Address",
                          style: TextStyle(
                            color: AppColor.colorfour,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        if (controller.listAddress.isEmpty)
                          InkWell(
                            onTap: () {
                              Get.toNamed(AppRoute.addressadd);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Center(
                                  child: Text(
                                'Please Add Shipping Address \n Click Here ',
                                style: TextStyle(color: AppColor.colorThird),
                                textAlign: TextAlign.center,
                              )),
                            ),
                          ),
                        const SizedBox(
                          height: 10,
                        ),
                        ...List.generate(
                          controller.listAddress.length,
                          (index) => CardAddressShipping(
                              onTap: () {
                                controller.chooseShippingAddress(
                                    controller.listAddress[index].addressId!);
                              },
                              title:
                                  '${controller.listAddress[index].addressName}',
                              subtite:
                                  '${controller.listAddress[index].addressCity}  ${controller.listAddress[index].addressStreet}',
                              isActive: controller.Addressid ==
                                      controller.listAddress[index].addressId
                                  ? true
                                  : false),
                        )
                      ],
                    )
                ],
              ),
            ),
          ),
        ));
  }
}
