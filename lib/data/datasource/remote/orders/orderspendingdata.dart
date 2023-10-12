import 'package:ecommerce/linkapi.dart';

import '../../../../core/class/crud.dart';

class OrdersPendingData {
  Crud crud = Crud();
  OrdersPendingData(this.crud);

  getData(int usersid) async {
    var response = await crud.postData(AppLink.pendingOrder, {
      "id": usersid.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteData(int ordersid) async {
    var response = await crud.postData(AppLink.ordersdelete, {
      "id": ordersid.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
