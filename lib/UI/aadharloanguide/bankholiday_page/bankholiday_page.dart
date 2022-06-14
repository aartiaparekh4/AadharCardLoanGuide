import 'package:aadhar_card_loan_guide/UI/aadharloanguide/bankholiday_page/bankholiday_presenter.dart';
import 'package:aadhar_card_loan_guide/Utils/utils.dart';
import 'package:aadhar_card_loan_guide/models/bank_holiday_response.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

class BankHolidayPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BankHolidayPageState();
}

class BankHolidayPageState extends State<BankHolidayPage> implements BankHolidayInterface {
  var isLoading = false;
  List<BankHolidayData> bankHolidayDataLists = [];
  late BankHolidayPresenter bankHolidayPresenter;
  final TextStyle _textStyleDate = const TextStyle(fontSize: 17, color: Color(0XFFBD8763));

  @override
  void initState() {
    super.initState();
    bankHolidayPresenter = BankHolidayPresenter(this);
    setState(() {
      isLoading = true;
    });
    bankHolidayPresenter.doBankHolidayData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Stack(
          children: [
            Column(
              children: [
                Utils.customAppBar(color: HexColor("#60B357"), text: "AADHAR LOAN", textColor: Colors.black, context: context),
                Gap(22),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: ListView.builder(
                      itemCount: bankHolidayDataLists.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            DateFormat("MMMM").format(bankHolidayDataLists[index].date!),
                                            style: _textStyleDate,
                                          ),
                                          Text(
                                            bankHolidayDataLists[index].date!.day.toString().padLeft(2, "0"),
                                            style: _textStyleDate,
                                          ),
                                          Text(
                                            bankHolidayDataLists[index].day!,
                                            style: _textStyleDate,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: (MediaQuery.of(context).size.width * 57) / 100,
                                        child: Text(bankHolidayDataLists[index].holiday!, style: const TextStyle(fontSize: 17), textAlign: TextAlign.right),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        );
                      }),
                ))
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
  onSuccess(BankHolidayResponse bankHolidayResponse) {
    setState(() {
      isLoading = false;
      bankHolidayDataLists.addAll(bankHolidayResponse.data!);
    });
  }
}
