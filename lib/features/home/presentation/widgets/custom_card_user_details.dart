import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/styles/fonts/my_fonts.dart';
import '../../../../core/utils/widgets/spacing.dart';

class CustomCardAddressDetails extends StatelessWidget {
  const CustomCardAddressDetails({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
  });

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
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: CachedNetworkImage(
                imageUrl: image,
                width: 44.w,
                height: 44.h,
                fit: BoxFit.cover,
                placeholder: (context, url) => Center(
                  child: SpinKitWave(
                    color: MyColors.baseColor,
                    size: 30.w,
                  ),
                ),
                errorWidget: (context, url, error) => Icon(
                  Icons.error,
                  size: 44.w,
                  color: MyColors.gray,
                ),
              ),
            ),
            horizontalSpacing(8.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: MyFonts.styleRegular400_13.copyWith(
                      color: MyColors.gray,
                    ),
                  ),
                  verticalSpacing(4.h),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 16.sp,
                        color: MyColors.gray,
                      ),
                      horizontalSpacing(4.w),
                      Flexible(
                        child: AutoSizeText(
                          subtitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: MyFonts.styleRegular400_13.copyWith(
                            color: MyColors.blackBase,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
