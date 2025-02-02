class ApplyResponseEntity {
  final String? message;
  final ApplyResponseEntityDriver? driver;
  final String? token;

  ApplyResponseEntity({this.message, this.driver, this.token});
}

class ApplyResponseEntityDriver {
  final String? country;
  final String? firstName;
  final String? lastName;
  final String? vehicleType;
  final String? vehicleNumber;
  final String? vehicleLicense;
  final String? nID;
  final String? nIDImg;
  final String? email;
  final String? gender;
  final String? phone;
  final String? photo;
  final String? id;
  final String? createdAt;

  ApplyResponseEntityDriver(
      {this.country,
      this.firstName,
      this.lastName,
      this.vehicleType,
      this.vehicleNumber,
      this.vehicleLicense,
      this.nID,
      this.nIDImg,
      this.email,
      this.gender,
      this.phone,
      this.photo,
      this.id,
      this.createdAt});
}
