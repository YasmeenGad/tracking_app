import 'package:flutter/material.dart';
import 'package:flowery_delivery/core/utils/widgets/buttons/carved_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/widgets/spacing.dart';

class SubmitButtonWidget extends StatelessWidget {
  final VoidCallback onTap;

  const SubmitButtonWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpacing(16.h),
        CurvedButton(
          title: 'Continue',
          onTap: onTap,
        ),
        verticalSpacing(16.h),
      ],
    );
  }
}
