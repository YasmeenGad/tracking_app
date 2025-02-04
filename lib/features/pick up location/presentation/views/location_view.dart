import 'package:flowery_delivery/core/styles/colors/my_colors.dart';
import 'package:flowery_delivery/features/pick%20up%20location/presentation/models/address_details_model.dart';
import 'package:flowery_delivery/features/pick%20up%20location/presentation/widgets/delivery_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

import '../widgets/custom_address_details.dart';

class LocationView extends StatefulWidget {
  final AddressDetailsModel? addressDetailsModel;

  const LocationView({
    super.key,
    this.addressDetailsModel,
  });

  @override
  _LocationViewState createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  LocationData? currentLocation;
  final MapController mapController = MapController();

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    var location = Location();

    try {
      var userLocation = await location.getLocation();
      setState(() {
        currentLocation = userLocation;
      });
    } on Exception {
      currentLocation = null;
    }

    location.onLocationChanged.listen((LocationData newLocation) {
      setState(() {
        currentLocation = newLocation;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              flex: 2,
              child: currentLocation == null
                  ? Center(
                      child: Center(
                          child: SpinKitThreeInOut(
                      color: MyColors.baseColor,
                      size: 40.0,
                    )))
                  : FlutterMap(
                      mapController: mapController,
                      options: MapOptions(
                        initialCenter: LatLng(currentLocation!.latitude!,
                            currentLocation!.longitude!),
                        initialZoom: 15.0,
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
                        MarkerLayer(
                          markers: [
                            if (currentLocation != null)
                              Marker(
                                  width: 115,
                                  height: 35,
                                  point: LatLng(currentLocation!.latitude!,
                                      currentLocation!.longitude!),
                                  child: const DeliveryLocation()),
                          ],
                        ),
                      ],
                    ),
            ),
            Expanded(
              flex: 1,
              child: CustomAddressDetails(
                addressDetailsModel: widget.addressDetailsModel,
              ),
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
                    color: Colors.black.withOpacity(0.3),
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
