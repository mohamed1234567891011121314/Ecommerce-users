import 'package:ecommerce/linkapi.dart';

import '../../../core/class/crud.dart';

class ChechoutData {
  Crud crud = Crud();
  ChechoutData(this.crud);

  getData(Map data) async {
    var response = await crud.postData(AppLink.checkout, data);
    return response.fold((l) => l, (r) => r);
  }
}
