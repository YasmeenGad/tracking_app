import 'package:auto_size_text/auto_size_text.dart';
import 'package:flowery_delivery/core/localization/lang_keys.dart';
import 'package:flowery_delivery/core/styles/colors/my_colors.dart';
import 'package:flowery_delivery/core/styles/fonts/my_fonts.dart';
import 'package:flowery_delivery/core/utils/extension/media_query_values.dart';
import 'package:flowery_delivery/core/utils/widgets/spacing.dart';
import 'package:flowery_delivery/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DriverOrderStateWidget extends StatelessWidget {
  final String state;
  final String orderNumber;

  const DriverOrderStateWidget({
    super.key,
    required this.state,
    required this.orderNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        state == 'completed'
            ? Row(
                children: [
                  SvgPicture.asset(Assets.imagesCircleComplete,
                      width: 24.w, height: 24.h),
                  horizontalSpacing(5),
                  AutoSizeText(context.translate(LangKeys.completed),
                      style: MyFonts.styleMedium500_16
                          .copyWith(color: MyColors.green)),
                ],
              )
            : state == 'canceled'
                ? Row(
                    children: [
                      SvgPicture.asset(Assets.imagesCircleCancel,
                          width: 24.w, height: 24.h),
                      horizontalSpacing(5),
                      AutoSizeText(context.translate(LangKeys.cancelled),
                          style: MyFonts.styleMedium500_16
                              .copyWith(color: MyColors.red)),
                    ],
                  )
                : Row(
          children: [
            SvgPicture.asset(Assets.imagesProcess,
                width: 24.w, height: 24.h),
            horizontalSpacing(5),
            AutoSizeText(context.translate(LangKeys.inProgress),
                style: MyFonts.styleMedium500_16
                    .copyWith(color: MyColors.blue)),
          ],
        ),
        AutoSizeText(orderNumber, style: MyFonts.styleSemiBold600_16),
      ],
    );
  }
}
