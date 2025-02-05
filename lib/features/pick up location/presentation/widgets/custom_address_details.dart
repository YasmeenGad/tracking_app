import 'package:flowery_delivery/core/styles/colors/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../order_details/presentation/widgets/address_section.dart';
import '../../data/models/address_details_model.dart';

class CustomAddressDetails extends StatelessWidget {
  const CustomAddressDetails({super.key, required this.addressDetailsModel});

  final AddressDetailsModel? addressDetailsModel;

  @override
  Widget build(BuildContext context) {
    bool isPickup = addressDetailsModel?.isPickup == true;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Container(
            height: 4.h,
            width: 65.w,
            margin: EdgeInsets.symmetric(vertical: 8.h),
            decoration: BoxDecoration(
              color: MyColors.baseColor,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                // Show Pickup Address First if Pickup is true, otherwise show User Address First
                SliverToBoxAdapter(
                  child: isPickup
                      ? AddressSection(
                          title: addressDetailsModel?.pickupTitle ?? "",
                          name: addressDetailsModel?.pickupName ?? "",
                          address: addressDetailsModel?.pickupAddress ?? "",
                          image: addressDetailsModel?.pickupImage ?? "",
                          phone: addressDetailsModel?.pickupPhone ?? "",
                        )
                      : AddressSection(
                          title: addressDetailsModel?.userTitle ?? "",
                          name: addressDetailsModel?.userName ?? "",
                          address: addressDetailsModel?.userAddress ?? "",
                          image: addressDetailsModel?.userImage ?? "",
                          phone: addressDetailsModel?.userPhone ?? "",
                        ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 16.h)),

                // Show the other address
                SliverToBoxAdapter(
                  child: isPickup
                      ? AddressSection(
                          title: addressDetailsModel?.userTitle ?? "",
                          name: addressDetailsModel?.userName ?? "",
                          address: addressDetailsModel?.userAddress ?? "",
                          image: addressDetailsModel?.userImage ?? "",
                          phone: addressDetailsModel?.userPhone ?? "",
                        )
                      : AddressSection(
                          title: addressDetailsModel?.pickupTitle ?? "",
                          name: addressDetailsModel?.pickupName ?? "",
                          address: addressDetailsModel?.pickupAddress ?? "",
                          image: addressDetailsModel?.pickupImage ?? "",
                          phone: addressDetailsModel?.pickupPhone ?? "",
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
