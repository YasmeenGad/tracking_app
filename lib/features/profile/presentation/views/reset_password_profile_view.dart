import 'package:flutter/material.dart';
import 'package:flowery_delivery/core/utils/extension/media_query_values.dart';
import '../../../../core/localization/lang_keys.dart';
import '../../../../core/utils/widgets/base/base_view.dart';
import '../../../../core/utils/widgets/base/custom_app_bar.dart';
import '../widgets/section_reset_password_form.dart';
class ResetPasswordProfileView extends StatelessWidget {
  const ResetPasswordProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomAppBar(
                  appBarTxt: context.translate(LangKeys.resetPassword),
                  showArrow: true,
                ),
                const SizedBox(
                  height: 34,
                ),
                const SectionResetPasswordForm(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
