import 'package:aadhar_card_loan_guide/UI/aadharloanguide/applynow/apply_details_page.dart';
import 'package:aadhar_card_loan_guide/UI/aadharloanguide/applynow/applyloan_presenter.dart';
import 'package:aadhar_card_loan_guide/Utils/navigation/navigation_service.dart';
import 'package:aadhar_card_loan_guide/Utils/navigation/routes.dart';
import 'package:aadhar_card_loan_guide/Utils/utils.dart';
import 'package:aadhar_card_loan_guide/models/apply_loan_response.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';

class ApplyNowPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ApplyNowPageState();
}

class ApplyNowPageState extends State<ApplyNowPage> implements ApplyLoanInterface  {
  var isLoading = false;
  List<ApplyData> applyLists=[];
  late ApplyLoanPresenter applyLoanPresenter;

  @override
  void initState() {
    super.initState();
    applyLoanPresenter = ApplyLoanPresenter(this);
   setState(() {
      isLoading = true;
    });
    applyLoanPresenter.doApplyLoan();
  }

@override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Stack(
          children: [
            Column(
              children: [
                Utils.customAppBar(color: HexColor("#60B357"),text: "AADHARCARD LOAN GUIDE",textColor: Colors.black,context: context),
                 Gap(22),
                Expanded(child:ListView.builder(
                    itemCount: applyLists.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          NavigationService.push(Routes.applyDetailsPage,arguments: ApplyDetailsPage(title: applyLists[index].question.toString(), answer:applyLists[index].answer.toString()));
                        },
                        child:  Utils.containerWidget(title: applyLists[index].question.toString(),context:context,align: TextAlign.start,isCheck: false),
                      );
                    }))
              ],),
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
  onSuccess(ApplyLoanResponse applyLoanResponse) {
    setState(() {
      isLoading = false;
      applyLists.addAll(applyLoanResponse.data!!);
    });

  }
}
