import 'package:aadhar_card_loan_guide/Utils/utils.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final dynamic child;
  const CustomAppBar({Key? key,this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Utils.getHeight(context),
        child: child,
    );
  }
}
