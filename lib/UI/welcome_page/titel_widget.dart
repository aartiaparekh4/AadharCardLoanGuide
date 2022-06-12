import 'package:flutter/material.dart';

import '../../Utils/app_colors.dart';
import '../../Utils/app_constant/app_text.dart';
import '../../Utils/app_text_style.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 140,
      decoration: const BoxDecoration(
        color: AppColors.themeColor1,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(300),
          bottomRight: Radius.circular(300),
        ),
      ),
      padding: const EdgeInsets.only(bottom: 40),
      margin: const EdgeInsets.symmetric(horizontal: 40),
      alignment: Alignment.bottomCenter,
      child: Text(
        AppText.instantAadharCardLoan,
        style: AppTextStyle.styleWhite22W500,
        textAlign: TextAlign.center,
      ),
    );
  }
}
