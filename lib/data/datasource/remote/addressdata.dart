import 'package:ecommerce/linkapi.dart';

import '../../../core/class/crud.dart';

class AddressData {
  Crud crud = Crud();
  AddressData(this.crud);

  viewData(int userid) async {
    var response = await crud.postData(AppLink.viewaddress, {
      "usersid": userid.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  addData(int userid, String name, String city, String street, String lat,
      String long) async {
    var response = await crud.postData(AppLink.addaddress, {
      "usersid": userid.toString(),
      "name": name,
      "city": city,
      "street": street,
      "lat": lat,
      "long": long,
    });
    return response.fold((l) => l, (r) => r);
  }

  editData(int addressid, String name, String city, String street, String lat,
      String long) async {
    var response = await crud.postData(AppLink.editaddress, {
      "addressid": addressid,
      "name": name,
      "city": city,
      "street": street,
      "lat": lat,
      "long": long,
    });
    return response.fold((l) => l, (r) => r);
  }

  deletData(int addressid) async {
    var response = await crud.postData(AppLink.deleteaddress, {
      "addressid": addressid.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
