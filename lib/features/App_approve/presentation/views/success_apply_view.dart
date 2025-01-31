import 'package:flutter/material.dart';
import '../widgets/bottom_background_image.dart';
import '../widgets/submission_header.dart';

class SuccessApplyView extends StatelessWidget {
  const SuccessApplyView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: SubmissionHeader(),
            ),
          ),
          const BottomBackgroundImage(),
        ],
      ),
    );
  }
}
