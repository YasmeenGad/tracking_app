import 'package:auto_size_text/auto_size_text.dart';
import 'package:flowery_delivery/core/styles/fonts/my_fonts.dart';
import 'package:flowery_delivery/core/utils/extension/media_query_values.dart';
import 'package:flutter/material.dart';

import '../../../../core/localization/lang_keys.dart';

class CustomTextHeader extends StatelessWidget {
  const CustomTextHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(context.translate(LangKeys.myOrders),
            style:MyFonts.styleMedium500_20),
        AutoSizeText(context.translate(LangKeys.recentOrders),
            style:MyFonts.styleMedium500_20),
      ],
    );
  }
}
