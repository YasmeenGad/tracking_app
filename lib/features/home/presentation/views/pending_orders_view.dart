import 'package:animate_do/animate_do.dart';
import 'package:flowery_delivery/core/utils/widgets/spacing.dart';
import 'package:flowery_delivery/features/home/presentation/widgets/custom_card_order_details.dart';
import 'package:flowery_delivery/features/home/presentation/widgets/custom_text_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/widgets/base/app_loader.dart';
import '../../../../core/utils/widgets/base/base_view.dart';
import '../viewModel/pending_order_view_model_cubit.dart';

class PendingOrdersView extends StatelessWidget {
  const PendingOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      child:
          BlocBuilder<PendingOrderViewModelCubit, PendingOrderViewModelState>(
        builder: (context, state) {
          if (state is PendingOrderViewModelLoading &&
              context.read<PendingOrderViewModelCubit>().limit == 10) {
            return AppLoader();
          } else if (state is PendingOrderViewModelLoaded) {
            return CustomScrollView(
              controller:
                  context.read<PendingOrderViewModelCubit>().scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: FadeInDown(
                    duration: const Duration(milliseconds: 500),
                    child: const CustomTextHeader(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: FadeIn(
                    duration: const Duration(milliseconds: 400),
                    child: verticalSpacing(29.h),
                  ),
                ),
                SliverToBoxAdapter(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.response.orders!.length ,
                    itemBuilder: (context, index) {
                      if (index == context.read<PendingOrderViewModelCubit>().totalItems &&
                          state is PendingOrderViewModelLoading) {
                        return Center(
                          child: SizedBox(height: 130.h, child: AppLoader()),
                        );
                      }
                      return FadeInUp(
                        duration: const Duration(milliseconds: 1000),
                        child: CustomCardOrderDetails(
                            order: state.response.orders![index]!),
                      );
                    },
                  ),
                ),

              ],
            );
          } else if (state is PendingOrderViewModelError) {
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
                          context.read<PendingOrderViewModelCubit>().loadMore();
                        },
                        child: Text('Retry'),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
