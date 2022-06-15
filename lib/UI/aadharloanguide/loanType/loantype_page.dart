// ignore_for_file: use_key_in_widget_constructors

import 'package:aadhar_card_loan_guide/UI/aadharloanguide/loanType/loantype_details_page.dart';
import 'package:aadhar_card_loan_guide/UI/aadharloanguide/loanType/typeofloan_presenter.dart';
import 'package:aadhar_card_loan_guide/Utils/navigation/navigation_service.dart';
import 'package:aadhar_card_loan_guide/Utils/navigation/routes.dart';
import 'package:aadhar_card_loan_guide/Utils/utils.dart';
import 'package:aadhar_card_loan_guide/Utils/widgets/banner_ad.dart';
import 'package:aadhar_card_loan_guide/Utils/widgets/reward_ad.dart';
import 'package:aadhar_card_loan_guide/models/typeof_loan_response.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';

class LoanTypePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoanTypePageState();
}

class LoanTypePageState extends State<LoanTypePage> implements TypeofLoanInterface {
  var isLoading = false;
  List<DataTypeloan> loanTypeLists = [];
  late TypeofLoanPresenter typeofLoanPresenter;
  late BannerAd bottomBannerAd;
  // late BannerAd topBannerAd;

  @override
  void initState() {
    super.initState();
    typeofLoanPresenter = TypeofLoanPresenter(this);
    setState(() {
      isLoading = true;
    });
    typeofLoanPresenter.doTypeLoanData();
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
                  Utils.customAppBar(color: HexColor("#60B357"), text: "AADHARCARD LOAN", textColor: Colors.black, context: context),
                  const Gap(22),
                  Expanded(
                      child: ListView.builder(
                          itemCount: loanTypeLists.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                RewardAd temp = RewardAd(onClose: () {
                                  NavigationService.push(Routes.loanTypeDetailsPage,
                                      arguments: LoanTypeDetailsPage(
                                        dataTypeloan: loanTypeLists[index],
                                      ));
                                });
                                temp.initAd();
                              },
                              child: Container(
                                  margin: const EdgeInsets.only(left: 22, right: 22, bottom: 12),
                                  width: MediaQuery.of(context).size.width / 2,
                                  padding: const EdgeInsets.only(top: 12, bottom: 12, left: 22, right: 22),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: HexColor("#52B4F8"),
                                  ),
                                  child: Row(
                                    children: [
                                      Utils.networkimageView(image: loanTypeLists[index].image.toString(), width: 35, height: 35),
                                      const Gap(12),
                                      Text(
                                        loanTypeLists[index].name.toString(),
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(color: Colors.white, fontSize: 18),
                                      ),
                                    ],
                                  )),
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
  onSuccess(TypeOfLoanResponse typeOfLoanResponse) {
    setState(() {
      isLoading = false;
      loanTypeLists.addAll(typeOfLoanResponse.data!);
    });
  }
}
