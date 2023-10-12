import 'package:ecommerce/controller/address/viewcontroller.dart';
import 'package:ecommerce/core/constant/approutes.dart';
import 'package:ecommerce/core/functionn/handlingdataview.dart';
import 'package:ecommerce/data/model/addressmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("address"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoute.addressadd);
        },
        child: Icon(Icons.add),
      ),
      body: GetBuilder<AddressViewController>(
          init: AddressViewController(),
          builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Container(
                  child: ListView.builder(
                      itemCount: controller.dataAddress.length,
                      itemBuilder: (context, i) {
                        return AddressCard(
                          addressModel: controller.dataAddress[i],
                          onDelete: () {
                            controller.deleteAddress(
                                controller.dataAddress[i].addressId!);
                          },
                        );
                      }),
                ),
              )),
    );
  }
}

class AddressCard extends StatelessWidget {
  final AddressModel addressModel;
  final void Function()? onDelete;
  const AddressCard(
      {Key? key, required this.addressModel, required this.onDelete})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          padding: const EdgeInsets.all(10),
          child: ListTile(
            title: Text(addressModel.addressName!),
            subtitle: Text(
                "${addressModel.addressCity} ${addressModel.addressStreet}"),
            trailing: IconButton(
                onPressed: onDelete, icon: const Icon(Icons.delete_forever)),
          )),
    );
  }
}
