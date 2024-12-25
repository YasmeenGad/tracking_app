import 'package:flutter/material.dart';
import 'package:flowery_delivery/generated/assets.dart';

class PageUnderBuildScreen extends StatelessWidget {
  const PageUnderBuildScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.imagesPageUnderBuild),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
