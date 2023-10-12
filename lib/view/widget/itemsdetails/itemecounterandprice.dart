import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class ItemsCounterAndPrice extends StatelessWidget {
  final void Function()? onAdd;
  final void Function()? onRemove;
  final String counter;
  final String price;
  const ItemsCounterAndPrice(
      {super.key,
      required this.onAdd,
      required this.onRemove,
      required this.counter,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            IconButton(onPressed: onAdd, icon: const Icon(Icons.add)),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(bottom: 2),
              width: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColor.colorOnBooardingscreen_1)),
              child: Text(
                counter,
                style: const TextStyle(
                    fontSize: 20,
                    color: AppColor.colorOnBooardingscreen_1,
                    height: 1.1),
              ),
            ),
            IconButton(onPressed: onRemove, icon: const Icon(Icons.remove)),
          ],
        ),
        const Spacer(),
        Text(
          price,
          style: const TextStyle(
              color: AppColor.colorOnBooardingscreen_2,
              fontSize: 30,
              height: 1.1),
        )
      ],
    );
  }
}
