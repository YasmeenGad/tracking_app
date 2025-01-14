import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flowery_delivery/core/utils/extension/media_query_values.dart';
import 'package:flowery_delivery/core/utils/widgets/spacing.dart';
import 'package:flowery_delivery/core/utils/extension/media_query_values.dart';
import '../../../../../core/localization/lang_keys.dart';
import '../../../../../core/styles/colors/my_colors.dart';
import '../../../../../core/utils/validators.dart';
import '../../../../../core/utils/widgets/app_text_form_field.dart';
import '../../../../../core/utils/widgets/buttons/carved_button.dart';
import '../../../../../core/utils/widgets/custom_appbar.dart';
import '../../../../../core/utils/widgets/spacing.dart';
import '../../../domain/entities/request/reset_password_request_entity.dart';
import '../ViewModel/forget_password_base_actions.dart';
import '../ViewModel/forget_password_view_model_cubit.dart';
import '../widgets/screen_description.dart';
import '../widgets/screen_title.dart';
import 'forget_password_bloc_listener.dart';

class ResetPassword extends HookWidget {
  ResetPassword({super.key});

  final formKye = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.white,
        appBar: customAppBar(
            appBarTxt:  context.translate(LangKeys.password),
            context: context,
            showArrow: true,
            navigation: () {
              return;
            }),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Center(
              child: Form(
                key: formKye,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const ForgetPasswordBlocListener(),
                    verticalSpacing(40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Column(
                        children: [
                           ScreenTitle(
                            title:context.translate(LangKeys.resetPassword),
                          ),
                          verticalSpacing(16),
                           ScreenDescription(
                              title:context.translate(LangKeys.resetPasswordDescription),
                                  ),
                        ],
                      ),
                    ),
                    verticalSpacing(32),
                    AppTextFormField(
                      controller: emailController,
                      hintText: context.translate(LangKeys.hintEmail),
                      labelText: context.translate(LangKeys.email),
                      validator: (value) => Validators.validateNotEmpty(
                          title: context.translate(LangKeys.email), value: value,context: context),
                    ),
                    verticalSpacing(16),
                    AppTextFormField(
                      controller: passwordController,
                      hintText: context.translate(LangKeys.enterNewPassword),
                      labelText: context.translate(LangKeys.newPassword),
                      validator: (value) => Validators.validatePassword(value, context),
                    ),
                    verticalSpacing(48),
                    CurvedButton(
                      color: MyColors.baseColor,
                      title: context.translate(LangKeys.labelContinue),
                      onTap: () {
                        if (formKye.currentState!.validate()) {
                          context.read<ForgetPasswordViewModelCubit>().doAction(
                                  ResetPasswordAction(
                                      ResetPasswordRequestEntity(
                                email: emailController.text,
                                newPassword: passwordController.text,
                              )));
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
