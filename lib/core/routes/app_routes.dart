import 'package:flutter/material.dart';
import 'package:tracking_app/core/utils/screens/under_build_screen.dart';
import 'base_routes.dart';

class AppRoutes {
  static const String login = '/';
  static const String register = 'register';
  static const String forgetPassword = 'forgetPassword';
  static const String emailVerification = 'emailVerification';
  static const String resetPassWord = 'resetPassWord';
  static const String changePassWord = 'changePassWord';
  static const String homeScreen = 'homeScreen';

  static Route<void> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      default:
        return BaseRoute(page: const PageUnderBuildScreen());
    }
  }
}
