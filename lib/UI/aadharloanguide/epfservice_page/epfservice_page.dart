import 'package:aadhar_card_loan_guide/UI/aadharloanguide/epfservice_page/epfservice_details_page.dart';
import 'package:aadhar_card_loan_guide/UI/aadharloanguide/epfservice_page/epfservice_presenter.dart';
import 'package:aadhar_card_loan_guide/Utils/navigation/navigation_service.dart';
import 'package:aadhar_card_loan_guide/Utils/navigation/routes.dart';
import 'package:aadhar_card_loan_guide/Utils/utils.dart';
import 'package:aadhar_card_loan_guide/models/epf_service_response.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';

class EPFServicePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => EPFServicePageState();
}

class EPFServicePageState extends State<EPFServicePage> implements EPFServiceInterface {
  var isLoading = false;
  List<EPFServiceData> ePFServiceDataLists = [];
  late EPFServicePresenter ePFServicePresenter;

  @override
  void initState() {
    super.initState();
    ePFServicePresenter = EPFServicePresenter(this);
    setState(() {
      isLoading = true;
    });
    ePFServicePresenter.doEPFServiceData();
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
                Gap(22),
                Expanded(
                    child: ListView.builder(
                        itemCount: ePFServiceDataLists.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              NavigationService.push(Routes.epfServiceDetailsPage,
                                  arguments: EPFServiceDetailsPage(
                                    ePFServiceData: ePFServiceDataLists[index],
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
                                child: Row(
                                  children: [
                                    Text(
                                      ePFServiceDataLists[index].question.toString(),
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(color: Colors.white, fontSize: 18),
                                    ),
                                  ],
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
  onSuccess(EPFServiceResponse ePFServiceResponse) {
    setState(() {
      isLoading = false;
      ePFServiceDataLists.addAll(ePFServiceResponse.data!);
    });
  }
}
