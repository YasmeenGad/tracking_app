import 'package:flowery_delivery/core/utils/widgets/base/base_view.dart';
import 'package:flutter/material.dart';
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
      ]),
    );
  }
}
