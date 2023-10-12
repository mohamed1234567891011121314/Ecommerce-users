import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class DetailsOrderData {
  Crud crud = Crud();
  DetailsOrderData(this.crud);

  getData(int id) async {
    var response =
        await crud.postData(AppLink.ordersdetails, {'id': id.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
