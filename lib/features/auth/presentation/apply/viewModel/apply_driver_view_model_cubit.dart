import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/networking/error/error_model.dart';
import '../../../domain/entities/response/apply_response_entity.dart';

part 'apply_driver_view_model_state.dart';

class ApplyDriverViewModelCubit extends Cubit<ApplyDriverViewModelState> {
  ApplyDriverViewModelCubit() : super(ApplyDriverViewModelInitial());
}
