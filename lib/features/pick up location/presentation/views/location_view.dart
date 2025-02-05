import 'package:flowery_delivery/core/styles/colors/my_colors.dart';
import 'package:flowery_delivery/di/di.dart';
import 'package:flowery_delivery/features/order_details/data/models/order_details_model.dart';
import 'package:flowery_delivery/features/order_details/presentation/viewModel/order_details_actions.dart';
import 'package:flowery_delivery/features/pick%20up%20location/presentation/widgets/delivery_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

import '../../../../core/utils/widgets/base/snack_bar.dart';
import '../../../order_details/presentation/viewModel/order_details_view_model_cubit.dart';
import '../../data/models/address_details_model.dart';
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
  late final OrderDetailsViewModelCubit viewModel;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    viewModel = getIt<OrderDetailsViewModelCubit>();
  }

  Future<void> _getCurrentLocation() async {
    var location = Location();

    try {
      var userLocation = await location.getLocation();
      setState(() {
        currentLocation = userLocation;
      });
      viewModel.doAction(UpdateLocation(
        userId: widget.addressDetailsModel!.userId,
        orderId: widget.addressDetailsModel!.orderId,
        location: LocationModel(
          latitude: userLocation.latitude,
          longitude: userLocation.longitude,
        ),
      ));
    } on Exception {
      currentLocation = null;
    }

    location.onLocationChanged.listen((LocationData newLocation) {
      setState(() {
        currentLocation = newLocation;
      });
      viewModel.doAction(UpdateLocation(
        userId: widget.addressDetailsModel!.userId,
        orderId: widget.addressDetailsModel!.orderId,
        location: LocationModel(
          latitude: newLocation.latitude,
          longitude: newLocation.longitude,
        ),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Stack(
        children: [
          BlocListener<OrderDetailsViewModelCubit, OrderDetailsViewModelState>(
            listener: (context, state) {
              switch (state) {
                case UpdateLocationSuccess():
                  debugPrint("location updated");
                case UpdateLocationError():
                  debugPrint(state.errorMessage);
                  return aweSnackBar(
                    context: context,
                    title: "Error",
                    msg: state.errorMessage,
                    type: MessageTypeConst.failure,
                  );

                default:
                  null;
              }
            },
            child: Column(
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
          ),
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
      ),
    );
  }
}
