import 'package:flowery_delivery/core/styles/fonts/my_fonts.dart';
import 'package:flowery_delivery/core/utils/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DriverOrderStatusHeader extends StatelessWidget {
  final String count, icon, state;

  const DriverOrderStatusHeader(
      {super.key,
      required this.count,
      required this.icon,
      required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.pink.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(count, style: MyFonts.styleMedium500_18),
          verticalSpacing(8),
          Row(
            children: [
              SvgPicture.asset(icon,width: 24.w,height: 24.h),
              horizontalSpacing(5),
              Text(state, style: MyFonts.styleMedium500_16),
            ],
          ),
        ],
      ),
    );
  }
}
