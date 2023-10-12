import 'package:ecommerce/linkapi.dart';

import '../../../core/class/crud.dart';

class MyFanouriteViewData {
  Crud crud = Crud();
  MyFanouriteViewData(this.crud);

  addFavourite(String id) async {
    var response = await crud.postData(AppLink.viewfav, {
      'id': id,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteFavourite(String id) async {
    var response = await crud.postData(AppLink.deletefav, {
      'id': id,
    });
    return response.fold((l) => l, (r) => r);
  }
}
