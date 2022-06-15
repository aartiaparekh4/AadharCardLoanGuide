// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:aadhar_card_loan_guide/Utils/utils.dart';
import 'package:aadhar_card_loan_guide/Utils/widgets/banner_ad.dart';
import 'package:aadhar_card_loan_guide/models/banklist_response.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:clipboard/clipboard.dart';

class BankDetailsPage extends StatefulWidget {
  BankListData bankListData;
  BankDetailsPage({required this.bankListData});
  @override
  State<StatefulWidget> createState() => BankDetailsPageState();
}

class BankDetailsPageState extends State<BankDetailsPage> {
  late BannerAd bottomBannerAd;
  // late BannerAd topBannerAd;
  @override
  void initState() {
    super.initState();

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
          color: HexColor("#F2F2F3"),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                children: [
                  Utils.customAppBar(color: HexColor("#60B357"), text: "APPLY", textColor: Colors.black, context: context),
                  Container(
                    margin: const EdgeInsets.only(left: 22, right: 22),
                    child: Column(
                      children: const [
                        Gap(22),
                        Text(
                          "Follow the below step to take a loan",
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                        Gap(16),
                        Text(
                          "Step 1\nClick Below 'COPY link' Button to copy bank website link",
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                        Gap(16),
                        Text(
                          "Step 2\nOpen any Browser in your device and simply Paste it on Search box",
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                        Gap(16),
                        Text(
                          "Step 3\nClick Apply Button & insert All instruction in form",
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: GestureDetector(
                    onTap: () {
                      FlutterClipboard.copy(widget.bankListData.loanUrl!).then((value) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Link Copied")));
                      });
                    },
                    child: Container(
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
                              "COPY LINK",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black, fontSize: 14),
                            )),
                          ],
                        ))),
              ),
            ],
          ),
        ),
        bottomNavigationBar: bottomBannerAd,
      ),
    );
  }
}
