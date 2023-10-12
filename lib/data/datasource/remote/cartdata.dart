import 'package:ecommerce/linkapi.dart';

import '../../../core/class/crud.dart';

class CartData {
  Crud crud = Crud();
  CartData(this.crud);

  addCart(String userid, String itemsid) async {
    var response = await crud.postData(AppLink.addcart, {
      "usersid": userid,
      "itemsid": itemsid,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteCart(String userid, String itemsid) async {
    var response = await crud.postData(AppLink.deletecart, {
      "usersid": userid,
      "itemsid": itemsid,
    });
    return response.fold((l) => l, (r) => r);
  }

  getcountitems(String userid, String itemsid) async {
    var response = await crud.postData(AppLink.getcountitemscart, {
      "usersid": userid,
      "itemsid": itemsid,
    });
    return response.fold((l) => l, (r) => r);
  }

  viewCart(String userid) async {
    var response = await crud.postData(AppLink.viewcart, {
      "usersid": userid,
    });
    return response.fold((l) => l, (r) => r);
  }

  checkCoupon(String couponName) async {
    var response = await crud.postData(AppLink.checkcoupon, {
      "couponname": couponName.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
