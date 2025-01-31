import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/styles/fonts/my_fonts.dart';

class CustomStatusButton extends StatelessWidget {
  const CustomStatusButton(
      {super.key,
      required this.statusTxt,
      this.containerClr,
      this.borderClr,
      this.textColor});

  final String statusTxt;
  final Color? containerClr, borderClr, textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: containerClr ?? MyColors.white,
        border: Border.all(color: borderClr ?? MyColors.baseColor),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
        child: Text(
          statusTxt,
          style: MyFonts.styleMedium500_14
              .copyWith(color: textColor ?? MyColors.baseColor),
        ),
      ),
    );
  }
}
