import 'package:flowery_delivery/core/styles/colors/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/assets.dart';
import '../../../order_details/presentation/widgets/address_section.dart';

class CustomAddressDetails extends StatelessWidget {
  const CustomAddressDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Container(
            height: 4.h,
            width: 65.w,
            margin: EdgeInsets.symmetric(vertical: 8.h),
            decoration: BoxDecoration(
              color: MyColors.baseColor,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: AddressSection(
                    title: 'Pickup address',
                    name: "Flowery Store",
                    address: "20, Sheikh Zayed St, Cairo, Egypt",
                    image: Assets.imagesFloweryLogo,
                    phone: "01095932819",
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(height: 16.h),
                ),
                SliverToBoxAdapter(
                  child: AddressSection(
                    title: 'User address',
                    name: "Yasmeen Gad",
                    address: "20, Sheikh Zayed St, Cairo, Egypt",
                    image: Assets.imagesFloweryLogo,
                    phone: "01095932819",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// دالة لعرض الـ Bottom Sheet القابل للسحب
void showCustomAddressBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    // يسمح بالتحكم في الارتفاع
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.3,
        // الارتفاع المبدئي (30% من الشاشة)
        minChildSize: 0.2,
        // أقل ارتفاع (20% من الشاشة)
        maxChildSize: 0.8,
        // أكبر ارتفاع (80% من الشاشة)
        expand: false,
        // لا يجبره على التمدد بالكامل
        builder: (context, scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: const CustomAddressDetails(),
          );
        },
      );
    },
  );
}
