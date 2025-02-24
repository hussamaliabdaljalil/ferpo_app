import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/app_colors.dart';

class ArrowBackWidget extends StatelessWidget {
  const ArrowBackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.textFieldColor,
          borderRadius: BorderRadius.circular(20),
        ),
        height: 40,
        width: 40,
        alignment: Alignment.center,
        child: SvgPicture.asset(
            'assets/images/svg/back_arrow_icon.svg' /*AppImages.backArrowIcon*/),
      ),
    );
  }
}
