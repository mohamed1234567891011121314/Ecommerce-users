import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class SigninData {
  Crud crud = Crud();
  SigninData(this.crud);

  getDataSignin(String email, String password) async {
    var response = await crud.postData(AppLink.signin, {
      'email': email,
      'password': password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
