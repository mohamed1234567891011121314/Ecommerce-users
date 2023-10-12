import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == 'username') {
    if (!GetUtils.isUsername(val)) {
      return 'not valid username';
    }
  }
  if (type == 'email') {
    if (!GetUtils.isEmail(val)) {
      return 'not valid email';
    }
  }
  if (type == 'Phone') {
    if (!GetUtils.isPhoneNumber(val)) {
      return 'not valid phone';
    }
  }
  if (val.length < min) {
    return 'value cant be less than $min';
  }
  if (val.length > max) {
    return 'value cant be larger than $max';
  }
  if (val.isEmpty) {
    return 'cant be Empty';
  }
}
