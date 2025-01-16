import 'package:flowery_delivery/core/styles/colors/my_colors.dart';
import 'package:flowery_delivery/core/styles/fonts/my_fonts.dart';
import 'package:flowery_delivery/core/utils/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenderSelectionWidget extends StatefulWidget {
  final Function(String?)
      selectedGenderCallback; // Callback to pass selected gender

  const GenderSelectionWidget(
      {super.key, required this.selectedGenderCallback});

  @override
  State<GenderSelectionWidget> createState() => _GenderSelectionWidgetState();
}

class _GenderSelectionWidgetState extends State<GenderSelectionWidget> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Gender',
            style: MyFonts.styleMedium500_18.copyWith(color: MyColors.gray)),
        horizontalSpacing(20.w),
        Row(
          children: [
            Radio<String>(
              value: 'Female',
              groupValue: selectedGender,
              onChanged: (value) {
                setState(() {
                  selectedGender = value;
                  widget.selectedGenderCallback(
                      selectedGender); // Pass selected gender back
                });
              },
            ),
            Text(
              'Female',
              style: MyFonts.styleRegular400_16
                  .copyWith(color: MyColors.blackBase),
            ),
          ],
        ),
        horizontalSpacing(20.w),
        Row(
          children: [
            Radio<String>(
              value: 'Male',
              groupValue: selectedGender,
              onChanged: (value) {
                setState(() {
                  selectedGender = value;
                  widget.selectedGenderCallback(
                      selectedGender); // Pass selected gender back
                });
              },
            ),
            Text(
              'Male',
              style: MyFonts.styleRegular400_16
                  .copyWith(color: MyColors.blackBase),
            ),
          ],
        ),
      ],
    );
  }
}
