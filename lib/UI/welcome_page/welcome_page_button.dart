import 'package:flutter/material.dart';

import '../../Utils/app_colors.dart';
import '../../Utils/app_constant/app_images.dart';

class WelcomePageButton extends StatelessWidget {
  final AppImageBuilder icon;
  final VoidCallback onPressed;
  final Color backgroundColor;

  const WelcomePageButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: icon.widget(),
        ),
      ),
    );
  }
}
