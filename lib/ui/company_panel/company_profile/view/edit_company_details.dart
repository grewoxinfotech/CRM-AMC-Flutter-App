import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:raiser_amc/core/theme/app_colors.dart';
import 'package:raiser_amc/core/theme/app_fonts.dart';
import 'package:raiser_amc/core/utils/custom_app_bar.dart';
import 'package:raiser_amc/core/utils/custom_button.dart';
import 'package:raiser_amc/core/utils/custom_snackbar.dart';
import 'package:raiser_amc/core/utils/custom_text_field.dart';
import 'package:raiser_amc/ui/company_panel/company_profile/view/company_profile.dart';
import 'package:sizer/sizer.dart';

class EditCompanyDetails extends StatefulWidget {
  const EditCompanyDetails({super.key});

  @override
  State<EditCompanyDetails> createState() => _EditCompanyDetailsState();
}

class _EditCompanyDetailsState extends State<EditCompanyDetails> {


  final TextEditingController companyNameController = TextEditingController(text: 'Grewox Infotech');
  final TextEditingController officialEmailController = TextEditingController(text: 'grewoxinfotech@gmail.com');
  final TextEditingController officialPhoneController = TextEditingController(text: '9328996135');
  final TextEditingController gstinController = TextEditingController(text: '24AAAGG1234H1Z5');
  final TextEditingController websiteController = TextEditingController(text: 'https://grewox.com');


  final TextEditingController streetAddressController = TextEditingController(
    text: '101, Corporate Hub, Near Iscon Cross Road, SG Highway',
  );
  final TextEditingController pincodeController = TextEditingController(text: '380015');
  final TextEditingController cityController = TextEditingController(text: 'Ahmedabad');
  final TextEditingController stateController = TextEditingController(text: 'Gujarat');
  final TextEditingController countryController = TextEditingController(text: 'India');



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 6.h,),

              CustomAppBar(
                title: 'Edit Company Details',
                isBack: true,
                isRightMenu: true,
              ),

              SizedBox(height: 2.h,),

              Expanded(child: SingleChildScrollView(
                child:Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 4.w,
                        vertical: 1.8.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primarySurface,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: AppColors.primary.withOpacity(0.22),
                          width: 1.2,
                        ),
                        boxShadow: [
                          // Main elevated blue shadow
                          BoxShadow(
                            color: AppColors.primary.withOpacity(0.12),
                            offset: const Offset(0, 7),
                            blurRadius: 18,
                            spreadRadius: 1,
                          ),
                          // Soft ambient black shadow
                          BoxShadow(
                            color: AppColors.black.withOpacity(0.045),
                            offset: const Offset(0, 3),
                            blurRadius: 8,
                            spreadRadius: 0,
                          ),
                          // Top-left white highlight (3D ઉપસેલો લુક આપવા માટે)
                          BoxShadow(
                            color: AppColors.white.withOpacity(0.95),
                            offset: const Offset(-3, -3),
                            blurRadius: 8,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // 3D Icon Box
                          Container(
                            width: 42,
                            height: 42,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: AppColors.primary.withOpacity(0.20),
                                width: 1,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.primary.withOpacity(0.16),
                                  offset: const Offset(2, 4),
                                  blurRadius: 8,
                                  spreadRadius: 0,
                                ),
                                BoxShadow(
                                  color: AppColors.white.withOpacity(0.9),
                                  offset: const Offset(-2, -2),
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.auto_awesome_outlined,
                              color: AppColors.white,
                              size: 20.sp,
                            ),
                          ),

                          SizedBox(width: 3.5.w),

                          // Info Text[cite: 7]
                          Expanded(
                            child: Text(
                              "Please provide your company's registered address and GSTIN. These details will automatically appear on your AMC contracts, service visits, and GST invoices.",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: AppFonts.medium,
                                color: AppColors.textSecondary,
                                height: 1.5,
                                letterSpacing: 0.15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 2.h,),

                    CustomTextField(
                      label: 'Company / Business Name',
                      hintText: 'Enter company or business name',
                      prefixIcon: Icons.apartment_rounded,
                      controller: companyNameController,
                    ),
                    SizedBox(height: 2.h),

                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            label: 'Official Email',
                            hintText: 'Enter official email',
                            inputType: TextInputType.emailAddress,
                            prefixIcon: Icons.mail_outline_rounded,
                            controller: officialEmailController,
                          ),
                        ),
                        SizedBox(width: 3.w),
                        Expanded(
                          child: CustomTextField(
                            label: 'Official Phone',
                            hintText: 'Enter official phone',
                            prefixIcon: Icons.phone_outlined,
                            inputType: TextInputType.number,
                            controller: officialPhoneController,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),

                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            label: 'GSTIN / Tax ID',
                            hintText: 'Enter GSTIN / Tax ID',
                            prefixIcon: Icons.description_outlined,
                            controller: gstinController,
                          ),
                        ),
                        SizedBox(width: 3.w),
                        Expanded(
                          child: CustomTextField(
                            label: 'Website',
                            hintText: 'Enter website URL',
                            prefixIcon: Icons.language_rounded,
                            controller: websiteController,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 2.h,),
                    Divider(
                      color: AppColors.divider,
                      thickness: 1.2,
                    ),
                    SizedBox(height: 1.5.h,),

                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: AppColors.primary,
                          size: 18.sp,
                        ),
                        SizedBox(width: 2.w),
                        Text(
                          'REGISTERED BUSINESS ADDRESS',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: AppFonts.bold,
                            color: AppColors.textPrimary,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),

                    CustomTextField(
                      label: 'Street / Office Address',
                      hintText: 'Enter street or office address',
                      prefixIcon: Icons.location_on_outlined,
                      controller: streetAddressController,
                    ),
                    SizedBox(height: 2.h),

                   
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            label: 'Pincode',
                            hintText: 'Enter pincode',
                            prefixIcon: Icons.location_on_outlined,
                            controller: pincodeController,
                          ),
                        ),
                        SizedBox(width: 3.w),
                        Expanded(
                          child: CustomTextField(
                            label: 'City',
                            hintText: 'Enter city',
                            prefixIcon: Icons.location_on_outlined,
                            controller: cityController,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),

                   
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            label: 'State',
                            hintText: 'Enter state',
                            controller: stateController,
                            prefixIcon: Icons.map,
                          ),
                        ),
                        SizedBox(width: 3.w),
                        Expanded(
                          child: CustomTextField(
                            label: 'Country',
                            hintText: 'Enter country',
                            prefixIcon: Icons.public,
                            controller: countryController,
                          ),
                        ),
                      ],
                    ),
                    
                    SizedBox(height: 3.h,),

                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            text: "Skip Now",
                            onPressed: () {
                              Get.to(() => CompanyProfile());
                            },
                            isOutlined: true,
                            height: 6.h,
                            fontSize: 15.sp,
                            backgroundColor: AppColors.textMuted,
                            textColor: AppColors.textPrimary,
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Expanded(
                          child: CustomButton(
                            text: "Save",
                            fontSize: 15.sp,
                            onPressed: () {
                              AppSnackbar.show(
                                title: "Success",
                                message:
                                "Company details updated successfully.",
                                isSuccess: true,
                              );

                              Get.off(() => CompanyProfile());
                            },
                            height: 6.h,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h,),

                  ],
                ),
              ))
            ],
          ).paddingSymmetric(horizontal: 4.w),
        ],
      ),
    );
  }
}
