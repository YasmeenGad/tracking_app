import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:location/location.dart';
import 'package:flowery_delivery/core/styles/colors/my_colors.dart';
import 'package:flowery_delivery/di/di.dart';
import 'package:flowery_delivery/features/order_details/presentation/viewModel/order_details_view_model_cubit.dart';
import 'package:flowery_delivery/features/pick%20up%20location/presentation/widgets/delivery_location.dart';
import '../../../../core/utils/widgets/base/snack_bar.dart';
import '../../data/models/address_details_model.dart';
import '../viewModel/update_driver_location_view_model.dart';
import '../widgets/custom_address_details.dart';

class LocationView extends StatefulWidget {
  final AddressDetailsModel? addressDetailsModel;

  const LocationView({super.key, this.addressDetailsModel});

  @override
  _LocationViewState createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  final MapController mapController = MapController();
  late final OrderDetailsViewModelCubit viewModel;
  late final UpdateDriverLocationViewModel locationViewModel;

  @override
  void initState() {
    super.initState();
    viewModel = getIt<OrderDetailsViewModelCubit>();
    locationViewModel = UpdateDriverLocationViewModel(viewModel);
    locationViewModel.getCurrentLocation(widget.addressDetailsModel);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => locationViewModel),
        BlocProvider(create: (context) => viewModel),
      ],
      child: Stack(
        children: [
          BlocListener<OrderDetailsViewModelCubit, OrderDetailsViewModelState>(
            listener: (context, state) {
              if (state is UpdateLocationSuccess) {
                debugPrint("location updated");
              } else if (state is UpdateLocationError) {
                debugPrint(state.errorMessage);
                aweSnackBar(
                  context: context,
                  title: "Error",
                  msg: state.errorMessage,
                  type: MessageTypeConst.failure,
                );
              }
            },
            child: Consumer<UpdateDriverLocationViewModel>(
              builder: (context, state, child) {
                return Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: state.currentLocation == null
                          ? Center(
                              child: SpinKitThreeInOut(
                                color: MyColors.baseColor,
                          size: 40.0,
                              ),
                            )
                          : FlutterMap(
                              mapController: mapController,
                              options: MapOptions(
                                initialCenter: LatLng(
                                  state.currentLocation!.latitude!,
                                  state.currentLocation!.longitude!,
                                ),
                                initialZoom: 15.0,
                              ),
                              children: [
                                TileLayer(
                                  urlTemplate:
                                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                                  subdomains: const ['a', 'b', 'c'],
                                ),
                                MarkerLayer(
                                  markers: [
                                    Marker(
                                      width: 115,
                                      height: 35,
                                      point: LatLng(
                                        state.currentLocation!.latitude!,
                                        state.currentLocation!.longitude!,
                                      ),
                                      child: const DeliveryLocation(),
                                    ),
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
                );
              },
            ),
          ),
          Positioned(
            top: 40.h,
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
