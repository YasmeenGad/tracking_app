import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flowery_delivery/core/localization/lang_keys.dart';
import 'package:flowery_delivery/core/services/location_helper.dart';
import 'package:flowery_delivery/core/styles/colors/my_colors.dart';
import 'package:flowery_delivery/core/styles/fonts/my_fonts.dart';
import 'package:flowery_delivery/core/utils/extension/media_query_values.dart';
import 'package:flowery_delivery/di/di.dart';
import 'package:flowery_delivery/features/auth/presentation/onBoarding/on_boarding_animation.dart';
import 'package:flowery_delivery/features/driver_orders/presentation/widgets/driver_card_order_details.dart';
import 'package:flowery_delivery/features/home/presentation/widgets/custom_text_header.dart';
import 'package:flowery_delivery/features/profile/presentation/viewModel/profile_actions.dart';
import 'package:flowery_delivery/features/profile/presentation/viewModel/profile_view_model_cubit.dart';
import 'package:flowery_delivery/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/utils/widgets/base/app_loader.dart';
import '../../../../core/utils/widgets/base/base_view.dart';
import '../viewModel/driver_order_view_model_cubit.dart';
import '../viewModel/driver_orders_actions.dart';

class DriverOrdersView extends StatefulWidget {
  const DriverOrdersView({super.key});

  @override
  State<DriverOrdersView> createState() => _DriverOrdersViewState();
}

class _DriverOrdersViewState extends State<DriverOrdersView> {
  final ProfileViewModelCubit profileViewModelCubit =
      getIt.get<ProfileViewModelCubit>();
  final indicatorController = IndicatorController();

  @override
  void initState() {
    profileViewModelCubit.doAction(GetLoggedUserData());
    LocationHelper().getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      child: BlocBuilder<DriverOrderViewModelCubit, DriverOrderViewModelState>(
        builder: (context, state) {
          if (state is DriverOrderViewModelLoading &&
              context.read<DriverOrderViewModelCubit>().limit == 10) {
            return AppLoader();
          } else if (state is DriverOrderViewModelLoaded) {
            return CustomMaterialIndicator(
              onRefresh: () async {
                context
                    .read<DriverOrderViewModelCubit>()
                    .onAction(GetMyOrders());
              },
              indicatorBuilder: (context, controller) {
                return Lottie.asset(
                  width: 50,
                  height: 50,
                  Assets.imagesFloweryLoader,
                  alignment: Alignment.bottomCenter,
                  fit: BoxFit.scaleDown,
                );
              },
              triggerMode: IndicatorTriggerMode.anywhere,
              child: CustomScrollView(
                controller:
                    context.read<DriverOrderViewModelCubit>().scrollController,
                slivers: [
                  SliverToBoxAdapter(
                    child: FadeInDown(
                      duration: const Duration(milliseconds: 500),
                      child: const CustomTextHeader(),
                    ),
                  ),
                  if (state.response.orders.isEmpty)
                    SliverToBoxAdapter(
                      child: GestureDetector(
                        onVerticalDragDown: (details) {
                          context
                              .read<DriverOrderViewModelCubit>()
                              .onAction(GetMyOrders());
                        },
                        child: FadeIn(
                          duration: const Duration(milliseconds: 400),
                          child: Column(
                            children: [
                              const OnBoardingAnimation(),
                              SizedBox(
                                height: 40.sp,
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: AnimatedTextKit(
                                    repeatForever: true,
                                    animatedTexts: [
                                      ScaleAnimatedText(
                                        context.translate(
                                            LangKeys.noOrdersAvailable),
                                        textStyle:
                                            MyFonts.styleBold700_24.copyWith(
                                          fontFamily: 'oronteus',
                                          color: MyColors.baseColor,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  SliverToBoxAdapter(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.response.orders.length,
                      itemBuilder: (_, index) {
                        if (index ==
                                context
                                    .read<DriverOrderViewModelCubit>()
                                    .totalItems &&
                            state is DriverOrderViewModelLoading) {
                          return Center(
                            child: SizedBox(height: 130.h, child: AppLoader()),
                          );
                        }

                        return FadeInUp(
                          duration: const Duration(milliseconds: 1000),
                          child: StoreCardOrderDetails(
                            ordersList: state.response.orders[index],
                            store: state.response.orders[index].store,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          } else if (state is DriverOrderViewModelError) {
            return Center(
              child: FadeIn(
                duration: const Duration(milliseconds: 300),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        state.errorMessage.error.toString(),
                        style: TextStyle(color: Colors.red),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context.read<DriverOrderViewModelCubit>().loadMore();
                        },
                        child: Text('Retry'),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const OnBoardingAnimation();
          }
        },
      ),
    );
  }
}
