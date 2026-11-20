import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:raiser_amc/core/theme/app_colors.dart';
import 'package:raiser_amc/core/theme/app_fonts.dart';
import 'package:raiser_amc/core/utils/custom_app_bar.dart';
import 'package:raiser_amc/core/utils/custom_button.dart';
import 'package:raiser_amc/core/utils/custom_side_drawer.dart';
import 'package:raiser_amc/core/utils/custom_text_field.dart';
import 'package:sizer/sizer.dart';

class CreateClientsScreen extends StatefulWidget {
  const CreateClientsScreen({super.key});

  @override
  State<CreateClientsScreen> createState() => _CreateClientsScreenState();
}

class _CreateClientsScreenState extends State<CreateClientsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController altPhoneController = TextEditingController();
  final TextEditingController gstController = TextEditingController();

  final TextEditingController streetAddressController = TextEditingController();
  final TextEditingController landmarkController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController countryController = TextEditingController(
    text: 'India',
  );
  final TextEditingController mapLinkController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  final TextEditingController portalPasswordController =
      TextEditingController();
  bool obscurePortalPassword = true;
  int portalPasswordStrength = 2;
  int currentStep = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomSideDrawer(activeMenuId: 'clients'),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 6.h),
              CustomAppBar(
                title: 'Create Client',
                isBack: true,
                isRightMenu: true,
                onMenuTap: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
              ).paddingSymmetric(horizontal: 4.w),
              SizedBox(height: 2.h),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                  child: Column(
                    children: [
                      if (currentStep == 1) ...[
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(4.w),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(22),
                            border: Border.all(
                              color: AppColors.white.withOpacity(0.9),
                              width: 1.2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.white.withOpacity(1),
                                offset: const Offset(-5, -5),
                                blurRadius: 12,
                                spreadRadius: 1,
                              ),
                              BoxShadow(
                                color: AppColors.black.withOpacity(0.12),
                                offset: const Offset(0, 10),
                                blurRadius: 24,
                                spreadRadius: 1,
                              ),
                              BoxShadow(
                                color: AppColors.black.withOpacity(0.06),
                                offset: const Offset(4, 6),
                                blurRadius: 14,
                                spreadRadius: 0,
                              ),
                              BoxShadow(
                                color: AppColors.primary.withOpacity(0.07),
                                offset: const Offset(0, 4),
                                blurRadius: 16,
                                spreadRadius: -2,
                              ),
                              BoxShadow(
                                color: AppColors.black.withOpacity(0.025),
                                offset: const Offset(0, 2),
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 38,
                                    height: 38,
                                    decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.person_outline_rounded,
                                      color: AppColors.white,
                                      size: 19.sp,
                                    ),
                                  ),
                                  SizedBox(width: 3.w),
                                  Text(
                                    'Basic Information',
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      fontFamily: AppFonts.bold,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 1.6.h),
                              Divider(
                                height: 1,
                                thickness: 1,
                                color: AppColors.borderLight,
                              ),
                              SizedBox(height: 1.8.h),
                              CustomTextField(
                                hintText: 'John Doe',
                                controller: fullNameController,
                                inputType: TextInputType.text,
                                prefixIcon: Icons.person,
                                label: 'Full Name',
                              ),
                              SizedBox(height: 1.8.h),
                              CustomTextField(
                                label: 'Business / Company Name',
                                hintText:
                                    'e.g. Patel Traders, Sunshine Hospital',
                                prefixIcon: Icons.apartment_rounded,
                                controller: companyNameController,
                              ),
                              SizedBox(height: 1.8.h),
                              CustomTextField(
                                hintText: 'john@example.com',
                                prefixIcon: Icons.mail_outline_rounded,
                                inputType: TextInputType.emailAddress,
                                controller: emailController,
                                label: 'Email Address',
                              ),
                              SizedBox(height: 1.8.h),
                              CustomTextField(
                                hintText: 'Enter your phone number',
                                prefixIcon: Icons.phone,
                                inputType: TextInputType.phone,
                                controller: phoneController,
                                label: 'Phone Number',
                              ),
                              SizedBox(height: 1.8.h),
                              CustomTextField(
                                label: 'Alternate Phone / WhatsApp',
                                hintText: '9876543211 (Optional)',
                                prefixIcon: Icons.chat_bubble_outline_rounded,
                                inputType: TextInputType.phone,
                                controller: altPhoneController,
                              ),
                              SizedBox(height: 1.8.h),
                              CustomTextField(
                                label: 'GST Number (GSTIN)',
                                hintText: '24AAAAA0000A1Z5 (Optional)',
                                prefixIcon: Icons.credit_card_outlined,
                                controller: gstController,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(4.w),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(22),
                            border: Border.all(
                              color: AppColors.white,
                              width: 1.5,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.white,
                                offset: const Offset(-6, -6),
                                blurRadius: 14,
                                spreadRadius: 1,
                              ),
                              BoxShadow(
                                color: AppColors.black.withOpacity(0.14),
                                offset: const Offset(0, 12),
                                blurRadius: 26,
                                spreadRadius: 1,
                              ),
                              BoxShadow(
                                color: AppColors.black.withOpacity(0.07),
                                offset: const Offset(5, 7),
                                blurRadius: 16,
                                spreadRadius: 0,
                              ),
                              BoxShadow(
                                color: AppColors.primary.withOpacity(0.10),
                                offset: const Offset(0, 5),
                                blurRadius: 20,
                                spreadRadius: -2,
                              ),
                              BoxShadow(
                                color: AppColors.black.withOpacity(0.04),
                                offset: const Offset(0, 2),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 38,
                                    height: 38,
                                    decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.lock_outline_rounded,
                                      color: AppColors.white,
                                      size: 19.sp,
                                    ),
                                  ),
                                  SizedBox(width: 3.w),
                                  Text(
                                    'Security',
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      fontFamily: AppFonts.bold,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 1.6.h),
                              Divider(
                                height: 1,
                                thickness: 1,
                                color: AppColors.borderLight,
                              ),
                              SizedBox(height: 1.6.h),
                              CustomTextField(
                                label: 'Password for Client Portal',
                                hintText: 'Enter password',
                                prefixIcon: Icons.lock_outline_rounded,
                                controller: portalPasswordController,
                                isPassword: true,
                                onChanged: (val) {
                                  setState(() {
                                    if (val.isEmpty) {
                                      portalPasswordStrength = 0;
                                    } else if (val.length < 6) {
                                      portalPasswordStrength = 1;
                                    } else if (val.length < 8) {
                                      portalPasswordStrength = 2;
                                    } else {
                                      portalPasswordStrength = 3;
                                    }
                                  });
                                },
                              ),
                              SizedBox(height: 1.2.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Minimum 8 characters',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontFamily: AppFonts.regular,
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                  Row(
                                    children: List.generate(3, (index) {
                                      final bool isActive =
                                          index < portalPasswordStrength;
                                      return Container(
                                        width: 18,
                                        height: 4,
                                        margin: EdgeInsets.only(
                                          left: index > 0 ? 5 : 0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: isActive
                                              ? AppColors.success
                                              : AppColors.divider,
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                      if (currentStep == 2) ...[
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(4.w),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(22),
                            border: Border.all(
                              color: AppColors.white.withOpacity(0.95),
                              width: 1.2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.white.withOpacity(0.95),
                                offset: const Offset(-4, -4),
                                blurRadius: 10,
                                spreadRadius: 1,
                              ),
                              BoxShadow(
                                color: AppColors.black.withOpacity(0.08),
                                offset: const Offset(0, 8),
                                blurRadius: 20,
                                spreadRadius: 1,
                              ),
                              BoxShadow(
                                color: AppColors.black.withOpacity(0.03),
                                offset: const Offset(0, 2),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 38,
                                    height: 38,
                                    decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.location_on_outlined,
                                      color: AppColors.white,
                                      size: 19.sp,
                                    ),
                                  ),
                                  SizedBox(width: 3.w),
                                  Expanded(
                                    child: Text(
                                      'Address & Location',
                                      style: TextStyle(
                                        fontSize: 15.5.sp,
                                        fontFamily: AppFonts.bold,
                                        color: AppColors.textPrimary,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.surfaceSecondary,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      'Optional',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: AppFonts.semiBold,
                                        color: AppColors.textPrimary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 1.6.h),
                              Divider(
                                height: 1,
                                thickness: 1,
                                color: AppColors.borderLight,
                              ),
                              SizedBox(height: 1.8.h),
                              CustomTextField(
                                label: 'Street Address',
                                hintText: 'Shop / Flat No, Building, Street',
                                controller: streetAddressController,
                                prefixIcon: Icons.home_outlined,
                              ),
                              SizedBox(height: 1.8.h),
                              CustomTextField(
                                label: 'Landmark / Area',
                                hintText: 'Near XYZ Circle, Opp. Bank',
                                prefixIcon: Icons.location_on_outlined,
                                controller: landmarkController,
                              ),
                              SizedBox(height: 1.8.h),
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomTextField(
                                      label: 'Pincode',
                                      hintText: '400001',
                                      inputType: TextInputType.number,
                                      controller: pincodeController,
                                      prefixIcon: Icons.pin_drop_outlined,
                                    ),
                                  ),
                                  SizedBox(width: 3.w),
                                  Expanded(
                                    child: CustomTextField(
                                      label: 'City',
                                      hintText: 'Mumbai',
                                      controller: cityController,
                                      prefixIcon: Icons.location_on_outlined,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 1.8.h),
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomTextField(
                                      label: 'State',
                                      hintText: 'Maharashtra',
                                      controller: stateController,
                                      prefixIcon: Icons.map_outlined,
                                    ),
                                  ),
                                  SizedBox(width: 3.w),
                                  Expanded(
                                    child: CustomTextField(
                                      label: 'Country',
                                      hintText: 'India',
                                      controller: countryController,
                                      prefixIcon: Icons.public_outlined,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 1.8.h),
                              CustomTextField(
                                hintText: 'https://maps.google.com/?q=...',
                                prefixIcon: Icons.language_rounded,
                                inputType: TextInputType.url,
                                controller: mapLinkController,
                                label: 'Google Map Link',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(4.w),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(22),
                            border: Border.all(
                              color: AppColors.white.withOpacity(0.95),
                              width: 1.2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.white.withOpacity(0.95),
                                offset: const Offset(-4, -4),
                                blurRadius: 10,
                                spreadRadius: 1,
                              ),
                              BoxShadow(
                                color: AppColors.black.withOpacity(0.08),
                                offset: const Offset(0, 8),
                                blurRadius: 20,
                                spreadRadius: 1,
                              ),
                              BoxShadow(
                                color: AppColors.black.withOpacity(0.03),
                                offset: const Offset(0, 2),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 38,
                                    height: 38,
                                    decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.description_outlined,
                                      color: AppColors.white,
                                      size: 19.sp,
                                    ),
                                  ),
                                  SizedBox(width: 3.w),
                                  Expanded(
                                    child: Text(
                                      'Notes & Special Instructions',
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        fontFamily: AppFonts.bold,
                                        color: AppColors.textPrimary,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.surfaceSecondary,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      'Optional',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: AppFonts.semiBold,
                                        color: AppColors.textMuted,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 1.6.h),
                              Divider(
                                height: 1,
                                thickness: 1,
                                color: AppColors.borderLight,
                              ),
                              SizedBox(height: 1.8.h),
                              CustomTextField(
                                label:
                                    'Notes & Special Instructions (Optional)',
                                hintText:
                                    'e.g. Visiting hours (10 AM to 6 PM), gate pass required, keys with reception/security...',
                                controller: notesController,
                                prefixIcon: Icons.note_add,
                                minLines: 3,
                                maxLines: 3,
                              ),
                            ],
                          ),
                        ),
                      ],
                      SizedBox(height: 3.h),
                      Row(
                        children: [
                          if (currentStep == 2) ...[
                            Expanded(
                              child: CustomButton(
                                text: "Previous",
                                isOutlined: true,
                                height: 6.h,
                                fontSize: 15.sp,
                                onPressed: () {
                                  setState(() {
                                    currentStep = 1;
                                  });
                                },
                              ),
                            ),
                            SizedBox(width: 3.w),
                          ],
                          Expanded(
                            child: CustomButton(
                              text: currentStep == 1 ? 'Next' : 'Create Client',
                              height: 6.h,
                              fontSize: 15.sp,
                              icon: currentStep == 1
                                  ? Icons.arrow_forward_rounded
                                  : Icons.check_circle_outline_rounded,
                              onPressed: () {
                                if (currentStep == 1) {
                                  setState(() {
                                    currentStep = 2;
                                  });
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Connect your Create Client API here.',
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 3.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
