import 'package:flowery_delivery/core/utils/extension/media_query_values.dart';
import 'package:flowery_delivery/core/utils/extension/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/localization/lang_keys.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/styles/colors/my_colors.dart';
import '../../../../../core/utils/widgets/buttons/carved_button.dart';
import '../../../domain/entities/request/login_request_entity.dart';
import '../viewModel/login_action.dart';
import '../viewModel/login_view_model_cubit.dart';

class LoginButtons extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final dynamic formKey;
  final bool rememberMe;
  const LoginButtons({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
    required this.rememberMe,
  });
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<LoginViewModel>();

    return SliverToBoxAdapter(
      child: Column(
        children: [
          CurvedButton(
            color: MyColors.baseColor,
            title: context.translate(LangKeys.login),
            onTap: () {
              if (formKey.currentState!.validate()) {
                viewModel.doAction(LoginAction(
                  LoginRequestEntity(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  ),
                  rememberMe,
                  context, // Pass the rememberMe value here
                ));
              }
            },
          ),
          const SizedBox(height: 16),
          CurvedButton(
            color: MyColors.white,
            title: context.translate(LangKeys.guest),
            onTap: () {
              context.pushReplacementNamed(AppRoutes.profileMainScreen);
            },
            colorBorderSide: MyColors.gray,
            textColor: MyColors.gray,
          ),
        ],
      ),
    );
  }
}
