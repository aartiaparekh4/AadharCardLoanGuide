// ignore_for_file: use_key_in_widget_constructors

import 'package:aadhar_card_loan_guide/UI/aadharloanguide/bankinfo_page/bankdetail_page.dart';
import 'package:aadhar_card_loan_guide/UI/aadharloanguide/bankinfo_page/bankinfo_presenter.dart';
import 'package:aadhar_card_loan_guide/Utils/navigation/navigation_service.dart';
import 'package:aadhar_card_loan_guide/Utils/navigation/routes.dart';
import 'package:aadhar_card_loan_guide/Utils/utils.dart';
import 'package:aadhar_card_loan_guide/Utils/widgets/banner_ad.dart';
import 'package:aadhar_card_loan_guide/Utils/widgets/reward_ad.dart';
import 'package:aadhar_card_loan_guide/models/bank_info_response.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';

class BankInfoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BankInfoPageState();
}

class BankInfoPageState extends State<BankInfoPage> implements BankInfoInterface {
  var isLoading = false;
  List<BankInfoData> bankInfoDataLists = [];
  late BankInfoPresenter bankInfoPresenter;
  late BannerAd bottomBannerAd;
  // late BannerAd topBannerAd;

  @override
  void initState() {
    super.initState();
    bankInfoPresenter = BankInfoPresenter(this);
    setState(() {
      isLoading = true;
    });
    bankInfoPresenter.doBankInfoData();
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
                  Utils.customAppBar(color: HexColor("#60B357"), text: "AADHAR LOAN", textColor: Colors.black, context: context),
                  const Gap(22),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: ListView.builder(
                        itemCount: bankInfoDataLists.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: GestureDetector(
                              onTap: () async {
                                RewardAd temp = RewardAd(onClose: () {
                                  NavigationService.push(Routes.bankDetailPage,
                                      arguments: BankDetailPage(
                                        bankInfoData: bankInfoDataLists[index],
                                      ));
                                });
                                temp.initAd();
                              },
                              child: Stack(
                                alignment: Alignment.centerLeft,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: (MediaQuery.of(context).size.width * 6) / 100),
                                    child: Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.black),
                                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Padding(
                                            padding: EdgeInsets.only(left: (MediaQuery.of(context).size.width * 6) / 100),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  bankInfoDataLists[index].name!,
                                                  style: const TextStyle(fontSize: 17),
                                                  textAlign: TextAlign.right,
                                                ),
                                                const Icon(Icons.arrow_forward_ios)
                                              ],
                                            ),
                                          ),
                                        )),
                                  ),
                                  Container(
                                    height: 45,
                                    width: 45,
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(color: Color(0XFF01CD90), shape: BoxShape.circle),
                                    child: Text(
                                      bankInfoDataLists[index].name![0],
                                      style: const TextStyle(fontSize: 18, color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ))
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
  onSuccess(BankInfoResponse bankInfoResponse) {
    setState(() {
      isLoading = false;
      bankInfoDataLists.addAll(bankInfoResponse.data!);
    });
  }
}
