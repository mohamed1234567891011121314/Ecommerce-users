import '../../../../../core/class/crud.dart';
import '../../../../../linkapi.dart';

class VerfiyCodeCheckEmailData {
  Crud crud = Crud();
  VerfiyCodeCheckEmailData(this.crud);

  getDataVerfiyCode(String email, String verfiycode) async {
    var response = await crud.postData(AppLink.forgetpasswordverfiycode, {
      'email': email,
      'verfiycode': verfiycode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
