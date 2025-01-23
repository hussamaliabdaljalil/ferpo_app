import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_style.dart';

class MainButton extends StatelessWidget {
  MainButton(
      {this.minWidth = double.infinity,
        required this.text,
        required this.onPressed});

  final double minWidth;
  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        onPressed();
      },
      color: AppColors.primaryColor,
      child: Text(
        text,
        style: AppTextStyle.f16W500White,
      ),
      minWidth: minWidth,
      height: 50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}