// ignore_for_file: avoid_unnecessary_containers, use_key_in_widget_constructors

import 'package:aadhar_card_loan_guide/UI/aadharloanguide/loanguide_page/loanguide_details_page.dart';
import 'package:aadhar_card_loan_guide/UI/aadharloanguide/loanguide_page/loanguide_presenter.dart';
import 'package:aadhar_card_loan_guide/Utils/navigation/navigation_service.dart';
import 'package:aadhar_card_loan_guide/Utils/navigation/routes.dart';
import 'package:aadhar_card_loan_guide/Utils/utils.dart';
import 'package:aadhar_card_loan_guide/models/loan_guide_response.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';

class LoanGuidePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoanTypePageState();
}

class LoanTypePageState extends State<LoanGuidePage> implements LoanGuideInterface {
  var isLoading = false;
  List<GuideData> loanguideLists = [];
  late LoanGuidePresenter loanGuidePresenter;

  @override
  void initState() {
    super.initState();
    loanGuidePresenter = LoanGuidePresenter(this);
    setState(() {
      isLoading = true;
    });
    loanGuidePresenter.doLoanGuideData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Stack(
          children: [
            Column(
              children: [
                Utils.customAppBar(color: HexColor("#60B357"), text: "AADHARCARD LOAN", textColor: Colors.black, context: context),
                const Gap(22),
                Expanded(
                    child: ListView.builder(
                        itemCount: loanguideLists.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              NavigationService.push(Routes.loanguidedetailspage,
                                  arguments: LoanGuideDetailsPage(
                                    guideData: loanguideLists[index],
                                  ));
                            },
                            child: Container(
                                margin: const EdgeInsets.only(left: 22, right: 22, bottom: 12),
                                width: MediaQuery.of(context).size.width / 2,
                                padding: const EdgeInsets.only(top: 12, bottom: 12, left: 22, right: 22),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: HexColor("#52B4F8"),
                                ),
                                child: Container(
                                  child: Text(
                                    loanguideLists[index].question.toString(),
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(color: Colors.white, fontSize: 16),
                                  ),
                                )),
                          );
                        }))
              ],
            ),
            Utils.progressDialog(context, isLoading)
          ],
        ),
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
  onSuccess(LoanGuideResponse loanGuideResponse) {
    setState(() {
      isLoading = false;
      loanguideLists.addAll(loanGuideResponse.data!);
    });
  }
}
