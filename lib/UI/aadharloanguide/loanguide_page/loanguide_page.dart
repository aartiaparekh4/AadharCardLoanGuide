import 'package:aadhar_card_loan_guide/UI/aadharloanguide/loanguide_page/loanguide_presenter.dart';
import 'package:aadhar_card_loan_guide/Utils/utils.dart';
import 'package:aadhar_card_loan_guide/models/loan_guide_response.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';

class LoanGuidePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoanTypePageState();
}
class LoanTypePageState extends State<LoanGuidePage>  implements LoanGuideInterface{
  var isLoading = false;
  List<GuideData> loanguideLists=[];
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
                Utils.customAppBar(color: HexColor("#60B357"),text: "AADHARCARD LOAN",textColor: Colors.black,context: context),
                Gap(22),
                Expanded(child:ListView.builder(
                    itemCount: loanguideLists.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {},
                        child:Container(
                            margin: EdgeInsets.only(left: 22,right: 22,bottom: 10),
                            width: MediaQuery.of(context).size.width/2,
                            padding: EdgeInsets.only(top: 12,bottom: 12,left: 22,right: 22),
                            decoration: BoxDecoration(
                              color:HexColor("#F7F7F7"),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(loanguideLists[index].question.toString(),textAlign:TextAlign.start,style: TextStyle(color: Colors.black, fontSize: 14),),
                              ],
                            )),
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
  onSuccess(LoanGuideResponse loanGuideResponse) {
    setState(() {
      isLoading = false;
      loanguideLists.addAll(loanGuideResponse.data!!);
    });
  }
}
