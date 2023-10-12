import 'package:ecommerce/linkapi.dart';

import '../../../../core/class/crud.dart';

class SignupData {
  Crud crud = Crud();
  SignupData(this.crud);

  getDataSignup(
      String username, String password, String email, String phone) async {
    var response = await crud.postData(AppLink.signup, {
      'username': username,
      'password': password,
      'email': email,
      'phone': phone,
    });
    return response.fold((l) => l, (r) => r);
  }
}
