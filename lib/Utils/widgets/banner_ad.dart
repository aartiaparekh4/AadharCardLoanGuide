// ignore_for_file: sized_box_for_whitespace, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, avoid_print

import 'package:aadhar_card_loan_guide/Utils/app_constant/app_admob.dart';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/cupertino.dart';

class BannerAd extends StatefulWidget {
  final bool isBanner;
  BannerAd({this.isBanner = true}) : super();
  @override
  // ignore: library_private_types_in_public_api
  _BannerAdState createState() => _BannerAdState();
}

class _BannerAdState extends State<BannerAd> {
  late AdmobBanner admobBanner;
  late AdmobBannerSize bannerSize;
  @override
  Widget build(BuildContext context) {
    return admobBanner;
  }

  @override
  void initState() {
    super.initState();
    initAd();
  }

  void initAd() {
    try {
      bannerSize = widget.isBanner ? AdmobBannerSize.BANNER : const AdmobBannerSize(width: 300, height: 200, name: 'CUSTOM');
      admobBanner = AdmobBanner(
        adUnitId: AppAdMob.bannerUnitKey,
        listener: (AdmobAdEvent event, Map<String, dynamic>? args) {
          handleEvent(event, args, true);
        },
        adSize: bannerSize,
      );
    } catch (e) {
      print("Exception: RewardAd - initAd(): ${e.toString()}");
    }
  }

  void handleEvent(AdmobAdEvent event, Map<String, dynamic>? args, bool isBanner) {
    try {
      switch (event) {
        case AdmobAdEvent.loaded:
          print((isBanner) ? "###banner ad loaded" : "###reward ad loaded");
          // if (!isBanner && !isAddShown) {
          //   showAd();
          //   isAddShown = true;
          // }
          break;
        case AdmobAdEvent.opened:
          print((isBanner) ? "###banner ad opened" : "###reward ad opened");
          break;
        case AdmobAdEvent.closed:
          print((isBanner) ? "###banner ad closed" : "###reward ad closed");
          break;
        case AdmobAdEvent.failedToLoad:
          print((isBanner) ? "###banner ad failedToLoad" : "###reward ad failedToLoad");
          break;
        case AdmobAdEvent.rewarded:
          break;
        default:
          print((isBanner) ? "###banner ad ${event.name}" : "###reward ad ${event.name}");
      }
    } catch (e) {
      print("Exception: HomePage - handleEvent(): ${e.toString()}");
    }
  }
}
