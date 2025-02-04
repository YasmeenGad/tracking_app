import '../../domain/entities/response/apply_response_entity.dart';
import '../models/response/apply_response_dto.dart';

class ApplyDriverMapper {
  static ApplyResponseEntity toEntity(ApplyResponseDto dto) {
    return ApplyResponseEntity(
      message: dto.message,
      driver: dto.driver != null ? toEntityDriver(dto.driver!) : null,
      token: dto.token,
    );
  }

  static ApplyResponseEntityDriver toEntityDriver(ApplyResponseDtoDriver dto) {
    return ApplyResponseEntityDriver(
      country: dto.country,
      firstName: dto.firstName,
      lastName: dto.lastName,
      vehicleType: dto.vehicleType,
      vehicleNumber: dto.vehicleNumber,
      vehicleLicense: dto.vehicleLicense,
      nID: dto.nID,
      nIDImg: dto.nIDImg,
      email: dto.email,
      gender: dto.gender,
      phone: dto.phone,
      photo: dto.photo,
      id: dto.id,
      createdAt: dto.createdAt,
    );
  }
}
