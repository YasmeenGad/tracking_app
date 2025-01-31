import 'package:flutter/material.dart';
import 'package:flowery_delivery/core/utils/extension/media_query_values.dart';

import '../../../../../core/localization/lang_keys.dart';
import '../../../../../core/styles/colors/my_colors.dart';
import '../../../../../core/utils/validators.dart';
import 'custom_text_form_field.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController passwordController;

  const PasswordField({super.key, required this.passwordController});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: widget.passwordController,
      isPassword: !isPasswordVisible,
      validator: (value) => Validators.validatePassword(value, context),
      hintText: context.translate(LangKeys.hintPassword),
      labelText: context.translate(LangKeys.password),
      suffix: GestureDetector(
        child: Icon(
          isPasswordVisible ? Icons.visibility : Icons.visibility_off,
          color: MyColors.gray,
        ),
        onTap: () {
          setState(() {
            isPasswordVisible = !isPasswordVisible;
          });
        },
      ),
    );
  }
}
