import 'package:ecommerce/linkapi.dart';

import '../../../core/class/crud.dart';

class FavouriteData {
  Crud crud = Crud();
  FavouriteData(this.crud);

  addFavourite(String userid, String itemsid) async {
    var response = await crud.postData(AppLink.addfav, {
      "userid": userid,
      "itemsid": itemsid,
    });
    return response.fold((l) => l, (r) => r);
  }

  removeFavourite(String userid, String itemsid) async {
    var response = await crud.postData(AppLink.removefav, {
      "userid": userid,
      "itemsid": itemsid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
