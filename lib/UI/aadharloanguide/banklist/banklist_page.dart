// ignore_for_file: use_key_in_widget_constructors

import 'package:aadhar_card_loan_guide/UI/aadharloanguide/banklist/banklist_presenter.dart';
import 'package:aadhar_card_loan_guide/Utils/navigation/navigation_service.dart';
import 'package:aadhar_card_loan_guide/Utils/navigation/routes.dart';
import 'package:aadhar_card_loan_guide/Utils/utils.dart';
import 'package:aadhar_card_loan_guide/Utils/widgets/banner_ad.dart';
import 'package:aadhar_card_loan_guide/Utils/widgets/reward_ad.dart';
import 'package:aadhar_card_loan_guide/models/banklist_response.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';

class BankListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BankListPageState();
}

class BankListPageState extends State<BankListPage> implements BankListInterface {
  var isLoading = false;
  List<BankListData> bankLists = [];
  late BankListPresenter bankListPresenter;
  late BannerAd bottomBannerAd;
  // late BannerAd topBannerAd;

  @override
  void initState() {
    super.initState();
    bankListPresenter = BankListPresenter(this);
    setState(() {
      isLoading = true;
    });
    bankListPresenter.doBankListData();
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
                  Utils.customAppBar(color: HexColor("#60B357"), text: "BANK LIST", textColor: Colors.black, context: context),
                  const Gap(22),
                  Container(
                      margin: const EdgeInsets.only(left: 32, right: 32),
                      width: MediaQuery.of(context).size.width / 2.5,
                      padding: const EdgeInsets.only(top: 12, bottom: 12, left: 22, right: 22),
                      decoration: BoxDecoration(
                        border: Border.all(color: HexColor("#000000")),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        children: const [
                          Expanded(
                              child: Text(
                            "Select Option",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          )),
                        ],
                      )),
                  const Gap(16),
                  Expanded(
                      child: ListView.builder(
                          itemCount: bankLists.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                RewardAd temp = RewardAd(onClose: () {
                                  NavigationService.push(Routes.bankDetailsPage);
                                });
                                temp.initAd();
                              },
                              child: Utils.containerWithImageWidget(title: bankLists[index].name.toString(), context: context, align: TextAlign.start, image: bankLists[index].image.toString()),
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
  onSuccess(BankListResponse bankListResponse) {
    setState(() {
      isLoading = false;
      bankLists.addAll(bankListResponse.data!);
    });
  }
}
