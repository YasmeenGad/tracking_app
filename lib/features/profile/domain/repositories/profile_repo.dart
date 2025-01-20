import 'dart:io';


import '../../../../core/networking/common/api_result.dart';
import '../entities/request/change_password_request_entity.dart';
import '../entities/response/change_password_response_entity.dart';
import '../entities/response/edit_profile_response_entity.dart';
import '../entities/response/get_all_vehicles_entity.dart';
import '../entities/response/get_logged_user_driver_response_entity.dart';
import '../entities/response/upload_photo_response_entity.dart';

abstract class ProfileRepo {
  Future<DataResult<GetLoggedDriverDataResponseEntity>> getProfileData();

  Future<DataResult<EditProfileResponseEntity>> editProfile(
      Map<String, dynamic> profileData);

  Future<DataResult<UploadPhotoResponseEntity>> uploadPhoto(File photo);

  Future<DataResult<ChangePasswordResponseEntity>> changePassword(
      ChangePasswordRequestEntity request);
  Future<DataResult<GetAllVehiclesEntity>> getAllVehicles();
}
