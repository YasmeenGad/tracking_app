import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flowery_delivery/core/styles/colors/my_colors.dart';
import 'package:flowery_delivery/core/styles/fonts/my_fonts.dart';
import 'package:flowery_delivery/core/utils/widgets/spacing.dart';
import 'package:flowery_delivery/generated/assets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'login_button.dart';

class SubmissionHeader extends StatelessWidget {
  const SubmissionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            Assets.imagesCheckCircle,
            height: 160.h,
            width: 160.w,
          ),
          verticalSpacing(24.h),
          Text(
            "Your application has been submitted!",
            textAlign: TextAlign.center,
            style: MyFonts.styleSemiBold600_18.copyWith(
              color: MyColors.blackBase,
            ),
          ),
          verticalSpacing(16.h),
          Text(
            'Thank you for providing your application. We will review your application and get back to you soon.',
            textAlign: TextAlign.center,
            style: MyFonts.styleRegular400_16.copyWith(
              color: MyColors.gray,
            ),
          ),
          verticalSpacing(24.h),
          const LoginButton(),
        ],
      ),
    );
  }
}
