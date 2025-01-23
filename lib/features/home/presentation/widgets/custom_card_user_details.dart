import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/styles/fonts/my_fonts.dart';
import '../../../../core/utils/widgets/spacing.dart';

class CustomCardUserDetails extends StatelessWidget {
  const CustomCardUserDetails(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.image});

  final String title, subtitle, image;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: MyColors.white,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(image, width: 44.w, height: 44.h),
            horizontalSpacing(8.w),
            Expanded(
              child: ListTile(
                  title: AutoSizeText(
                    title,
                    style: MyFonts.styleRegular400_13
                        .copyWith(color: MyColors.gray),
                  ),
                  subtitle: Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 16.sp,
                      ),
                      horizontalSpacing(4.w),
                      AutoSizeText(
                        subtitle,
                        style: MyFonts.styleRegular400_13
                            .copyWith(color: MyColors.blackBase),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
