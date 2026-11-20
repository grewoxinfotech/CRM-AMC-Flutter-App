import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raiser_amc/core/theme/app_colors.dart';
import 'package:raiser_amc/core/utils/custom_app_bar.dart';
import 'package:raiser_amc/core/utils/custom_button.dart';
import 'package:raiser_amc/core/utils/custom_snackbar.dart';
import 'package:raiser_amc/core/utils/custom_text_field.dart';
import 'package:raiser_amc/ui/company_panel/company_profile/view/personal_information.dart';
import 'package:sizer/sizer.dart';

class EditPersonalInformation extends StatefulWidget {
  const EditPersonalInformation({super.key});

  @override
  State<EditPersonalInformation> createState() =>
      _EditPersonalInformationState();
}

class _EditPersonalInformationState extends State<EditPersonalInformation> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController streeAddressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();
  final TextEditingController countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 6.h),
              CustomAppBar(
                title: 'Edit Personal Information',
                isBack: true,
                isRightMenu: true,
              ),
              SizedBox(height: 2.h),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomTextField(
                        label: 'Name',
                        hintText: 'Enter your name',
                        prefixIcon: Icons.person,
                        controller: nameController,
                      ),
                      SizedBox(height: 2.h),
                      CustomTextField(
                        label: 'Email',
                        hintText: 'Enter your email',
                        prefixIcon: Icons.email,
                        controller: emailController,
                      ),
                      SizedBox(height: 2.h),
                      CustomTextField(
                        label: 'Phone',
                        hintText: 'Enter your phone number',
                        prefixIcon: Icons.phone,
                        controller: phoneController,
                      ),
                      SizedBox(height: 2.h),
                      CustomTextField(
                        label: 'Street Address',
                        hintText: 'Enter your street address',
                        prefixIcon: Icons.home,
                        controller: streeAddressController,
                      ),
                      SizedBox(height: 2.h),

                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              label: 'City',
                              hintText: 'Enter your city',
                              prefixIcon: Icons.location_city,
                              controller: cityController,
                            ),
                          ),
                          SizedBox(width: 2.w),
                          Expanded(
                            child: CustomTextField(
                              label: 'State',
                              hintText: 'Enter your state',
                              prefixIcon: Icons.map,
                              controller: stateController,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              label: 'Postal Code',
                              hintText: 'Enter your postal code',
                              prefixIcon: Icons.local_post_office,
                              controller: postalCodeController,
                            ),
                          ),
                          SizedBox(width: 2.w),
                          Expanded(
                            child: CustomTextField(
                              label: 'Country',
                              hintText: 'Enter your country',
                              prefixIcon: Icons.public,
                              controller: countryController,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 3.h),

                      Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              text: "Cancel",
                              onPressed: () {
                                Get.to(() => PersonalInformation());
                              },
                              isOutlined: true,
                              height: 6.h,
                              backgroundColor: AppColors.textMuted,
                              textColor: AppColors.textPrimary,
                            ),
                          ),
                          SizedBox(width: 2.w),
                          Expanded(
                            child: CustomButton(
                              text: "Save",
                              onPressed: () {
                                AppSnackbar.show(
                                  title: "Success",
                                  message:
                                      "Personal information updated successfully.",
                                  isSuccess: true,
                                );

                                Get.off(() => PersonalInformation());
                              },
                              height: 6.h,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ).paddingSymmetric(horizontal: 4.w),
        ],
      ),
    );
  }
}
