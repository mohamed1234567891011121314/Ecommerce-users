import '../../../../../core/class/crud.dart';
import '../../../../../linkapi.dart';

class ForgetPasswordCheckEmailData {
  Crud crud = Crud();
  ForgetPasswordCheckEmailData(this.crud);

  getDatacheckemail(String email) async {
    var response = await crud.postData(AppLink.forgetpasswordchekemail, {
      'email': email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
