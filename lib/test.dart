import 'package:ecommerce/controller/testdatacontroller.dart';
import 'package:ecommerce/core/functionn/handlingdataview.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class Testing extends StatefulWidget {
  const Testing({super.key});

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  @override
  Widget build(BuildContext context) {
    Get.put(TestDataController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Testing'),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: OTPTextField(
              length: 5,
              width: MediaQuery.of(context).size.width,
              fieldWidth: 20,
              style: const TextStyle(fontSize: 17),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.underline,
              onCompleted: (pin) {
                // ignore: prefer_interpolation_to_compose_strings, avoid_print
                print("Completed: " + pin);
              },
              onChanged: (c) {
                // ignore: prefer_interpolation_to_compose_strings, avoid_print
                print('ppppppppppppppppppp' + c);
              },
            ),
          ),
          const SizedBox(
            height: 150,
          ),
          Container(
            color: Colors.black,
            height: 400,
            width: 300,
            child: GetBuilder<TestDataController>(
                init: TestDataController(),
                builder: (controller) {
                  return HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: ListView.builder(
                        itemCount: controller.data.length,
                        itemBuilder: (context, index) {
                          return Text(
                            '${controller.data}',
                            style: const TextStyle(color: Colors.amber),
                          );
                        }),
                  );
                }),
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
