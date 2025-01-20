import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flowery_delivery/core/utils/extension/media_query_values.dart';

import '../../../../core/localization/lang_keys.dart';
import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/styles/fonts/my_fonts.dart';
import '../../../../generated/assets.dart';
class CustomSwitchIcon extends StatefulWidget {
  const CustomSwitchIcon({super.key});

  @override
  State<CustomSwitchIcon> createState() => _CustomSwitchIconState();
}

class _CustomSwitchIconState extends State<CustomSwitchIcon> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      margin: EdgeInsets.all(12.sp),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isSwitched = !isSwitched;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 60.w,
              height: 30.h,
              padding: EdgeInsets.symmetric(horizontal: 4.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.sp),
                color: isSwitched ? MyColors.baseColor : Colors.grey,
              ),
              child: AnimatedAlign(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                alignment: isSwitched ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  width: 22.w,
                  height: 22.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: MyColors.whiteBase,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 4.sp,
          ),
          Text(
          context.translate(LangKeys.notification),
            style: MyFonts.styleRegular400_16.copyWith(
              color: MyColors.blackBase,
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {},
            child: Container(
                margin: EdgeInsets.only(right: 23.sp),
                width: 20.w,
                height: 20.w,
                child: Image.asset(
                  Assets.imagesDropDownArrow,
                )),
          ),
        ],
      ),
    );
  }
}
