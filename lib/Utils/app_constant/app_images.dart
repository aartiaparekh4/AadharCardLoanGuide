import 'package:flutter/material.dart';

import '../widgets/app_image.dart';

abstract class AppImages {
  AppImages._();

  static const String _assetPath = "assets/images/";

  static AppImageBuilder get welcomeImage =>
      AppImageBuilder(_assetPath + 'welcome_image.png');
  static AppImageBuilder get happyIcon =>
      AppImageBuilder(_assetPath + 'happy.png');
  static AppImageBuilder get keyIcon => AppImageBuilder(_assetPath + 'key.png');
  static AppImageBuilder get shareIcon =>
      AppImageBuilder(_assetPath + 'share.png');
  static AppImageBuilder get threePondIamge =>
      AppImageBuilder(_assetPath + 'three_pond_iamge.png');
  static AppImageBuilder get aadharIcon =>
      AppImageBuilder(_assetPath + 'aadhar_icon.png');
  static AppImageBuilder get instanceLoan =>
      AppImageBuilder(_assetPath + 'instance_loan.png');
  static AppImageBuilder get loanGuide =>
      AppImageBuilder(_assetPath + 'loan_guide.png');
  static AppImageBuilder get loanType =>
      AppImageBuilder(_assetPath + 'loan_type.png');
  static AppImageBuilder get epfService =>
      AppImageBuilder(_assetPath + 'epf_service.png');
  static AppImageBuilder get bankHoliday =>
      AppImageBuilder(_assetPath + 'bank_holiday.png');
  static AppImageBuilder get bankInfo =>
      AppImageBuilder(_assetPath + 'bank_info.png');
  static AppImageBuilder get cashCounter =>
      AppImageBuilder(_assetPath + 'cash_counter.png');
  static AppImageBuilder get nearBy =>
      AppImageBuilder(_assetPath + 'near_by.png');
}

class AppImageBuilder {
  final String assetPath;

  AppImageBuilder(this.assetPath);

  Widget widget(
      {Key? key,
      bool matchTextDirection = false,
      AssetBundle? bundle,
      String? package,
      double? width,
      double? height,
      BoxFit fit = BoxFit.contain,
      Alignment alignment = Alignment.center,
      Color? color,
      BorderRadius? borderRadius,
      Widget? placeholder,
      String? errorImageUrl,
      int? memCacheHeight}) {
    return AppImage(
      assetPath,
      key: key,
      width: width,
      height: height,
      fit: fit,
      color: color,
      alignment: alignment,
      placeholder: placeholder,
      errorImageUrl: errorImageUrl,
      memCacheHeight: memCacheHeight,
    );
  }
}
