import 'package:ecommerce/linkapi.dart';

import '../../../core/class/crud.dart';

class ItemsData {
  Crud crud = Crud();
  ItemsData(this.crud);

  getData(int id, String userid) async {
    var response = await crud.postData(
        AppLink.items, {'id': id.toString(), 'userid': userid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
