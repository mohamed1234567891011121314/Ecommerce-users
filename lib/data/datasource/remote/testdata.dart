import 'package:ecommerce/linkapi.dart';

import '../../../core/class/crud.dart';

class TestData {
  Crud crud = Crud();
  TestData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.gg, {});
    return response.fold((l) => l, (r) => r);
  }
}
