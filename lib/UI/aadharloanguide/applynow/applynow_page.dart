// ignore_for_file: use_key_in_widget_constructors

import 'package:aadhar_card_loan_guide/UI/aadharloanguide/applynow/apply_details_page.dart';
import 'package:aadhar_card_loan_guide/UI/aadharloanguide/applynow/applyloan_presenter.dart';
import 'package:aadhar_card_loan_guide/Utils/navigation/navigation_service.dart';
import 'package:aadhar_card_loan_guide/Utils/navigation/routes.dart';
import 'package:aadhar_card_loan_guide/Utils/utils.dart';
import 'package:aadhar_card_loan_guide/Utils/widgets/banner_ad.dart';
import 'package:aadhar_card_loan_guide/Utils/widgets/reward_ad.dart';
import 'package:aadhar_card_loan_guide/models/apply_loan_response.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';

class ApplyNowPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ApplyNowPageState();
}

class ApplyNowPageState extends State<ApplyNowPage> implements ApplyLoanInterface {
  var isLoading = false;
  List<ApplyData> applyLists = [];
  late ApplyLoanPresenter applyLoanPresenter;
  late BannerAd bottomBannerAd;
  // late BannerAd topBannerAd;

  @override
  void initState() {
    super.initState();
    applyLoanPresenter = ApplyLoanPresenter(this);
    setState(() {
      isLoading = true;
    });
    applyLoanPresenter.doApplyLoan();
    bottomBannerAd = BannerAd();

    // topBannerAd = BannerAd(
    //   isBanner: false,
    // );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Material(
          child: Stack(
            children: [
              Column(
                children: [
                  Utils.customAppBar(color: HexColor("#60B357"), text: "AADHARCARD LOAN GUIDE", textColor: Colors.black, context: context),
                  // Align(
                  //   alignment: Alignment.topCenter,
                  //   child: topBannerAd,
                  // ),
                  const Gap(10),
                  Expanded(
                      child: ListView.builder(
                          itemCount: applyLists.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                RewardAd temp = RewardAd(onClose: () {
                                  NavigationService.push(Routes.applyDetailsPage, arguments: ApplyDetailsPage(title: applyLists[index].question.toString(), answer: applyLists[index].answer.toString()));
                                });
                                temp.initAd();
                              },
                              child: Utils.containerWidget(title: applyLists[index].question.toString(), context: context, align: TextAlign.start, isCheck: false),
                            );
                          }))
                ],
              ),
              Utils.progressDialog(context, isLoading)
            ],
          ),
        ),
        bottomNavigationBar: bottomBannerAd,
      ),
    );
  }

  @override
  onError(String msg) {
    setState(() {
      isLoading = false;
    });
  }

  @override
  onSuccess(ApplyLoanResponse applyLoanResponse) {
    setState(() {
      isLoading = false;
      applyLists.addAll(applyLoanResponse.data!);
    });
  }
}
