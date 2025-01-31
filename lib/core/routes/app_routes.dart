import 'package:flowery_delivery/features/App_approve/presentation/views/success_apply_view.dart';
import 'package:flutter/material.dart';
import 'package:flowery_delivery/core/utils/screens/under_build_screen.dart';
import 'package:flowery_delivery/features/auth/presentation/onBoarding/on_boarding.dart';
import 'package:flowery_delivery/features/home/presentation/viewModel/pending_order_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/di.dart';
import '../../features/auth/presentation/forget_password/ViewModel/forget_password_view_model_cubit.dart';
import '../../features/auth/presentation/forget_password/view/email_verification.dart';
import '../../features/auth/presentation/forget_password/view/forget_password.dart';
import '../../features/auth/presentation/forget_password/view/reset_password.dart';
import '../../features/auth/presentation/login/view/login_view.dart';
import '../../features/auth/presentation/signup/view/signup_view.dart';
import '../../features/auth/presentation/signup/view_model/signup_view_model_cubit.dart';
import '../../features/home/presentation/viewModel/pending_orders_actions.dart';
import '../../features/home/presentation/views/pending_orders_view.dart';
import '../../features/profile/presentation/viewModel/edit_profile/edit_profile_cubit.dart';
import '../../features/profile/presentation/viewModel/profile_actions.dart';
import '../../features/profile/presentation/viewModel/profile_view_model_cubit.dart';
import '../../features/profile/presentation/viewModel/vehicles/vehicles_action.dart';
import '../../features/profile/presentation/viewModel/vehicles/vehicles_cubit.dart';
import '../../features/profile/presentation/views/profile_main_screen.dart';
import '../../features/profile/presentation/views/profile_view.dart';
import '../../features/profile/presentation/views/reset_password_profile_view.dart';
import '../../features/profile/presentation/views/vehicle_view.dart';
import 'base_routes.dart';

class AppRoutes {
  static const String onBoarding = '/';
  static const String login = 'login';
  static const String register = 'register';
  static const String forgetPassword = 'forgetPassword';
  static const String emailVerification = 'emailVerification';
  static const String resetPassWord = 'resetPassWord';
  static const String changePassWord = 'changePassWord';
  static const String homeScreen = 'homeScreen';
  static const String successApplyView = 'successApplyView';
  static const String profileMainScreen = 'profileMainScreen';
  static const String profileView = "profileView";
  static const String vehicleView = "vehicleView";
  static const String pendingOrdersView = "pendingOrdersView";
  static const String resetPasswordProfileView = "resetPasswordProfileView";
  static Route<void> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case AppRoutes.onBoarding:
        return BaseRoute(
          page: const OnBoarding(),
        );
      case AppRoutes.login:
        return BaseRoute(
          page: const LoginView(),
        );
      case AppRoutes.register:
        return BaseRoute(
          page: BlocProvider(
              create: (context) => getIt.get<SignUpViewModel>(),
              child: const SignUpView()),
        );
         case successApplyView:
        return BaseRoute(page: const SuccessApplyView());
      case AppRoutes.forgetPassword:
        return BaseRoute(
          page: BlocProvider(
              create: (context) => getIt.get<ForgetPasswordViewModelCubit>(),
              child: ForgetPassword()),
        );
      case AppRoutes.emailVerification:
        return BaseRoute(
            page: BlocProvider(
          create: (context) => getIt.get<ForgetPasswordViewModelCubit>(),
          child: EmailVerification(args as String),
        ));

      case AppRoutes.resetPassWord:
        return BaseRoute(
          page: BlocProvider(
              create: (context) => getIt.get<ForgetPasswordViewModelCubit>(),
              child: ResetPassword()),
        );
      case AppRoutes.profileMainScreen:
        return BaseRoute(
            page: MultiBlocProvider(
              providers: [
                BlocProvider(
                    create: (context) => getIt.get<ProfileViewModelCubit>()
                      ..doAction(GetLoggedUserData())),
                BlocProvider(
                    create: (context) => getIt.get<VehiclesCubit>()
                      ..doAction(GetAllVehicles())),
              ],
                  child: ProfileMainScreen()),
        );
      case AppRoutes.profileView:
        return BaseRoute(page: const ProfileView());
      case AppRoutes.vehicleView:
        return BaseRoute(
            page: MultiBlocProvider(
                providers: [
                  BlocProvider<ProfileViewModelCubit>(
                    create: (context) => getIt.get<ProfileViewModelCubit>()..doAction(GetLoggedUserData()),
                  ),
                  BlocProvider<VehiclesCubit>(
                    create: (context) => getIt.get<VehiclesCubit>()..doAction(GetAllVehicles()),
                  ),
                  BlocProvider<EditProfileCubit>(
                    create: (context) => getIt.get<EditProfileCubit>(),
                  ),
                ],
                child: const VehicleView()));
      case AppRoutes.resetPasswordProfileView:
        return BaseRoute(page: const ResetPasswordProfileView());
      case AppRoutes.pendingOrdersView:
        return BaseRoute(
            page: BlocProvider<PendingOrderViewModelCubit>(
          create: (context) => getIt.get<PendingOrderViewModelCubit>()
            ..onAction(GetPendingOrders()),
          child: const PendingOrdersView(),
        ));
      default:
        return BaseRoute(page: const PageUnderBuildScreen());
    }
  }
}
