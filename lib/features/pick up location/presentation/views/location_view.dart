import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';

import '../../../../generated/assets.dart';
import '../../../order_details/presentation/widgets/address_section.dart';
import '../widgets/custom_address_details.dart';

class LocationView extends StatelessWidget {
  final LatLng? selectedLocation; // Pass this from the parent widget

  const LocationView({super.key, this.selectedLocation});

  @override
  Widget build(BuildContext context) {
    return Column(
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
                                // Use MyColors.baseColor if available
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
          child: CustomAddressDetails(),
        ),
      ],
    );
  }
}
