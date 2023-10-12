import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class ArchiveOrdersData {
  Crud crud = Crud();
  ArchiveOrdersData(this.crud);

  getData(int userid) async {
    var response =
        await crud.postData(AppLink.ordersarchive, {'id': userid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  getratingData(int orderid, double rating, String noterating) async {
    var response = await crud.postData(AppLink.rating, {
      'id': orderid.toString(),
      'rating': rating.toString(),
      'comment': noterating.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
