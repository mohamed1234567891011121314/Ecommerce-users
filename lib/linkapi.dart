class AppLink {
  static const String server = "http://10.0.2.2/ecommerce";
  static const String gg = "$server/test.php";
  static const String notification = "$server/notification.php";
  //======================images==========================
  static const String serverimages = "http://10.0.2.2/ecommerce/upload";
  static const String categoriesimage = "$serverimages/categories";
  static const String itemsimage = "$serverimages/items";
  //=======================auth=========================
  static const String signup = "$server/auth/signup.php";
  static const String verfiycode = "$server/auth/verfiycode.php";
  static const String signin = "$server/auth/signin.php";
  static const String resendverfiy = "$server/auth/resendverfiy.php";
  //===================forgetpassword===================
  static const String forgetpasswordchekemail =
      "$server/auth/forgetpassword/checkemail.php";
  static const String forgetpasswordverfiycode =
      "$server/auth/forgetpassword/verfiycode.php";
  static const String forgetpasswordresetpassword =
      "$server/auth/forgetpassword/resetpassword.php";
  //====================HomePage========================
  static const String homepage = "$server/homepage.php";
  //======================Items=========================
  static const String items = "$server/items/items.php";
  static const String searchitems = "$server/items/search.php";
  //====================favourit========================
  static const String addfav = "$server/favourite/add.php";
  static const String removefav = "$server/favourite/remove.php";
  static const String viewfav = "$server/favourite/view.php";
  static const String deletefav = "$server/favourite/deletefavourit.php";
  //=======================Cart==========================
  static const String viewcart = "$server/cart/view.php";
  static const String addcart = "$server/cart/add.php";
  static const String deletecart = "$server/cart/delete.php";
  static const String getcountitemscart = "$server/cart/getcountitems.php";
  //======================Address========================
  static const String addaddress = "$server/address/add.php";
  static const String editaddress = "$server/address/edit.php";
  static const String deleteaddress = "$server/address/delete.php";
  static const String viewaddress = "$server/address/view.php";
  //======================Coupon=========================
  static const String checkcoupon = "$server/coupon/checkcoupon.php";
  //=====================Checkout========================
  static const String checkout = "$server/orders/checkout.php";
  static const String pendingOrder = "$server/orders/pending.php";
  static const String ordersdetails = "$server/orders/details.php";
  static const String ordersdelete = "$server/orders/delete.php";
  static const String ordersarchive = "$server/orders/archive.php";
  //======================Offers=========================
  static const String offersitems = "$server/offers.php";
  //======================Rating=========================
  static const String rating = "$server/rating.php";
}
