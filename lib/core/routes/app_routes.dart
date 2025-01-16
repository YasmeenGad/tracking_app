import 'package:flutter/material.dart';
import 'package:flowery_delivery/core/utils/screens/under_build_screen.dart';
import '../../features/home/presentation/views/home_layout.dart';
import 'base_routes.dart';

class AppRoutes {
  static const String login = '/';
  static const String register = 'register';
  static const String forgetPassword = 'forgetPassword';
  static const String emailVerification = 'emailVerification';
  static const String resetPassWord = 'resetPassWord';
  static const String changePassWord = 'changePassWord';
  static const String homeLayout = 'homeLayout';

  static Route<void> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case homeLayout:
        return BaseRoute(page: const HomeLayout());
      default:
        return BaseRoute(page: const PageUnderBuildScreen());
    }
  }
}
