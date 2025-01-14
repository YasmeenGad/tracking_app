// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apply_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplyResponseDto _$ApplyResponseDtoFromJson(Map<String, dynamic> json) =>
    ApplyResponseDto(
      json['message'] as String?,
      json['driver'] == null
          ? null
          : ApplyResponseDtoDriver.fromJson(
              json['driver'] as Map<String, dynamic>),
      json['token'] as String?,
    );

Map<String, dynamic> _$ApplyResponseDtoToJson(ApplyResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'driver': instance.driver,
      'token': instance.token,
    };

ApplyResponseDtoDriver _$ApplyResponseDtoDriverFromJson(
        Map<String, dynamic> json) =>
    ApplyResponseDtoDriver(
      json['country'] as String?,
      json['firstName'] as String?,
      json['lastName'] as String?,
      json['vehicleType'] as String?,
      json['vehicleNumber'] as String?,
      json['vehicleLicense'] as String?,
      json['NID'] as String?,
      json['NIDImg'] as String?,
      json['email'] as String?,
      json['gender'] as String?,
      json['phone'] as String?,
      json['photo'] as String?,
      json['_id'] as String?,
      json['createdAt'] as String?,
    );

Map<String, dynamic> _$ApplyResponseDtoDriverToJson(
        ApplyResponseDtoDriver instance) =>
    <String, dynamic>{
      'country': instance.country,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'vehicleType': instance.vehicleType,
      'vehicleNumber': instance.vehicleNumber,
      'vehicleLicense': instance.vehicleLicense,
      'NID': instance.NID,
      'NIDImg': instance.NIDImg,
      'email': instance.email,
      'gender': instance.gender,
      'phone': instance.phone,
      'photo': instance.photo,
      '_id': instance.id,
      'createdAt': instance.createdAt,
    };
