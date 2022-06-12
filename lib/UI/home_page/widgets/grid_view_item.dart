import 'package:flutter/material.dart';

import '../../../Utils/app_colors.dart';
import '../../../Utils/app_text_style.dart';

class GriedViewItem extends StatelessWidget {
  final Widget icon;
  final Widget backgroundImage;
  final String title;
  final Color backgroundColor;
  const GriedViewItem({
    Key? key,
    required this.icon,
    required this.backgroundImage,
    required this.title,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width / 3.2,
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(7),
        // image: DecorationImage(
        //   image: backgroundImage.image,
        //   fit: BoxFit.cover,
        // ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon,
          Text(
            title,
            style: AppTextStyle.styleWhite17W500,
          ),
        ],
      ),
    );
  }
}
