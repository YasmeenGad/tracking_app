import 'package:auto_size_text/auto_size_text.dart';
import 'package:flowery_delivery/core/utils/extension/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/localization/lang_keys.dart';
import '../../../../core/styles/colors/my_colors.dart';

class CustomTextHeader extends StatelessWidget {
  const CustomTextHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(context.translate(LangKeys.floweryRider),
        style: GoogleFonts.imFellEnglish(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: MyColors.baseColor,
        ));
  }
}
