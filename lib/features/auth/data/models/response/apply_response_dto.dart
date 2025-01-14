import 'package:json_annotation/json_annotation.dart';

part 'apply_response_dto.g.dart';

@JsonSerializable()
class ApplyResponseDto {
  final String? message;
  final ApplyResponseDtoDriver? driver;
  final String? token;

  ApplyResponseDto(this.message, this.driver, this.token);

  factory ApplyResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ApplyResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ApplyResponseDtoToJson(this);
}

@JsonSerializable()
class ApplyResponseDtoDriver {
  final String? country;
  final String? firstName;
  final String? lastName;
  final String? vehicleType;
  final String? vehicleNumber;
  final String? vehicleLicense;
  @JsonKey(name: 'NID')
  final String? NID;
  @JsonKey(name: 'NIDImg')
  final String? NIDImg;
  final String? email;
  final String? gender;
  final String? phone;
  final String? photo;
  @JsonKey(name: '_id')
  final String? id;
  final String? createdAt;

  ApplyResponseDtoDriver(
      this.country,
      this.firstName,
      this.lastName,
      this.vehicleType,
      this.vehicleNumber,
      this.vehicleLicense,
      this.NID,
      this.NIDImg,
      this.email,
      this.gender,
      this.phone,
      this.photo,
      this.id,
      this.createdAt);

  factory ApplyResponseDtoDriver.fromJson(Map<String, dynamic> json) =>
      _$ApplyResponseDtoDriverFromJson(json);

  Map<String, dynamic> toJson() => _$ApplyResponseDtoDriverToJson(this);
}
