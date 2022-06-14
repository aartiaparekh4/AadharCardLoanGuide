// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:aadhar_card_loan_guide/Utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';

class TypeofLoanDetailsPage extends StatefulWidget {
  String description;
  TypeofLoanDetailsPage({required this.description});
  @override
  State<StatefulWidget> createState() => TypeofLoanDetailsState();
}

class TypeofLoanDetailsState extends State<TypeofLoanDetailsPage> {
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
                Utils.customAppBar(color: HexColor("#60B357"), text: "DETAILS", textColor: Colors.black, context: context),
                const Gap(22),
                Container(
                    margin: const EdgeInsets.only(left: 32, right: 32),
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(top: 12, bottom: 12, left: 22, right: 22),
                    decoration: BoxDecoration(
                      color: HexColor("#F7F7F7"),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Html(data:  widget.description)
                          // Text(
                          //   widget.description,
                          //   textAlign: TextAlign.center,
                          //   style: const TextStyle(color: Colors.black, fontSize: 14),
                          // ),
                        ),
                      ],
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
