import 'package:flutter/material.dart';
import 'package:flowery_delivery/generated/assets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomBackgroundImage extends StatelessWidget {
  const BottomBackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      Assets.imagesBg,
      alignment: Alignment.bottomCenter,
    );
  }
}
