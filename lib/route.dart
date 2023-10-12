import 'package:ecommerce/core/constant/approutes.dart';
import 'package:ecommerce/core/middleware/mumiddleware.dart';
import 'package:ecommerce/view/address/add.dart';
import 'package:ecommerce/view/address/addparttwo.dart';
import 'package:ecommerce/view/address/view.dart';
import 'package:ecommerce/view/screen/checkout.dart';
import 'package:ecommerce/view/screen/itemsdetails.dart';
// import 'package:ecommerce/test.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecommerce/view/screen/auth/signup.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/successresetpassword.dart';
import 'package:ecommerce/view/screen/auth/successsignup.dart';
import 'package:ecommerce/view/screen/auth/forgetpassword/verifycodepassword.dart';
import 'package:ecommerce/view/screen/auth/verifycodesigneupemail.dart';
import 'package:ecommerce/view/screen/boardingscreen.dart';
import 'package:ecommerce/view/screen/cart.dart';
import 'package:ecommerce/view/screen/homescreen.dart';
import 'package:ecommerce/view/screen/item.dart';
import 'package:ecommerce/view/screen/language.dart';
import 'package:ecommerce/view/screen/myfavourite.dart';
import 'package:ecommerce/view/screen/orders/archive.dart';
import 'package:ecommerce/view/screen/orders/orderdetails.dart';
import 'package:ecommerce/view/screen/orders/pending.dart';
import 'package:ecommerce/view/screen/settingscreen.dart';
import 'package:get/get.dart';

import 'view/screen/auth/signin.dart';

List<GetPage<dynamic>>? routs = [
  // GetPage(name: '/', page: () => const Testing()),
  GetPage(
      name: AppRoute.language,
      page: () => const Language(),
      middlewares: [MyMiddleWare()]),
  GetPage(name: AppRoute.signin, page: () => const SignIn()),
  GetPage(name: AppRoute.signup, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verify, page: () => const VerifyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetPassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(
    name: AppRoute.verfyCodeSignUp,
    page: () => const VerifyCodeSignInEmail(),
  ),
  GetPage(
    name: AppRoute.homePage,
    page: () => const HomeScreen(),
  ),
  GetPage(
    name: AppRoute.items,
    page: () => const Items(),
  ),
  GetPage(name: AppRoute.itemsdetails, page: () => const ItemsDetails()),
  GetPage(name: AppRoute.myfavourite, page: () => const MyFavourite()),
  GetPage(name: AppRoute.settingscreen, page: () => const SettingScreen()),
  GetPage(name: AppRoute.boardingScreen, page: () => const BoardingScreen()),
  GetPage(name: AppRoute.addressview, page: () => const AddressView()),
  GetPage(name: AppRoute.addressadd, page: () => const AddressAdd()),
  GetPage(name: AppRoute.addressaddtwo, page: () => const AddAddressPartTwo()),
  GetPage(name: AppRoute.cart, page: () => const Cart()),
  GetPage(name: AppRoute.checkout, page: () => const CheckOut()),
  GetPage(name: AppRoute.orderdetails, page: () => const OrderDetails()),
  GetPage(name: AppRoute.orderpending, page: () => const OrdersPending()),
  GetPage(name: AppRoute.orderarchive, page: () => const OrdersArchive()),
];

// Map<String, Widget Function(BuildContext)> appRoutes = {
//   AppRoute.signin: (context) => const SignIn(),
//   AppRoute.signup: (context) => const SignUp(),
//   AppRoute.forgetPassword: (context) => const ForgetPassword(),
//   AppRoute.verify: (context) => const VerifyCode(),
//   AppRoute.resetPassword: (context) => const ResetPassword(),
//   AppRoute.successResetPassword: (context) => const SuccessResetPassword(),
//   AppRoute.successSignUp: (context) => const SuccessSignUp(),
//   AppRoute.verfyCodeSignUp: (context) => const VerifyCodeSignInEmail(),
//   AppRoute.boardingScreen: (context) => const BoardingScreen(),
// };
