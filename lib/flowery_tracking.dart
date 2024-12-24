import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tracking_app/core/services/connectivity_controller.dart';
import 'package:tracking_app/core/utils/extension/media_query_values.dart';
import 'core/app_cubit/app_cubit.dart';
import 'core/app_cubit/app_state.dart';
import 'core/localization/app_localizations_setup.dart';
import 'core/routes/app_routes.dart';
import 'core/services/shared_preference/shared_pref_keys.dart';
import 'core/services/shared_preference/shared_preference_helper.dart';
import 'core/utils/screens/no_network_screen.dart';
import 'di/di.dart';

class FloweryTracking extends StatelessWidget {
  FloweryTracking({super.key});

  final GlobalKey<NavigatorState> navigatorKey =
      getIt<GlobalKey<NavigatorState>>();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ConnectivityController.instance.isConnected,
      builder: (context, value, child) {
        if (value) {
          return ScreenUtilInit(
              child: ScreenUtilInit(
            designSize: kIsWeb
                ? Size(context.width, context.height)
                : const Size(390, 844),
            minTextAdapt: true,
            child: BlocBuilder<AppCubit, AppStates>(
              buildWhen: (previous, current) {
                return previous != current;
              },
              builder: (context, state) {
                final cubit = context.read<AppCubit>();
                return MaterialApp(
                  locale: Locale(cubit.currentLanguage),
                  supportedLocales: AppLocalizationsSetup.supportedLocales,
                  localeResolutionCallback:
                      AppLocalizationsSetup.localeResolutionCallback,
                  localizationsDelegates:
                      AppLocalizationsSetup.localizationsDelegates,
                  initialRoute: _getInitialRoute(),
                  debugShowCheckedModeBanner: false,
                  builder: (context, child) {
                    return Scaffold(
                      body: Builder(
                        builder: (context) {
                          ConnectivityController.instance.init();
                          return child!;
                        },
                      ),
                    );
                  },
                  onGenerateRoute: AppRoutes.onGenerateRoute,
                  navigatorKey: getIt<GlobalKey<NavigatorState>>(),
                );
              },
            ),
          ));
        } else {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: NoNetworkScreen(),
          );
        }
      },
    );
  }
}

String _getInitialRoute() {
  return SharedPrefHelper().getString(key: SharedPrefKeys.tokenKey) != null
      ? AppRoutes.homeScreen
      : AppRoutes.login;
}
