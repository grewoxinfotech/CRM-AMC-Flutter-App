import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:raiser_amc/core/theme/app_colors.dart';
import 'package:raiser_amc/core/theme/app_fonts.dart';
import 'package:raiser_amc/core/utils/custom_app_bar.dart';
import 'package:raiser_amc/core/utils/custom_button.dart';
import 'package:raiser_amc/core/utils/custom_snackbar.dart';
import 'package:raiser_amc/ui/company_panel/company_profile/view/edit_personal_information.dart';
import 'package:sizer/sizer.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({super.key});

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
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
                title: "Personal Information",
                isBack: true,
                isRightMenu: true,
              ).paddingSymmetric(horizontal: 4.w),

              SizedBox(height: 2.h),

              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 4.w,
                    vertical: 1.h,
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.white.withOpacity(0.9),
                              offset: const Offset(-4, -4),
                              blurRadius: 10,
                              spreadRadius: 1,
                            ),

                            BoxShadow(
                              color: AppColors.black.withOpacity(0.08),
                              offset: const Offset(0, 8),
                              blurRadius: 20,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 80,
                                      padding: const EdgeInsets.all(3.5),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColors.black.withOpacity(
                                              0.16,
                                            ),
                                            blurRadius: 14,
                                            spreadRadius: 1,
                                            offset: const Offset(0, 5),
                                          ),
                                          BoxShadow(
                                            color: const Color(
                                              0xFF3B5BDB,
                                            ).withOpacity(0.10),
                                            blurRadius: 18,
                                            spreadRadius: 2,
                                            offset: const Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      child: ClipOval(
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xFF3B5BDB),
                                                Color(0xFF4C6EF5),
                                              ],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                            ),
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                            'GI',
                                            style: TextStyle(
                                              color: AppColors.white,
                                              fontSize: 24.sp,
                                              fontFamily: AppFonts.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 3.w),
                                // Company Details
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Flexible(
                                            child: Text(
                                              'Grewox Infotech',
                                              style: TextStyle(
                                                fontSize: 17.sp,
                                                fontFamily: AppFonts.bold,
                                                color: AppColors.textPrimary,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 0.5.h),
                                      // Role Badge
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppColors.primary.withOpacity(
                                            0.1,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            6,
                                          ),
                                          border: Border.all(
                                            color: AppColors.primary,
                                          ),
                                        ),
                                        child: Text(
                                          'COMPANYADMIN',
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontFamily: AppFonts.semiBold,
                                            color: AppColors.primary,
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 1.h),
                                      // Email Row
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.mail_outline_rounded,
                                            size: 18.sp,
                                            color: AppColors.primary,
                                          ),
                                          SizedBox(width: 6),
                                          Flexible(
                                            child: Text(
                                              'grewoxinfotech@gmail.com',
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                color: AppColors.textSecondary,
                                                fontFamily: AppFonts.semiBold,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 2.h),
                            Divider(
                              height: 1,
                              thickness: 1,
                              color: AppColors.divider,
                            ),
                            SizedBox(height: 2.h),
                            // Bottom Buttons Row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Edit Profile Button
                                CustomButton(
                                  onPressed: () {
                                    Get.to(() => EditPersonalInformation());
                                  },
                                  text: 'Edit Profile',
                                  height: 6.h,
                                  width: 50.w,
                                  textColor: AppColors.white,
                                  fontSize: 14.sp,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 2.h),

                      /// Contact Details Card

                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: AppColors.white.withOpacity(0.9),
                            width: 1,
                          ),
                          boxShadow: [

                            BoxShadow(
                              color: AppColors.black.withOpacity(0.10),
                              offset: const Offset(0, 8),
                              blurRadius: 22,
                              spreadRadius: 1,
                            ),


                            BoxShadow(
                              color: AppColors.black.withOpacity(0.04),
                              offset: const Offset(0, 2),
                              blurRadius: 8,
                              spreadRadius: 0,
                            ),


                            BoxShadow(
                              color: AppColors.white.withOpacity(0.9),
                              offset: const Offset(-3, -3),
                              blurRadius: 10,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Header Row: Blue Indicator + CONTACT DETAILS
                            Row(
                              children: [
                                Container(
                                  width: 4,
                                  height: 18,
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                SizedBox(width: 3.w),
                                Text(
                                  'CONTACT DETAILS',
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontFamily: AppFonts.bold,
                                    color: AppColors.textPrimary,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 2.h),
                            Divider(
                              height: 1,
                              thickness: 1,
                              color: AppColors.divider,
                            ),
                            SizedBox(height: 2.h),

                            // 1. Phone Number Row
                            Row(
                              children: [
                                Container(
                                  width: 44,
                                  height: 44,
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Icon(
                                    Icons.phone_outlined,
                                    color: AppColors.white,
                                    size: 20.sp,
                                  ),
                                ),
                                SizedBox(width: 3.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'PHONE NUMBER',
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          fontFamily: AppFonts.bold,
                                          color: AppColors.textSecondary,
                                          letterSpacing: 0.4,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'Not provided',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontFamily: AppFonts.regular,

                                          color: AppColors.textPrimary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 2.h),
                            Divider(
                              height: 1,
                              thickness: 1,
                              color: AppColors.divider,
                            ),
                            SizedBox(height: 2.h),

                            Row(
                              children: [
                                Container(
                                  width: 44,
                                  height: 44,
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Icon(
                                    Icons.mail_outline_rounded,
                                    color: AppColors.white,
                                    size: 20,
                                  ),
                                ),
                                SizedBox(width: 3.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'EMAIL ADDRESS',
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          fontFamily: AppFonts.bold,
                                          color: AppColors.textSecondary,
                                          letterSpacing: 0.4,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        'leadgoes@gmail.com',
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          fontFamily: AppFonts.regular,
                                          color: AppColors.textPrimary,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Clipboard.setData(
                                      ClipboardData(text: 'leadgoes@gmail.com'),
                                    );
                                    AppSnackbar.show(
                                      title: 'Copied',
                                      message:
                                          'Email address copied successfully',
                                      isSuccess: true,
                                    );
                                  },
                                  icon:  Icon(
                                    Icons.copy_rounded,
                                    size: 20.sp,
                                    color: AppColors.primary,
                                  ),
                                  constraints: const BoxConstraints(),
                                  padding: const EdgeInsets.all(6),
                                ),
                              ],
                            ),

                             SizedBox(height: 2.h),
                             Divider(
                              height: 1,
                              thickness: 1,
                              color: AppColors.divider,
                            ),
                             SizedBox(height: 2.h),

                            // 3. Official Website Row
                            Row(
                              children: [
                                Container(
                                  width: 44,
                                  height: 44,
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child:  Icon(
                                    Icons.language_rounded,
                                    color: AppColors.white,
                                    size: 20.sp,
                                  ),
                                ),
                                 SizedBox(width: 3.w),
                                 Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'OFFICIAL WEBSITE',
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.textSecondary,
                                          letterSpacing: 0.4,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'www.grewoxinfotech.com',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: AppFonts.regular,
                                          color: AppColors.primary,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon:  Icon(
                                    Icons.open_in_new_rounded,
                                    size: 20.sp,
                                    color: AppColors.primary,
                                  ),
                                  constraints:  BoxConstraints(),
                                  padding:  EdgeInsets.all(6),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 2.h),

                      /// Location Details Card

                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: const Color(0xFFEFF1F5),
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF1E293B).withOpacity(0.08),
                              offset: const Offset(0, 10),
                              blurRadius: 24,
                              spreadRadius: 0,
                            ),
                            BoxShadow(
                              color: const Color(0xFF1E293B).withOpacity(0.03),
                              offset: const Offset(0, 3),
                              blurRadius: 8,
                              spreadRadius: 0,
                            ),
                            BoxShadow(
                              color: AppColors.white,
                              offset: const Offset(-3, -3),
                              blurRadius: 8,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Header Row: Blue Indicator + LOCATION INFORMATION
                            Row(
                              children: [
                                Container(
                                  width: 4,
                                  height: 18,
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                SizedBox(width: 3.w),
                                Text(
                                  'LOCATION INFORMATION',
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontFamily: AppFonts.bold,
                                    color: AppColors.textPrimary,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 2.h),
                            Divider(
                              height: 1,
                              thickness: 1,
                              color: AppColors.divider,
                            ),
                            SizedBox(height: 2.h),

                            // Street Address Row
                            Row(
                              children: [
                                Container(
                                  width: 44,
                                  height: 44,
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Icon(
                                    Icons.location_on_outlined,
                                    color: AppColors.white,
                                    size: 20.sp,
                                  ),
                                ),
                                SizedBox(width: 3.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'STREET ADDRESS',
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          fontFamily: AppFonts.bold,
                                          color: AppColors.textSecondary,
                                          letterSpacing: 0.4,
                                        ),
                                      ),
                                       SizedBox(height: 4),
                                      Text(
                                        'Not provided',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontFamily: AppFonts.regular,
                                          color: AppColors.textPrimary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 2.h),

                            // Inner Light Box containing 2x2 Grid
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: _buildLocationBox(
                                        label: 'CITY',
                                        value: 'N/A',
                                      ),
                                    ),
                                    SizedBox(width: 3.w),
                                    Expanded(
                                      child: _buildLocationBox(
                                        label: 'STATE',
                                        value: 'N/A',
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 1.5.h),
                                Row(
                                  children: [
                                    Expanded(
                                      child: _buildLocationBox(
                                        label: 'POSTAL CODE',
                                        value: 'N/A',
                                      ),
                                    ),
                                    SizedBox(width: 3.w),
                                    Expanded(
                                      child: _buildLocationBox(
                                        label: 'COUNTRY',
                                        value: 'N/A',
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),


                    ],
                  ),
                ),
              ),

              SizedBox(height: 2.h),
            ],
          ),
        ],
      ),
    );
  }


  Widget _buildLocationBox({
    required String label,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFEDF0F5),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF334155).withOpacity(0.06),
            offset: const Offset(0, 4),
            blurRadius: 10,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: AppColors.white,
            offset: const Offset(-2, -2),
            blurRadius: 5,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              fontFamily: AppFonts.bold,
              color: AppColors.textSecondary,
              letterSpacing: 0.4,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: TextStyle(
              fontSize: 15.sp,
              fontFamily: AppFonts.regular,
              color: AppColors.textPrimary,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
