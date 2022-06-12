import '../app_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color borderColor;
  final double borderRedius;
  final TextStyle? textStyle;
  final bool expansed;
  final double height;
  final double? width;
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color = AppColors.white,
    this.borderColor = AppColors.grey,
    this.borderRedius = 0.0,
    this.textStyle,
    this.expansed = false,
    this.height = 40,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: expansed ? double.infinity : width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: borderColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(borderRedius),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: textStyle ?? Theme.of(context).textTheme.button,
        ),
      ),
    );
  }
}
