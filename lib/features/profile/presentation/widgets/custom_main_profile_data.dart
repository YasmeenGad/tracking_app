import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flowery_delivery/core/utils/extension/media_query_values.dart';
import 'package:flowery_delivery/core/utils/extension/navigation.dart';
import '../../../../core/localization/lang_keys.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/styles/fonts/my_fonts.dart';
import '../../../../core/utils/widgets/base/app_loader.dart';
import '../../../../core/utils/widgets/base/snack_bar.dart';
import '../../../../di/di.dart';
import '../../../../generated/assets.dart';
import '../viewModel/profile_actions.dart';
import '../viewModel/profile_view_model_cubit.dart';
import 'custom_picture_main_screen.dart';

class CustomMainProfileData extends StatefulWidget {
  const CustomMainProfileData({super.key});

  @override
  State<CustomMainProfileData> createState() => _CustomMainProfileDataState();
}

class _CustomMainProfileDataState extends State<CustomMainProfileData> {
  ProfileViewModelCubit profileViewModelCubit = getIt.get<
      ProfileViewModelCubit>();
  String name = '';
  String email = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => profileViewModelCubit..doAction(GetLoggedUserData()),
      child: BlocBuilder<ProfileViewModelCubit, ProfileViewModelState>(
        builder: (context, state) {
         switch(state) {
           case ProfileViewModelInitial():
             
           case GetLoggedUserDataLoading():
           return const AppLoader();
           case GetLoggedUserDataSuccess():
             return Column(
               children: [
                 const CustomPictureMainScreen(),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text(
                       '${state.data.user!.firstName}',
                       style: MyFonts.styleMedium500_18.copyWith(
                         color: MyColors.blackBase,
                       ),
                     ),
                     SizedBox(
                       width: 6.w,
                     ),
                     InkWell(
                       onTap: () {
                         context.pushNamed(AppRoutes.profileView);
                       },
                       child: SizedBox(
                           width: 24.w,
                           height: 24.w,
                           child: Image.asset(Assets.imagesPen)),
                     ),
                   ],
                 ),
                 SizedBox(
                   height: 5.h,
                 ),
                 Text(
                   '${state.data.user!.email}',
                   style: MyFonts.styleMedium500_18.copyWith(
                     color: MyColors.grey,
                   ),
                 ),
               ],
             );
           case GetLoggedUserDataError():
             SchedulerBinding.instance.addPostFrameCallback((_) {
               aweSnackBar(
                 msg: context.translate(LangKeys.error),
                 context: context,
                 type: MessageTypeConst.failure,
               );
             });

           case EditProfileLoading():
             
           case EditProfileSuccess():
             
           case EditProfileError():
             
           case UploadPhotoLoading():
             
           case UploadPhotoSuccess():
             
           case ChangePasswordLoading():
             
           case ChangePasswordSuccess():
             
           case UploadPhotoError():
             
           case ChangePasswordError():
             
         }
         return Container();
        },
      ),
    );
  }
}
