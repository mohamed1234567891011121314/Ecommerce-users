import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(child: Lottie.asset(AppImageAsset.onBoardingImage_Loadind))
        : statusRequest == StatusRequest.offlinefailure
            ? Center(
                child: Lottie.asset(AppImageAsset.onBoardingImage_offlinewifi))
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    child: Lottie.asset(
                        AppImageAsset.onBoardingImage_serverfailure))
                // : statusRequest == StatusRequest.noData
                //     ? Center(
                //         child:
                //             Lottie.asset(AppImageAsset.onBoardingImage_nodata))
                : widget;
  }
}

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataRequest(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(child: Lottie.asset(AppImageAsset.onBoardingImage_Loadind))
        : statusRequest == StatusRequest.offlinefailure
            ? Center(
                child: Lottie.asset(AppImageAsset.onBoardingImage_offlinewifi))
            : widget;
  }
}
