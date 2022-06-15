import 'package:aadhar_card_loan_guide/Utils/navigation/navigation_service.dart';
import 'package:aadhar_card_loan_guide/Utils/navigation/routes.dart';
import 'package:aadhar_card_loan_guide/Utils/utils.dart';
import 'package:aadhar_card_loan_guide/Utils/widgets/banner_ad.dart';
import 'package:aadhar_card_loan_guide/Utils/widgets/reward_ad.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';

class AdharLoanGuidePage extends StatefulWidget {
  AdharLoanGuidePage() : super();
  @override
  // ignore: library_private_types_in_public_api
  _AdharLoanGuidePageState createState() => _AdharLoanGuidePageState();
}

class _AdharLoanGuidePageState extends State<AdharLoanGuidePage> {
  late BannerAd bottomBannerAd;
  // late BannerAd topBannerAd;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Material(
          child: Column(
            children: [
              Utils.customAppBar(color: HexColor("#60B357"), text: "AADHARCARD LOAN GUIDE", textColor: Colors.black, context: context),
              // Align(
              //   alignment: Alignment.topCenter,
              //   child: topBannerAd,
              // ),
              const Gap(200),
              GestureDetector(
                  onTap: () {
                    RewardAd temp = RewardAd(onClose: () {
                      NavigationService.push(Routes.applyNowPage);
                    });
                    temp.initAd();
                  },
                  child: Utils.containerWidget1(title: "Apply Now", context: context, align: TextAlign.center, isCheck: false)),
              const Gap(20),
              GestureDetector(
                  onTap: () {
                    RewardAd temp = RewardAd(onClose: () {
                      NavigationService.push(Routes.typeLoanPage);
                    });
                    temp.initAd();
                  },
                  child: Utils.containerWidget1(title: "Type of Loan", context: context, align: TextAlign.center, isCheck: false))
            ],
          ),
        ),
        bottomNavigationBar: bottomBannerAd,
      ),
    );
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
