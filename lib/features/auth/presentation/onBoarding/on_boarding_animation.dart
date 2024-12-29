import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flowery_delivery/core/utils/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:flowery_delivery/core/localization/lang_keys.dart';
import 'package:flowery_delivery/core/styles/colors/my_colors.dart';
import 'package:flowery_delivery/core/styles/fonts/my_fonts.dart';
import 'package:flowery_delivery/core/utils/extension/media_query_values.dart';
import 'package:flowery_delivery/generated/assets.dart';

class OnBoardingAnimation extends StatefulWidget {
  const OnBoardingAnimation({super.key});

  @override
  OnBoardingAnimationState createState() => OnBoardingAnimationState();
}

class OnBoardingAnimationState extends State<OnBoardingAnimation> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Stop the animation at the last frame
        _controller.stop();
      }
    });

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              controller: _controller,
              Assets.imagesFloweryRider,
              height: 307.h,
              width: 343.w,
              alignment: Alignment.bottomCenter,
              reverse: false,
              repeat: false, // No repeat
              animate: true,
              onLoaded: (composition) {
                setState(() {
                  _controller.duration = composition.duration;
                });
              },
              fit: BoxFit.scaleDown,
            ),
          ],
        ),
      ),
    );
  }
}
