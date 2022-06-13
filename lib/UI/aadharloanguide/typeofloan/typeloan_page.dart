import 'package:aadhar_card_loan_guide/UI/aadharloanguide/loanType/typeofloan_presenter.dart';
import 'package:aadhar_card_loan_guide/UI/aadharloanguide/typeofloan/typeofloan_details_page.dart';
import 'package:aadhar_card_loan_guide/Utils/navigation/navigation_service.dart';
import 'package:aadhar_card_loan_guide/Utils/navigation/routes.dart';
import 'package:aadhar_card_loan_guide/Utils/utils.dart';
import 'package:aadhar_card_loan_guide/models/typeof_loan_response.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';

class TypeLoanPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoanTypePageState();
}
class LoanTypePageState extends State<TypeLoanPage>  implements TypeofLoanInterface{
  var isLoading = false;
  List<DataTypeloan> loanTypeLists=[];
  late TypeofLoanPresenter typeofLoanPresenter;

  @override
  void initState() {
    super.initState();
    typeofLoanPresenter = TypeofLoanPresenter(this);
    setState(() {
      isLoading = true;
    });
    typeofLoanPresenter.doTypeLoanData();
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
                    itemCount: loanTypeLists.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          NavigationService.push(Routes.typeofLoanDetailsPage,arguments: TypeofLoanDetailsPage(description:loanTypeLists[index].description.toString()));
                        },
                        child:Utils.containerViewWidget(title: loanTypeLists[index].name.toString(), context: context, align: TextAlign.start)
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
  onSuccess(TypeOfLoanResponse typeOfLoanResponse) {
    setState(() {
      isLoading = false;
      loanTypeLists.addAll(typeOfLoanResponse.data!!);
    });

  }
}
