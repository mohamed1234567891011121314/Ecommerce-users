import 'package:ecommerce/linkapi.dart';

import '../../../core/class/crud.dart';

class OffersData {
  Crud crud = Crud();
  OffersData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.offersitems, {});
    return response.fold((l) => l, (r) => r);
  }
}
