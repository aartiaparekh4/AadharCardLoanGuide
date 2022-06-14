import 'package:aadhar_card_loan_guide/Utils/app_constant/app_images.dart';
import 'package:flutter/material.dart';

import '../../Utils/app_colors.dart';
import '../../models/home_page/gridview_item_model.dart';

class HomeProvider with ChangeNotifier {
  List<GridViewitemModel> gridVuewItems = [
    GridViewitemModel(
      title: 'Instance Loan',
      image: AppImages.instanceLoan,
      backgroundColor: AppColors.orange.withOpacity(0.8),
    ),
    GridViewitemModel(
      title: 'Loan Guide',
      image: AppImages.loanGuide,
      backgroundColor: AppColors.magenta,
    ),
    GridViewitemModel(
      title: 'Loan Type',
      image: AppImages.loanType,
      backgroundColor: AppColors.green2,
    ),
    GridViewitemModel(
      title: 'EPF Service',
      image: AppImages.epfService,
      backgroundColor: AppColors.themeColor1,
    ),
    GridViewitemModel(
      title: 'Bank Holiday',
      image: AppImages.bankHoliday,
      backgroundColor: AppColors.purple,
    ),
    GridViewitemModel(
      title: 'Bank Info',
      image: AppImages.bankInfo,
      backgroundColor: AppColors.orange2,
    ),
    // GridViewitemModel(
    //   title: 'Cash Counter',
    //   image: AppImages.cashCounter,
    //   backgroundColor: AppColors.blue,
    // ),
    // GridViewitemModel(
    //   title: 'Near By',
    //   image: AppImages.nearBy,
    //   backgroundColor: AppColors.yellow,
    // ),
  ];
}
