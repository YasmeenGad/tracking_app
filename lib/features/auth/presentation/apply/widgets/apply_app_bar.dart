import 'package:flutter/material.dart';
import 'package:flowery_delivery/core/utils/widgets/base/custom_app_bar.dart';

class ApplyAppBar extends StatelessWidget {
  const ApplyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(appBarTxt: 'Apply', showArrow: true);
  }
}
