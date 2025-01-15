import 'package:flowery_delivery/di/di.dart';
import 'package:flowery_delivery/features/auth/presentation/apply/viewModel/apply_driver_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flowery_delivery/core/utils/screens/under_build_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/auth/presentation/apply/viewModel/apply_form_view_model.dart';
import '../../features/auth/presentation/apply/views/apply_view.dart';
import 'base_routes.dart';

class AppRoutes {
  /* static const String login = '/';
  static const String forgetPassword = 'forgetPassword';
  static const String emailVerification = 'emailVerification';
  static const String resetPassWord = 'resetPassWord';
  static const String changePassWord = 'changePassWord';*/
  static const String homeScreen = 'homeScreen';
  static const String applyView = 'applyView';

  static Route<void> onGenerateRoute(RouteSettings settings) {
    //final args = settings.arguments;
    switch (settings.name) {
      case applyView:
        return BaseRoute(
            page: BlocProvider<ApplyDriverViewModelCubit>(
                create: (context) => getIt.get<ApplyDriverViewModelCubit>(),
                child: const ApplyView()));
      default:
        return BaseRoute(page: const PageUnderBuildScreen());
    }
  }
}
