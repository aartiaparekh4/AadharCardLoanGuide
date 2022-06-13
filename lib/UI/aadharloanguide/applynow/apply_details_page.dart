import 'package:aadhar_card_loan_guide/Utils/navigation/navigation_service.dart';
import 'package:aadhar_card_loan_guide/Utils/navigation/routes.dart';
import 'package:aadhar_card_loan_guide/Utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';

class ApplyDetailsPage extends StatefulWidget {
  String title,answer;
  ApplyDetailsPage({required this.title,required this.answer});
  @override
  State<StatefulWidget> createState() => ApplyDetailsPageState();
}
class ApplyDetailsPageState extends State<ApplyDetailsPage>{
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: HexColor("#F2F2F3"),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
            children: [
              Utils.customAppBar(color: HexColor("#60B357"),text: "DETAILS",textColor: Colors.black,context: context),
              const Gap(22),
              Container(
                  margin: const EdgeInsets.only(left: 32,right: 32),
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(top: 12,bottom: 12,left: 22,right: 22),
                  decoration: BoxDecoration(
                    border: Border.all(color: HexColor("#000000")),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    children: [
                      Expanded(child: Text(widget.title,textAlign:TextAlign.center,style: const TextStyle(color: Colors.black, fontSize: 14),)),
                    ],
                  )),
              const Gap(16),
              Container(
                  margin: const EdgeInsets.only(left: 32,right: 32),
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(top: 12,bottom: 12,left: 22,right: 22),
                  decoration: BoxDecoration(
                    color:HexColor("#F7F7F7"),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    children: [
                      Expanded(child: Text(widget.answer,textAlign:TextAlign.center,style: const TextStyle(color: Colors.black, fontSize: 14),)),
                    ],
                  ))
            ],),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GestureDetector(
    onTap: () {
    NavigationService.push(Routes.bankListPage);
    }, child: Container(
                  margin: const EdgeInsets.only(left: 32,right: 32),
                  width: MediaQuery.of(context).size.width/2.5,
                  padding: const EdgeInsets.only(top: 12,bottom: 12,left: 22,right: 22),
                  decoration: BoxDecoration(
                    border: Border.all(color: HexColor("#000000")),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    children: const [
                      Expanded(child: Text("NEXT",textAlign:TextAlign.center,style: TextStyle(color: Colors.black, fontSize: 14),)),
                    ],
                  ))),
            ),
          ],
        ),
      ),
    );
  }
}
