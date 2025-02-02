import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flowery_delivery/core/styles/fonts/my_fonts.dart';
import 'package:flowery_delivery/core/styles/colors/my_colors.dart';
import 'package:flowery_delivery/core/utils/widgets/spacing.dart';

class ApplyHeader extends StatelessWidget {
  const ApplyHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpacing(24.h),
        AutoSizeText(
          "Welcome!!",
          style: MyFonts.styleMedium500_20.copyWith(color: MyColors.blackBase),
        ),
        verticalSpacing(8.h),
        AutoSizeText(
          """You want to be a delivery man?\nJoin our team """,
          style: MyFonts.styleMedium500_16.copyWith(color: MyColors.gray),
        ),
        verticalSpacing(24.h),
      ],
    );
  }
}
