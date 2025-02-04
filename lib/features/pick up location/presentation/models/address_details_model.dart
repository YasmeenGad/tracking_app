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

  AddressDetailsModel({
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
