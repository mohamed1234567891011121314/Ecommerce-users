import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class VerfiyCodeSignupData {
  Crud crud = Crud();
  VerfiyCodeSignupData(this.crud);

  getDataVerfiycode(String email, String verfiycode) async {
    var response = await crud.postData(AppLink.verfiycode, {
      'email': email,
      'verifycode': verfiycode,
    });
    return response.fold((l) => l, (r) => r);
  }

  reSendVerfiycode(String email) async {
    var response = await crud.postData(AppLink.resendverfiy, {
      'email': email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
