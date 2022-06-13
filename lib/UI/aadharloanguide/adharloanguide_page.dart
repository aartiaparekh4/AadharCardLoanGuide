import 'package:aadhar_card_loan_guide/Utils/navigation/navigation_service.dart';
import 'package:aadhar_card_loan_guide/Utils/navigation/routes.dart';
import 'package:aadhar_card_loan_guide/Utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';

class AdharLoanGuidePage extends StatelessWidget {
  const AdharLoanGuidePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Column(
          children: [
          Utils.customAppBar(color: HexColor("#60B357"),text: "AADHARCARD LOAN GUIDE",textColor: Colors.black,context: context),
            Gap(120),
              GestureDetector(
                onTap: (){
                  NavigationService.push(Routes.applyNowPage);
                },
                  child: Utils.containerWidget(title: "Apply Now",context:context,align: TextAlign.center,isCheck: false)),
              Gap(20),
              GestureDetector(
                onTap: (){
                  NavigationService.push(Routes.typeLoanPage);
                },
                  child: Utils.containerWidget(title: "Type of Loan",context:context,align: TextAlign.center,isCheck: false))
        ],),
      ),
    );
  }
}
