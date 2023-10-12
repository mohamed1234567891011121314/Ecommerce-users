import 'package:ecommerce/controller/cartcontroller.dart';
import 'package:ecommerce/core/functionn/handlingdataview.dart';
import 'package:ecommerce/view/widget/cart/custombuttonnavigation.dart';
import 'package:ecommerce/view/widget/cart/customitemscartlist.dart';
import 'package:ecommerce/view/widget/cart/topcardcart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartcontroller = Get.put(CartController());
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'My Cart',
          ),
        ),
        bottomNavigationBar:
            GetBuilder<CartController>(builder: (cartcontroller) {
          return CustomButtonNavegtionCart(
            shipping: '35',
            controllercoupon: cartcontroller.controllercoupon!,
            onApplyCoupon: () {
              cartcontroller.checkCoupon();
            },
            price: '${cartcontroller.totalprice}',
            discount: '${cartcontroller.discountcoupon}%',
            totalprice: '${cartcontroller.gettotalprice()}',
            gotochekout: () {
              cartcontroller.gotochekout();
            },
          );
        }),
        body: GetBuilder<CartController>(
            init: CartController(),
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView(
                    children: [
                      TopCardCart(
                          chooseproduct:
                              'You Have ${controller.totalcountitems} Items In Your List'),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            ...List.generate(
                              cartcontroller.data.length,
                              (index) => CustomItemsCartList(
                                onAdd: () async {
                                  await cartcontroller.addCart(
                                      cartcontroller.data[index].itemsId!);
                                  cartcontroller.refreshPage();
                                },
                                onRemove: () async {
                                  await cartcontroller.deleteCart(
                                      cartcontroller.data[index].itemsId!);
                                  cartcontroller.refreshPage();
                                },
                                nameImage:
                                    cartcontroller.data[index].itemsImage!,
                                priceproduct:
                                    '${cartcontroller.data[index].itemsprice}',
                                nameproduct:
                                    '${cartcontroller.data[index].itemsName}',
                                numproduct:
                                    '${cartcontroller.data[index].countitems}',
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )));
  }
}
