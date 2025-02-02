// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apply_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplyRequestDto _$ApplyRequestDtoFromJson(Map<String, dynamic> json) =>
    ApplyRequestDto(
      json['country'] as String?,
      json['firstName'] as String?,
      json['lastName'] as String?,
      json['vehicleType'] as String?,
      json['vehicleNumber'] as String?,
      json['vehicleLicense'] as String?,
      json['NID'] as String?,
      json['NIDImg'] as String?,
      json['email'] as String?,
      json['password'] as String?,
      json['rePassword'] as String?,
      json['gender'] as String?,
      json['phone'] as String?,
    );

Map<String, dynamic> _$ApplyRequestDtoToJson(ApplyRequestDto instance) =>
    <String, dynamic>{
      'country': instance.country,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'vehicleType': instance.vehicleType,
      'vehicleNumber': instance.vehicleNumber,
      'vehicleLicense': instance.vehicleLicense,
      'NID': instance.nID,
      'NIDImg': instance.nIDImg,
      'email': instance.email,
      'password': instance.password,
      'rePassword': instance.rePassword,
      'gender': instance.gender,
      'phone': instance.phone,
    };
