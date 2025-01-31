import 'dart:io';
import 'package:injectable/injectable.dart';
import '../../../../core/networking/common/api_result.dart';
import '../entities/request/change_password_request_entity.dart';
import '../entities/response/change_password_response_entity.dart';
import '../entities/response/edit_profile_response_entity.dart';
import '../entities/response/get_all_vehicles_entity.dart';
import '../entities/response/get_logged_user_driver_response_entity.dart';
import '../entities/response/upload_photo_response_entity.dart';
import '../repositories/profile_repo.dart';

@injectable
class ProfileUseCase {
  final ProfileRepo _repository;

  @factoryMethod
  ProfileUseCase(this._repository);

  Future<DataResult<GetLoggedDriverDataResponseEntity>> getProfileData() =>
      _repository.getProfileData();

  Future<DataResult<EditProfileResponseEntity>> editProfile(
          Map<String, dynamic> profileData) =>
      _repository.editProfile(profileData);

  Future<DataResult<UploadPhotoResponseEntity>> uploadPhoto(File photo) =>
      _repository.uploadPhoto(photo);
  Future<DataResult<ChangePasswordResponseEntity>> changePassword(ChangePasswordRequestEntity request) =>
      _repository.changePassword( request);
  Future<DataResult<GetAllVehiclesEntity>> getAllVehicles() => _repository.getAllVehicles();
}
