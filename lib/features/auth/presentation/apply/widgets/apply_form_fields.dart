import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flowery_delivery/core/utils/widgets/app_text_form_field.dart';
import 'package:flowery_delivery/core/utils/widgets/spacing.dart';
import 'package:flowery_delivery/core/styles/colors/my_colors.dart';

class ApplyFormFields extends StatelessWidget {
  final TextEditingController countryController;
  final TextEditingController firstLegalNameController;
  final TextEditingController secondLegalNameController;
  final TextEditingController vechicleTypeController;
  final TextEditingController vechicleNumberController;
  final TextEditingController vechicleLicenseController;
  final TextEditingController emailController;
  final TextEditingController phoneNumberController;
  final TextEditingController idNumberController;
  final TextEditingController idImageController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const ApplyFormFields({
    super.key,
    required this.countryController,
    required this.firstLegalNameController,
    required this.secondLegalNameController,
    required this.vechicleTypeController,
    required this.vechicleNumberController,
    required this.vechicleLicenseController,
    required this.emailController,
    required this.phoneNumberController,
    required this.idNumberController,
    required this.idImageController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Country Field
        AppTextFormField(
          controller: countryController,
          hintText: 'Country',
          labelText: 'Country',
          suffixIcon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: MyColors.gray,
            size: 30.sp,
          ),
        ),
        verticalSpacing(20.h),

        // First Legal Name Field
        AppTextFormField(
          controller: firstLegalNameController,
          hintText: 'Enter first legal name',
          labelText: 'First Legal Name',
        ),
        verticalSpacing(20.h),

        // Second Legal Name Field
        AppTextFormField(
          controller: secondLegalNameController,
          hintText: 'Enter second legal name',
          labelText: 'Second Legal Name',
        ),
        verticalSpacing(20.h),

        // Vehicle Type Field
        AppTextFormField(
          controller: vechicleTypeController,
          hintText: 'Enter vehicle type',
          labelText: 'Vehicle Type',
          suffixIcon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: MyColors.gray,
            size: 30.sp,
          ),
        ),
        verticalSpacing(20.h),

        // Vehicle Number Field
        AppTextFormField(
          controller: vechicleNumberController,
          hintText: 'Enter vehicle number',
          labelText: 'Vehicle Number',
        ),
        verticalSpacing(20.h),

        // Vehicle License Field
        AppTextFormField(
          controller: vechicleLicenseController,
          hintText: 'Upload license photo',
          labelText: 'Vehicle License',
          suffixIcon: Icon(
            Icons.file_upload_outlined,
            color: MyColors.gray,
            size: 30.sp,
          ),
        ),
        verticalSpacing(20.h),

        // Email Field
        AppTextFormField(
          controller: emailController,
          hintText: 'Enter your email',
          labelText: 'Email',
        ),
        verticalSpacing(20.h),

        // Phone Number Field
        AppTextFormField(
          controller: phoneNumberController,
          hintText: 'Enter phone number',
          labelText: 'Phone Number',
        ),
        verticalSpacing(20.h),

        // ID Number Field
        AppTextFormField(
          controller: idNumberController,
          hintText: 'Enter national ID number',
          labelText: 'ID Number',
        ),
        verticalSpacing(20.h),

        // ID Image Field
        AppTextFormField(
          controller: idImageController,
          hintText: 'Upload ID photo',
          labelText: 'ID Image',
          suffixIcon: Icon(
            Icons.file_upload_outlined,
            color: MyColors.gray,
            size: 30.sp,
          ),
        ),
        verticalSpacing(20.h),

        // Password and Confirm Password Fields
        Row(
          children: [
            Expanded(
              child: AppTextFormField(
                controller: passwordController,
                hintText: 'Enter password',
                labelText: 'Password',
              ),
            ),
            horizontalSpacing(20.h),
            Expanded(
              child: AppTextFormField(
                controller: confirmPasswordController,
                hintText: 'Confirm password',
                labelText: 'Confirm Password',
              ),
            ),
          ],
        ),
        verticalSpacing(20.h),
      ],
    );
  }
}
