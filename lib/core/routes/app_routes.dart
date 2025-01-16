import 'package:flowery_delivery/features/App_approve/presentation/views/success_apply_view.dart';
import 'package:flutter/material.dart';
import 'package:flowery_delivery/core/utils/screens/under_build_screen.dart';
import 'base_routes.dart';

class AppRoutes {
  static const String login = '/';
  static const String register = 'register';
  static const String forgetPassword = 'forgetPassword';
  static const String emailVerification = 'emailVerification';
  static const String resetPassWord = 'resetPassWord';
  static const String changePassWord = 'changePassWord';
  static const String homeScreen = 'homeScreen';
  static const String successApplyView = 'successApplyView';

  static Route<void> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case successApplyView:
        return BaseRoute(page: const SuccessApplyView());
      default:
        return BaseRoute(page: const PageUnderBuildScreen());
    }
  }
}
