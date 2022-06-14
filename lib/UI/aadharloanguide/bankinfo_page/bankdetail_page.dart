// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:aadhar_card_loan_guide/Utils/utils.dart';
import 'package:aadhar_card_loan_guide/models/bank_info_response.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';

class BankDetailPage extends StatefulWidget {
  final BankInfoData bankInfoData;

  BankDetailPage({required this.bankInfoData});
  @override
  State<StatefulWidget> createState() => BankDetailPageState();
}

class BankDetailPageState extends State<BankDetailPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Stack(
          children: [
            Column(
              children: [
                Utils.customAppBar(color: HexColor("#60B357"), text: widget.bankInfoData.name!.toUpperCase(), textColor: Colors.black, context: context),
               const Gap(22),
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Image.asset("assets/images/backDetail.png"),
                            ),
                            Column(
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: const Color(0XFF1E3D73)),
                                      borderRadius: const BorderRadius.all(Radius.circular(7)),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          const Text(
                                            "Bank Balance",
                                            style: TextStyle(fontSize: 17),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 12.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets.all(8),
                                                  decoration: const BoxDecoration(
                                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                                    color: Color(0XFFC4F4E8),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      const Icon(
                                                        FontAwesomeIcons.buildingColumns,
                                                        size: 18,
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(left: 8.0),
                                                        child: Text(
                                                          widget.bankInfoData.balance!,
                                                          style: const TextStyle(fontSize: 15),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  children: const [
                                                    Icon(
                                                      Icons.file_copy,
                                                      size: 22,
                                                      color: Colors.black,
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(left: 12.0),
                                                      child: Icon(
                                                        Icons.share,
                                                        size: 22,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: const Color(0XFF1E3D73)),
                                        borderRadius: const BorderRadius.all(Radius.circular(7)),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            const Text(
                                              "Mini Statement",
                                              style: TextStyle(fontSize: 17),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 12.0),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Container(
                                                    padding: const EdgeInsets.all(8),
                                                    decoration: const BoxDecoration(
                                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                                      color: Color(0XFFC4F4E8),
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        const Icon(
                                                          Icons.receipt_long_outlined,
                                                          size: 18,
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 8.0),
                                                          child: Text(
                                                            widget.bankInfoData.statement!,
                                                            style: const TextStyle(fontSize: 15),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Row(
                                                    children: const [
                                                      Icon(
                                                        Icons.file_copy,
                                                        size: 22,
                                                        color: Colors.black,
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(left: 12.0),
                                                        child: Icon(
                                                          Icons.share,
                                                          size: 22,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: const Color(0XFF1E3D73)),
                                        borderRadius: const BorderRadius.all(Radius.circular(7)),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            const Text(
                                              "Customer Care Number",
                                              style: TextStyle(fontSize: 17),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 12.0),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Container(
                                                    padding: const EdgeInsets.all(8),
                                                    decoration: const BoxDecoration(
                                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                                      color: Color(0XFFC4F4E8),
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        const Icon(
                                                          Icons.call,
                                                          size: 18,
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 8.0),
                                                          child: Text(
                                                            widget.bankInfoData.customerCareNumber!,
                                                            style: const TextStyle(fontSize: 15),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Row(
                                                    children: const [
                                                      Icon(
                                                        Icons.file_copy,
                                                        size: 22,
                                                        color: Colors.black,
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(left: 12.0),
                                                        child: Icon(
                                                          Icons.share,
                                                          size: 22,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      )),
                                )
                              ],
                            )
                          ],
                        )))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
