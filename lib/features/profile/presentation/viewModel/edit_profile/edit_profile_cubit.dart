import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flowery_delivery/core/networking/error/error_handler.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/networking/common/api_result.dart';
import '../../../../../core/networking/error/error_model.dart';
import '../../../../auth/data/data_sources/contracts/offline_data_source.dart';
import '../../../domain/entities/request/change_password_request_entity.dart';
import '../../../domain/entities/response/change_password_response_entity.dart';
import '../../../domain/entities/response/edit_profile_response_entity.dart';
import '../../../domain/entities/response/upload_photo_response_entity.dart';
import '../../../domain/use_cases/profile_use_case.dart';
import 'edit_profile_action.dart';

part 'edit_profile_state.dart';


@injectable
class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(this._useCase, this._offlineDataSource) : super(EditProfileInitial());
  final ProfileUseCase _useCase;
  final OfflineDataSource _offlineDataSource;
  void doAction(EditProfileActions action) {
    switch (action) {
      case EditProfile():
        _editProfile(action.profileData);
      case UploadPhoto():
        _uploadPhoto(action.photo);
      case ChangePassword():
        _changePassword(action.request);
    }
  }



  Future<void> _editProfile(Map<String, dynamic> profileData) async {
    emit(EditProfileLoading());
    final result = await _useCase.editProfile(profileData);
    switch (result) {
      case Success<EditProfileResponseEntity>():
        emit(EditProfileSuccess(data: result.data));
      case Fail<EditProfileResponseEntity>():
        emit(EditProfileError(error: ErrorHandler.handle(result.exception!)));
    }
  }

  Future<void> _uploadPhoto(File photo) async {
    emit(UploadPhotoLoading());

    final result = await _useCase.uploadPhoto(photo);
    switch (result) {
      case Success<UploadPhotoResponseEntity>():
        emit(UploadPhotoSuccess(data: result.data));
      case Fail<UploadPhotoResponseEntity>():
        emit(UploadPhotoError(error: ErrorHandler.handle(result.exception!)));
    }
  }

  Future<void> _changePassword(ChangePasswordRequestEntity request) async {
    emit(ChangePasswordLoading());
    final result = await _useCase.changePassword( request);
    switch (result) {
      case Success<ChangePasswordResponseEntity>():
        await _offlineDataSource.cacheToken(result.data.token ?? "");
        emit(ChangePasswordSuccess(data: result.data));
      case Fail<ChangePasswordResponseEntity>():
        emit(
            ChangePasswordError(error: ErrorHandler.handle(result.exception!)));
    }
  }}
