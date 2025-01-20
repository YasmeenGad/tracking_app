import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flowery_delivery/core/utils/extension/media_query_values.dart';
import '../../../../core/localization/lang_keys.dart';
import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/utils/widgets/base/snack_bar.dart';
import '../../../../di/di.dart';
import '../../../../generated/assets.dart';
import '../viewModel/profile_actions.dart';

import '../viewModel/profile_view_model_cubit.dart';


class ProfilePic extends StatefulWidget {
  const ProfilePic({super.key});

  @override
  State<ProfilePic> createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  late final ProfileViewModelCubit profileViewModel;

  @override
 void initState() {
    super.initState();
    profileViewModel = getIt.get<ProfileViewModelCubit>();
  }

  Future<void> _pickImage(ImageSource imageSource) async {
    final pickedFile = await _picker.pickImage(source: imageSource);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        profileViewModel.doAction(UploadPhoto(_image!));
        debugPrint("*******************************************");
        debugPrint(_image.toString());
        debugPrint("*******************************************");
      });
    }
  }

  void _showCustomBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 20,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(20.sp),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
            context.translate(LangKeys.selectAPhoto),
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 10.h),
                Divider(thickness: 1, color: Colors.grey[300]),
                ListTile(
                  leading: const Icon(Icons.camera_alt_outlined, color: Colors.green),
                  title: Text(
                    context.translate(LangKeys.takeAPhoto),
                    style: TextStyle(color: Colors.black, fontSize: 16.sp),
                  ),
                  onTap: () {
                    _pickImage(ImageSource.camera);
                    setState(() {});
                    Navigator.pop(context);
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.photo_library, color: Colors.blue),
                  title: Text(
                    context.translate(LangKeys.pickFromGallery),
                    style: TextStyle(color: Colors.black, fontSize: 16.sp),
                  ),
                  onTap: () {
                    setState(() {});
                    _pickImage(ImageSource.gallery);
                    Navigator.pop(context);
                  },
                ),
                SizedBox(height: 15.h),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    context.translate(LangKeys.cancel),
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  // void _setImage(File? image) {
  //   setState(() {
  //     _image = image;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileViewModelCubit>(
      create: (context) => profileViewModel,
      child: BlocListener<ProfileViewModelCubit, ProfileViewModelState>(
        listener: (context, state) {
          switch (state) {
            case UploadPhotoLoading():
              aweSnackBar(
                  msg: 'Loading...',
                  context: context,
                  type: MessageTypeConst.help,
                  title: 'Loading');
              break;
            case UploadPhotoSuccess():
              aweSnackBar(
                  msg: state.data.message.toString(),
                  context: context,
                  type: MessageTypeConst.success,
                  title: 'Success');
              break;
            case UploadPhotoError():
              aweSnackBar(
                  msg: state.error.error.toString(),
                  context: context,
                  type: MessageTypeConst.failure,
                  title: 'Error');
              break;
            default:
          }
        },
        child: SizedBox(
          height: 115.h,
          width: 115.w,
          child: Stack(
            fit: StackFit.expand,
            clipBehavior: Clip.none,
            children: [
              _image == null
                  ? const CircleAvatar(
                      backgroundImage: AssetImage(Assets.imagesProfile),
                    )
                  : CircleAvatar(
                      backgroundImage: FileImage(_image!) as ImageProvider),
              Positioned(
                right: -18.w,
                bottom: 2.h,
                child: SizedBox(
                  height: 46.h,
                  width: 46.w,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: MyColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                        side: const BorderSide(color: MyColors.white),
                      ),
                      backgroundColor: MyColors.lightPink,
                    ),
                    onPressed: () {
                      _showCustomBottomSheet(context);
                    },
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: MyColors.gray,
                      size: 22.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
