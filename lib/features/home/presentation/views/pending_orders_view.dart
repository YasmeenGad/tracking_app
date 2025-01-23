import 'package:auto_size_text/auto_size_text.dart';
import 'package:flowery_delivery/core/styles/fonts/my_fonts.dart';
import 'package:flowery_delivery/core/utils/widgets/base/base_view.dart';
import 'package:flowery_delivery/core/utils/widgets/spacing.dart';
import 'package:flowery_delivery/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/styles/colors/my_colors.dart';
import '../widgets/custom_card_order_details.dart';
import '../widgets/custom_text_header.dart';

class PendingOrdersView extends StatelessWidget {
  const PendingOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      child: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: CustomTextHeader(),
        ),
        SliverToBoxAdapter(
          child: verticalSpacing(29.h),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              CustomCardOrderDetails(),
            ],
          ),
        ),
      ]),
    );
  }
}
