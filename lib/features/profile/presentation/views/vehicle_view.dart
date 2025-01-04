import 'package:flowery_delivery/core/utils/extension/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/localization/lang_keys.dart';
import '../../../../core/styles/colors/my_colors.dart';
import '../../../../core/utils/widgets/buttons/carved_button.dart';
import '../../../auth/presentation/login/widgets/custom_text_form_field.dart';
import '../viewModel/vehicles/vehicles_cubit.dart';
import '../widgets/custom_app_bar_of_profile_main_screen.dart';


class VehicleView extends StatelessWidget {
  const VehicleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: customAppBarOfProfileMainScreen(
        appBarTxt: context.translate(LangKeys.editProfile),
        context: context,
        showArrow: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: BlocBuilder<VehiclesCubit, VehiclesState>(
          builder: (context, state) {
            final cubit = context.read<VehiclesCubit>();

            if (state is GetVehiclesLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is GetVehiclesError) {
              return Center(
                child: Text(state.error.error.toString()),
              );
            }

            if (state is GetVehiclesSuccess) {
              return Form(
                key: cubit.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Dropdown for Vehicle Types
                    DropdownButtonFormField<String>(
                      value: cubit.vehicleTypeController.text.isEmpty
                          ? null
                          : cubit.vehicleTypeController.text,
                      decoration: InputDecoration(
                        hintText: context.translate(LangKeys.vehicleType),
                        labelText: context.translate(LangKeys.vehicleType),
                        border: const OutlineInputBorder(),
                      ),
                      items: cubit.vehicleTypes.map((String type) {
                        return DropdownMenuItem<String>(
                          value: type,
                          child: Text(type),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        cubit.vehicleTypeController.text = newValue!;
                      },
                      validator: (value) =>
                      value == null || value.isEmpty ? 'Please select a type' : null,
                    ),
                    const SizedBox(height: 16.0),

                    // Vehicle Number
                    CustomTextFormField(
                      controller: cubit.vehicleNumberController,
                      keyboardType: TextInputType.number,
                      hintText: context.translate(LangKeys.vehicleNumber),
                      labelText: context.translate(LangKeys.vehicleNumber),
                      validator: (value) =>
                      value == null || value.isEmpty ? 'Please enter a number' : null,
                    ),
                    const SizedBox(height: 16.0),

                    // Vehicle License
                    CustomTextFormField(
                      controller: cubit.vehicleLicenseController,
                      hintText: context.translate(LangKeys.vehicleLicense),
                      labelText: context.translate(LangKeys.vehicleLicense),
                      validator: (value) =>
                      value == null || value.isEmpty ? 'Please enter a license' : null,
                    ),
                    const SizedBox(height: 24.0),

                    // Update Button
                    CurvedButton(
                      title: context.translate(LangKeys.update),
                      color: MyColors.baseColor,
                      onTap: () {
                        if (cubit.formKey.currentState!.validate()) {
                          // Perform your update logic here
                          // Example:
                          // cubit.updateVehicle();
                        }
                      },
                    ),
                  ],
                ),
              );
            }

            return  Text('no state');
          },
        ),
      ),
    );
  }
}
