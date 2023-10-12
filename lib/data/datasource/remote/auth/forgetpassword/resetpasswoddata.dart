import '../../../../../core/class/crud.dart';
import '../../../../../linkapi.dart';

class ResetPasswordData {
  Crud crud = Crud();
  ResetPasswordData(this.crud);

  getDataVerfiyCode(String email, String password) async {
    var response = await crud.postData(AppLink.forgetpasswordresetpassword, {
      'email': email,
      'password': password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
