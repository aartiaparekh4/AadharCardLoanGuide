// ignore_for_file: avoid_print, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:aadhar_card_loan_guide/Utils/widgets/banner_ad.dart';
import 'package:aadhar_card_loan_guide/Utils/widgets/reward_ad.dart';
import 'package:flutter/material.dart';

import '../../Utils/app_colors.dart';
import '../../Utils/app_constant/app_images.dart';
import '../../Utils/app_text_style.dart';
import '../../Utils/navigation/navigation_service.dart';
import '../../Utils/navigation/routes.dart';
import '../../Utils/widgets/app_space.dart';
import '../../Utils/widgets/custom_button.dart';
import 'titel_widget.dart';
import 'welcome_page_button.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage() : super();
  @override
  // ignore: library_private_types_in_public_api
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late RewardAd ad;
  late BannerAd bottomBannerAd;
  // late BannerAd topBannerAd;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const VerticalSpace(20),
                  const TitleWidget(),
                  const VerticalSpace(20),
                  const Spacer(),
                  AppImages.welcomeImage.widget(
                    height: MediaQuery.of(context).size.width / 1.8,
                  ),
                  const VerticalSpace(20),
                  const Spacer(),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     Expanded(
                  //       child: WelcomePageButton(
                  //         icon: AppImages.happyIcon,
                  //         backgroundColor: AppColors.themeColor3,
                  //         onPressed: () {},
                  //       ),
                  //     ),
                  //     const HorizontalSpace(20),
                  //     Expanded(
                  //       child: WelcomePageButton(
                  //         icon: AppImages.shareIcon,
                  //         backgroundColor: AppColors.orange.withOpacity(0.8),
                  //         onPressed: () {},
                  //       ),
                  //     ),
                  //     const HorizontalSpace(20),
                  //     Expanded(
                  //       child: WelcomePageButton(
                  //         backgroundColor: AppColors.green2,
                  //         icon: AppImages.keyIcon,
                  //         onPressed: () {},
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  const VerticalSpace(20),
                  CustomButton(
                    text: "Let's Start",
                    expansed: true,
                    color: AppColors.themeColor1,
                    borderColor: AppColors.themeColor1,
                    borderRedius: 7,
                    height: 50,
                    textStyle: AppTextStyle.styleWhite22W500,
                    onPressed: () {
                     RewardAd temp = RewardAd(onClose: (){ NavigationService.push(Routes.home);});
                      temp.initAd();
                    },
                  ),
                  const VerticalSpace(20),
                ],
              ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 60),
              //   child: Align(
              //     alignment: Alignment.topCenter,
              //     child: topBannerAd,
              //   ),
              // )
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomBannerAd,
    );
  }

  @override
  void initState() {
    super.initState();
    ad = RewardAd(onClose: null);
    ad.initAd();
    bottomBannerAd = BannerAd();

    // topBannerAd = BannerAd(
    //   isBanner: false,
    // );
  }
}
