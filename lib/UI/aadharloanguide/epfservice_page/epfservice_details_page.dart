import 'package:aadhar_card_loan_guide/Utils/utils.dart';
import 'package:aadhar_card_loan_guide/models/epf_service_response.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';

class EPFServiceDetailsPage extends StatefulWidget {
  EPFServiceData ePFServiceData;
  EPFServiceDetailsPage({required this.ePFServiceData});
  @override
  State<StatefulWidget> createState() => EPFServicDetailsPageState();
}

class EPFServicDetailsPageState extends State<EPFServiceDetailsPage> {
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
                Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(left: 32, right: 32),
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.only(top: 12, bottom: 12, left: 22, right: 22),
                        decoration: BoxDecoration(
                          border: Border.all(color: HexColor("#000000")),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(left: 24),
                              child: Text(
                                widget.ePFServiceData.question!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(color: Colors.black, fontSize: 14),
                              ),
                            )),
                          ],
                        )),
                    const Gap(16),
                    Container(
                        margin: const EdgeInsets.only(left: 32, right: 32),
                        width: MediaQuery.of(context).size.width,
                        height: (MediaQuery.of(context).size.height * 75) / 100,
                        padding: const EdgeInsets.only(top: 12, bottom: 12, left: 22, right: 22),
                        decoration: BoxDecoration(
                          color: HexColor("#F7F7F7"),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: SingleChildScrollView(
                          child: Text(
                            widget.ePFServiceData.answer!,
                            textAlign: TextAlign.justify,
                            style: const TextStyle(color: Colors.black, fontSize: 14),
                          ),
                        ))
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
