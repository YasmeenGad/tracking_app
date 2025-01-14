import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flowery_delivery/core/utils/widgets/app_text_form_field.dart';
import 'package:flowery_delivery/core/utils/widgets/spacing.dart';
import 'package:flowery_delivery/core/styles/colors/my_colors.dart';
import '../viewModel/apply_form_view_model.dart';

class ApplyFormFields extends StatefulWidget {
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
  State<ApplyFormFields> createState() => _ApplyFormFieldsState();
}

class _ApplyFormFieldsState extends State<ApplyFormFields> {
  late ApplyFormViewModel _applyFormViewModel;

  @override
  void initState() {
    super.initState();
    _applyFormViewModel = ApplyFormViewModel();
    _loadCountries();
  }

  Future<void> _loadCountries() async {
    await _applyFormViewModel.loadCountries();
    setState(() {});
  }

  Future<void> _pickImageForLicense() async {
    final imageName = await _applyFormViewModel.pickImage();
    if (imageName != null) {
      setState(() {
        widget.vechicleLicenseController.text = imageName;
      });
    }
  }

  Future<void> _pickImageForId() async {
    final imageName = await _applyFormViewModel.pickImage();
    if (imageName != null) {
      setState(() {
        widget.idImageController.text = imageName;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: 'Country',
            border: OutlineInputBorder(),
          ),
          value: _applyFormViewModel.selectedCountry,
          items: _applyFormViewModel.countries.map((country) {
            return DropdownMenuItem<String>(
              value: country['name'],
              child: Text('${country['flag']} ${country['name']}'),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              _applyFormViewModel.selectedCountry = value;
              widget.countryController.text = value!;
            });
          },
        ),
        verticalSpacing(20.h),

        // First Legal Name Field
        AppTextFormField(
          controller: widget.firstLegalNameController,
          hintText: 'Enter first legal name',
          labelText: 'First Legal Name',
        ),
        verticalSpacing(20.h),

        // Second Legal Name Field
        AppTextFormField(
          controller: widget.secondLegalNameController,
          hintText: 'Enter second legal name',
          labelText: 'Second Legal Name',
        ),
        verticalSpacing(20.h),

        // Vehicle Type Field
        AppTextFormField(
          controller: widget.vechicleTypeController,
          hintText: 'Enter vehicle type',
          labelText: 'Vehicle Type',
        ),
        verticalSpacing(20.h),

        // Vehicle Number Field
        AppTextFormField(
          controller: widget.vechicleNumberController,
          hintText: 'Enter vehicle number',
          labelText: 'Vehicle Number',
        ),
        verticalSpacing(20.h),

        // Vehicle License Field
        AppTextFormField(
          controller: widget.vechicleLicenseController,
          hintText: 'Upload license photo',
          labelText: 'Vehicle License',
          suffixIcon: GestureDetector(
            onTap: _pickImageForLicense,
            child: Icon(
              Icons.file_upload_outlined,
              color: MyColors.gray,
              size: 30.sp,
            ),
          ),
        ),
        verticalSpacing(20.h),

        // Email Field
        AppTextFormField(
          controller: widget.emailController,
          hintText: 'Enter your email',
          labelText: 'Email',
        ),
        verticalSpacing(20.h),

        // Phone Number Field
        AppTextFormField(
          controller: widget.phoneNumberController,
          hintText: 'Enter phone number',
          labelText: 'Phone Number',
        ),
        verticalSpacing(20.h),

        // ID Number Field
        AppTextFormField(
          controller: widget.idNumberController,
          hintText: 'Enter national ID number',
          labelText: 'ID Number',
        ),
        verticalSpacing(20.h),

        // ID Image Field
        AppTextFormField(
          controller: widget.idImageController,
          hintText: 'Upload ID photo',
          labelText: 'ID Image',
          suffixIcon: GestureDetector(
            onTap: _pickImageForId,
            child: Icon(
              Icons.file_upload_outlined,
              color: MyColors.gray,
              size: 30.sp,
            ),
          ),
        ),
        verticalSpacing(20.h),

        // Password and Confirm Password Fields
        Row(
          children: [
            Expanded(
              child: AppTextFormField(
                controller: widget.passwordController,
                hintText: 'Enter password',
                labelText: 'Password',
              ),
            ),
            horizontalSpacing(20.h),
            Expanded(
              child: AppTextFormField(
                controller: widget.confirmPasswordController,
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
