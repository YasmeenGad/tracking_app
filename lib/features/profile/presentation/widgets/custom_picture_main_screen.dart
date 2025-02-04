import 'package:cached_network_image/cached_network_image.dart';
import 'package:flowery_delivery/core/utils/extension/string_exetension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/assets.dart';
import '../viewModel/profile_view_model_cubit.dart';

class CustomPictureMainScreen extends StatefulWidget {
  const CustomPictureMainScreen({super.key, required this.state});
 final GetLoggedUserDataSuccess state;
  @override
  State<CustomPictureMainScreen> createState() =>
      _CustomPictureMainScreenState();
}

class _CustomPictureMainScreenState extends State<CustomPictureMainScreen> {


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      width: 70.w,
      child: Stack(
        fit: StackFit.passthrough,
        clipBehavior: Clip.antiAlias,
        children: [
          widget.state.data.driver!.photo == null
              ? const CircleAvatar(
            backgroundImage: AssetImage(Assets.imagesProfile),
          )
              : CircleAvatar(
    backgroundImage: CachedNetworkImageProvider(widget.state.data.driver!.photo!.imageFormat())),
        ],
      ),
    );
  }
}
