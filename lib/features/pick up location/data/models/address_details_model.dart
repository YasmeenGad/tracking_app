import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';

class AddressDetailsModel {
  final String userTitle;
  final String userName;
  final String userAddress;
  final String userImage;
  final String userPhone;

  final String pickupTitle;
  final String pickupName;
  final String pickupAddress;
  final String pickupImage;
  final String pickupPhone;

  final bool isPickup;

  final String orderId;
  final String userId;
  final LatLng storeLocation;
  final Location userLocation;

  AddressDetailsModel({
    required this.userLocation,
    required this.storeLocation,
    required this.userId,
    required this.orderId,
    required this.isPickup,
    required this.userTitle,
    required this.userName,
    required this.userAddress,
    required this.userImage,
    required this.userPhone,
    required this.pickupTitle,
    required this.pickupName,
    required this.pickupAddress,
    required this.pickupImage,
    required this.pickupPhone,
  });
}
