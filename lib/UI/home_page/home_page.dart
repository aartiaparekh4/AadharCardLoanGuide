// ignore_for_file: avoid_print, body_might_complete_normally_nullable, use_key_in_widget_constructors

import 'package:aadhar_card_loan_guide/Utils/app_constant/app_images.dart';
import 'package:aadhar_card_loan_guide/Utils/app_text_style.dart';
import 'package:aadhar_card_loan_guide/Utils/navigation/navigation_service.dart';
import 'package:aadhar_card_loan_guide/Utils/navigation/routes.dart';
import 'package:aadhar_card_loan_guide/Utils/widgets/banner_ad.dart';
import 'package:aadhar_card_loan_guide/Utils/widgets/reward_ad.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/home_provider/home_provider.dart';
import '../../Utils/app_colors.dart';
import '../../Utils/widgets/app_space.dart';
import 'widgets/grid_view_item.dart';

class HomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  HomePage() : super();
  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late BannerAd bottomBannerAd;
  // late BannerAd topBannerAd;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context);
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: [
            const VerticalSpace(40),
            AppImages.threePondIamge.widget(
              height: 200,
            ),
            // Align(
            //   alignment: Alignment.topCenter,
            //   child: topBannerAd,
            // ),
            const VerticalSpace(40),
            Container(
              decoration: BoxDecoration(
                color: AppColors.themeColor1,
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  AppImages.aadharIcon.widget(
                    height: 30,
                    color: AppColors.white,
                  ),
                  const HorizontalSpace(10),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      RewardAd temp = RewardAd(onClose: () {
                        NavigationService.push(Routes.adharloanguide);
                      });
                      temp.initAd();
                    },
                    child: Text(
                      'Aadhar Loan Guide',
                      style: AppTextStyle.styleWhite17W500,
                    ),
                  ),
                ],
              ),
            ),
            const VerticalSpace(20),
            for (int i = 0; i < provider.gridVuewItems.length; i = i + 2) ...[
              Row(
                children: [
                  Flexible(
                    child: GriedViewItem(
                      title: provider.gridVuewItems[i].title,
                      icon: provider.gridVuewItems[i].image.widget(),
                      backgroundImage: const Placeholder(),
                      backgroundColor: provider.gridVuewItems[i].backgroundColor,
                      onTapIndex: i,
                    ),
                  ),
                  const HorizontalSpace(15),
                  Flexible(
                    child: GriedViewItem(
                      title: provider.gridVuewItems[i + 1].title,
                      icon: provider.gridVuewItems[i + 1].image.widget(),
                      backgroundImage: const Placeholder(),
                      backgroundColor: provider.gridVuewItems[i + 1].backgroundColor,
                      onTapIndex: i + 1,
                    ),
                  ),
                ],
              ),
              const VerticalSpace(15),
            ]
          ],
        ),
      ),
      bottomNavigationBar: bottomBannerAd,
    ));
  }

  @override
  void initState() {
    super.initState();

    bottomBannerAd = BannerAd();

    // topBannerAd = BannerAd(
    //   isBanner: false,
    // );
  }
}
