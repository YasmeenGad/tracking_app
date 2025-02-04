import 'package:flowery_delivery/core/styles/colors/my_colors.dart';
import 'package:flowery_delivery/features/pick%20up%20location/presentation/models/address_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';

import '../widgets/custom_address_details.dart';

class LocationView extends StatelessWidget {
  final LatLng? selectedLocation;
  final AddressDetailsModel? addressDetailsModel;

  const LocationView({
    super.key,
    this.selectedLocation,
    this.addressDetailsModel,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              flex: 2,
              child: FlutterMap(
                options: MapOptions(
                  initialCenter: LatLng(37.42796133580664, -122.085749655962),
                  initialZoom: 12.0,
                  onTap: (tapPosition, point) {
                    debugPrint("Tapped at: $point");
                  },
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: const ['a', 'b', 'c'],
                  ),
                  if (selectedLocation != null)
                    MarkerLayer(
                      markers: [
                        Marker(
                          width: 80.w,
                          height: 80.h,
                          point: selectedLocation!,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOut,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 45.w,
                                  height: 45.h,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blue.withOpacity(0.3),
                                  ),
                                ),
                                Container(
                                  width: 22.w,
                                  height: 22.h,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.red,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.blue.withOpacity(0.6),
                                        blurRadius: 8,
                                        spreadRadius: 2,
                                      ),
                                    ],
                                  ),
                                  child: const Icon(
                                    Icons.location_on,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: CustomAddressDetails(
                  addressDetailsModel: addressDetailsModel),
            ),
          ],
        ),

        // **🔹 Back Button (Positioned in Top Left)**
        Positioned(
          top: 40.h, // Adjust for padding
          left: 16.w,
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: MyColors.baseColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.3),
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: MyColors.white,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
