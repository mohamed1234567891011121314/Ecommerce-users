import 'package:ecommerce/core/class/statusrequest.dart';

hanlingData(response) {
  if (response is StatusRequest) {
    return response;
  } else {
    return StatusRequest.success;
  }
}
