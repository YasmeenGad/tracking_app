import 'package:auto_size_text/auto_size_text.dart';
import 'package:flowery_delivery/core/styles/fonts/my_fonts.dart';
import 'package:flowery_delivery/core/utils/widgets/app_text_form_field.dart';
import 'package:flowery_delivery/core/utils/widgets/base/custom_app_bar.dart';
import 'package:flowery_delivery/core/utils/widgets/spacing.dart';
import 'package:flowery_delivery/features/auth/presentation/apply/widgets/gender_selection_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/styles/colors/my_colors.dart';
import '../../../../../core/utils/widgets/base/base_view.dart';

class ApplyView extends StatefulWidget {
  const ApplyView({super.key});

  @override
  State<ApplyView> createState() => _ApplyViewState();
}

class _ApplyViewState extends State<ApplyView> {
  late final TextEditingController countryController;
  late final TextEditingController firstLegalNameController;
  late final TextEditingController secondLegalNameController;
  late final TextEditingController vechicleTypeController;
  late final TextEditingController vechicleNumberController;
  late final TextEditingController vechicleLicenseController;
  late final TextEditingController emailController;
  late final TextEditingController phoneNumberController;
  late final TextEditingController idNumberController;
  late final TextEditingController idImageController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;

  @override
  void initState() {
    countryController = TextEditingController();
    firstLegalNameController = TextEditingController();
    secondLegalNameController = TextEditingController();
    vechicleTypeController = TextEditingController();
    vechicleNumberController = TextEditingController();
    vechicleLicenseController = TextEditingController();
    emailController = TextEditingController();
    phoneNumberController = TextEditingController();
    idNumberController = TextEditingController();
    idImageController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(child: CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: CustomAppBar(appBarTxt: 'Apply', showArrow: true),
        ),
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpacing(24.h),
              AutoSizeText(
                "Welcome!!",
                style: MyFonts.styleMedium500_20
                    .copyWith(color: MyColors.blackBase),
              ),
              verticalSpacing(8.h),
              AutoSizeText(
                """You want to be a delivery man?\nJoin our team """,
                style: MyFonts.styleMedium500_16.copyWith(color: MyColors.gray),
              ),
              verticalSpacing(24.h),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              AppTextFormField(
                  controller: countryController,
                  hintText: 'Country',
                  labelText: 'Country'),
              verticalSpacing(20.h),
              AppTextFormField(
                  controller: firstLegalNameController,
                  hintText: 'Enter first legal name',
                  labelText: 'First Legal Name'),
              verticalSpacing(20.h),
              AppTextFormField(
                  controller: secondLegalNameController,
                  hintText: 'Enter second legal name',
                  labelText: 'Second Legal Name'),
              verticalSpacing(20.h),
              AppTextFormField(
                  controller: vechicleTypeController,
                  hintText: 'Enter vechicle type',
                  labelText: 'Vechicle Type'),
              verticalSpacing(20.h),
              AppTextFormField(
                  controller: vechicleNumberController,
                  hintText: 'Enter vechicle number',
                  labelText: 'Vechicle Number'),
              verticalSpacing(20.h),
              AppTextFormField(
                  controller: vechicleLicenseController,
                  hintText: 'Upload license photo',
                  labelText: 'Vechicle License'),
              verticalSpacing(20.h),
              AppTextFormField(
                  controller: emailController,
                  hintText: 'Enter your email',
                  labelText: 'Email'),
              verticalSpacing(20.h),
              AppTextFormField(
                  controller: phoneNumberController,
                  hintText: 'Enter phone number',
                  labelText: 'Phone Number'),
              verticalSpacing(20.h),
              AppTextFormField(
                  controller: idNumberController,
                  hintText: 'Enter national ID number',
                  labelText: 'ID Number'),
              verticalSpacing(20.h),
              AppTextFormField(
                  controller: idImageController,
                  hintText: 'Upload ID photo',
                  labelText: 'ID Image'),
              verticalSpacing(20.h),
              Row(children: [
                Expanded(
                    child: AppTextFormField(
                        controller: passwordController,
                        hintText: 'Enter password',
                        labelText: 'Password')),
                horizontalSpacing(20.h),
                Expanded(
                    child: AppTextFormField(
                        controller: confirmPasswordController,
                        hintText: 'Confirm password',
                        labelText: 'Confirm Password')),
              ]),
              verticalSpacing(20.h),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: GenderSelectionWidget(),
        )
      ],
    ));
  }
}
