import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/functionn/hanlingdata.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/addressdata.dart';
import 'package:ecommerce/data/model/addressmodel.dart';
import 'package:get/get.dart';

class AddressViewController extends GetxController {
  AddressData addressData = AddressData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  List<AddressModel> dataAddress = [];

  viewData() async {
    statusRequest = StatusRequest.loading;
    var response =
        await addressData.viewData(myServices.sharedPreferences.getInt('id')!);
    statusRequest = hanlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List listdata = response['data'];
        dataAddress.addAll(listdata.map((e) => AddressModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.noData;
      }
    }
    update();
  }

  deleteAddress(int addressid) {
    if (dataAddress.isNotEmpty) {
      addressData.deletData(addressid);
      dataAddress.removeWhere((element) => element.addressId == addressid);
      viewData();
      update();
    }
  }

  @override
  void onInit() {
    viewData();
    super.onInit();
  }
}
