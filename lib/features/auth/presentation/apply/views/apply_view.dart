import 'package:flowery_delivery/core/utils/widgets/base/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/widgets/base/base_view.dart';

class ApplyView extends StatelessWidget {
  const ApplyView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(child: CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: CustomAppBar(appBarTxt: 'Apply', showArrow: true),
        )
      ],
    ));
  }
}
