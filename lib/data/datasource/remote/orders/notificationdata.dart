import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class NotificationData {
  Crud crud = Crud();
  NotificationData(this.crud);

  getData(int id) async {
    var response =
        await crud.postData(AppLink.notification, {"id": id.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
