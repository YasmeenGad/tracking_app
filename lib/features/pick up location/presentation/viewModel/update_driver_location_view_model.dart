import 'package:flutter/material.dart';
import 'package:location/location.dart';
import '../../../order_details/data/models/order_details_model.dart';
import '../../../order_details/presentation/viewModel/order_details_actions.dart';
import '../../../order_details/presentation/viewModel/order_details_view_model_cubit.dart';
import '../../data/models/address_details_model.dart';

class UpdateDriverLocationViewModel with ChangeNotifier {
  final OrderDetailsViewModelCubit viewModel;
  LocationData? currentLocation;
  final Location location = Location();

  UpdateDriverLocationViewModel(this.viewModel);

  Future<void> getCurrentLocation(
      AddressDetailsModel addressDetailsModel) async {
    try {
      var userLocation = await location.getLocation();
      currentLocation = userLocation;
      notifyListeners();

      _updateLocation(addressDetailsModel, userLocation);

      location.onLocationChanged.listen((LocationData newLocation) {
        currentLocation = newLocation;
        notifyListeners();
        _updateLocation(addressDetailsModel, newLocation);
      });
    } catch (e) {
      currentLocation = null;
      notifyListeners();
    }
  }

  void _updateLocation(
      AddressDetailsModel addressDetailsModel, LocationData locationData) {
    viewModel.doAction(UpdateLocation(
      userId: addressDetailsModel.userId,
      orderId: addressDetailsModel.orderId,
      location: LocationModel(
        latitude: locationData.latitude,
        longitude: locationData.longitude,
      ),
    ));
  }
}
