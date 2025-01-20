import 'package:flutter/material.dart';
import 'package:flowery_delivery/core/utils/extension/media_query_values.dart';

import '../../../../../core/localization/lang_keys.dart';
import '../../../../../core/styles/colors/my_colors.dart';
import '../../../../../core/utils/widgets/custom_appbar.dart';
import '../../../../../core/utils/widgets/spacing.dart';
import '../widgets/signup_form.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: customAppBar(
          appBarTxt:context.translate(LangKeys.signUp),
          context: context,
          showArrow: true,
          navigation: () {
            return ;
          }),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                  child: verticalSpacing(
                15,
              )),
              const SliverToBoxAdapter(
                child: SignUpForm(),
              )
            ],
          )),
    );
  }
}
