import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/assets.dart';
import '../../../order_details/presentation/widgets/address_section.dart';

class LocationView extends StatelessWidget {
  const LocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 2, child: Container()),
        Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
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
                    child: SizedBox(
                      height: 16.h,
                    ),
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
            ))
      ],
    );
  }
}
