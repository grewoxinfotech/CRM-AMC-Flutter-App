import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raiser_amc/core/theme/app_colors.dart';
import 'package:raiser_amc/core/theme/app_fonts.dart';
import 'package:raiser_amc/core/utils/custom_app_bar.dart';
import 'package:raiser_amc/core/utils/custom_button.dart';
import 'package:raiser_amc/ui/company_panel/company_profile/view/change_password.dart';
import 'package:sizer/sizer.dart';

class CompanySecurityProfile extends StatefulWidget {
  const CompanySecurityProfile({super.key});

  @override
  State<CompanySecurityProfile> createState() => _CompanySecurityProfileState();
}

class _CompanySecurityProfileState extends State<CompanySecurityProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 6.h),
              CustomAppBar(title: 'Security', isBack: true, isRightMenu: true),

              SizedBox(height: 2.h),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 4.w,
                          vertical: 2.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.warningSurface,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: AppColors.warning.withOpacity(0.28),
                            width: 1.2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.warning.withOpacity(0.14),
                              offset: const Offset(0, 8),
                              blurRadius: 20,
                              spreadRadius: 1,
                            ),
                            BoxShadow(
                              color: AppColors.black.withOpacity(0.05),
                              offset: const Offset(0, 3),
                              blurRadius: 8,
                            ),
                            BoxShadow(
                              color: AppColors.white.withOpacity(0.95),
                              offset: const Offset(-3, -3),
                              blurRadius: 10,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Soft Yellow Shield Icon Box[cite: 11]
                                Container(
                                  width: 48,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(
                                      color: AppColors.warning.withOpacity(
                                        0.25,
                                      ),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.warning.withOpacity(
                                          0.16,
                                        ),
                                        offset: const Offset(2, 4),
                                        blurRadius: 8,
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
                                    Icons.verified_user_outlined,
                                    color: AppColors.warning,
                                    size: 22.sp,
                                  ),
                                ),
                                SizedBox(width: 3.5.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Account Security',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontFamily: AppFonts.bold,
                                          color: AppColors.textPrimary,
                                        ),
                                      ),
                                      SizedBox(height: 1.h),
                                      Text(
                                        'Ensure your account is using a strong password to stay secure.',
                                        style: TextStyle(
                                          fontSize: 13.5.sp,
                                          fontFamily: AppFonts.regular,
                                          color: AppColors.textSecondary,
                                          height: 1.35,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 1.8.h),

                            // Subtle Divider Line[cite: 11]
                            Divider(
                              height: 1,
                              thickness: 1,
                              color: AppColors.warning.withOpacity(0.18),
                            ),

                            SizedBox(height: 1.8.h),

                            Align(
                              alignment: Alignment.centerRight,
                              child: CustomButton(
                                text: 'Change Password',
                                onPressed: () {
                                  Get.to(()=>  ChangePassword());
                                },
                                width: 50.w,
                                height: 6.h,
                                fontSize: 14.sp,
                                icon: Icons.key,
                                iconAtStart: true,
                                backgroundColor: AppColors.white,
                                textColor: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 2.h),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Section Header: Blue Indicator + STATUS[cite: 12]
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
                              SizedBox(width: 2.5.w),
                              Text(
                                'STATUS',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontFamily: AppFonts.bold,
                                  color: AppColors.textPrimary,
                                  letterSpacing: 0.8,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 1.8.h),


                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(22),
                              border: Border.all(
                                color: AppColors.white.withOpacity(0.95),
                                width: 1.2,
                              ),
                              boxShadow: [
                                // Deep ambient black shadow
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

                                BoxShadow(
                                  color: AppColors.white.withOpacity(0.95),
                                  offset: const Offset(-4, -4),
                                  blurRadius: 10,
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {},
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(22),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 4.w,
                                      vertical: 2.h,
                                    ),
                                    child: Row(
                                      children: [
                                        // Lock Icon Box[cite: 12]
                                        Container(
                                          width: 44,
                                          height: 44,
                                          decoration: BoxDecoration(
                                            color: AppColors.primary,
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: AppColors.primary
                                                    .withOpacity(0.08),
                                                offset: const Offset(0, 3),
                                                blurRadius: 6,
                                              ),
                                            ],
                                          ),
                                          alignment: Alignment.center,
                                          child: Icon(
                                            Icons.lock_outline_rounded,
                                            color: AppColors.white,
                                            size: 20.sp,
                                          ),
                                        ),
                                        SizedBox(width: 3.5.w),

                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'PASSWORD',
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontFamily: AppFonts.bold,
                                                  color: AppColors.textMuted,
                                                  letterSpacing: 0.5,
                                                ),
                                              ),
                                              SizedBox(height: 0.5.h),
                                              Text(
                                                'Last updated recently',
                                                style: TextStyle(
                                                  fontSize: 15.sp,
                                                  fontFamily: AppFonts.semiBold,
                                                  color: AppColors.textPrimary,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Icon(
                                          Icons.chevron_right_rounded,
                                          color: AppColors.primary,
                                          size: 22.sp,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                Divider(
                                  height: 1,
                                  thickness: 1,
                                  color: AppColors.divider,
                                ),

                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 4.w,
                                    vertical: 2.h,
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 44,
                                        height: 44,
                                        decoration: BoxDecoration(
                                          color: AppColors.primary,
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppColors.primary
                                                  .withOpacity(0.08),
                                              offset: const Offset(0, 3),
                                              blurRadius: 6,
                                            ),
                                          ],
                                        ),
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.person_outline_rounded,
                                          color: AppColors.white,
                                          size: 20.sp,
                                        ),
                                      ),
                                      SizedBox(width: 3.5.w),
                                      // Label & Italic Value[cite: 12]
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'TWO-FACTOR AUTH',
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                fontFamily: AppFonts.bold,
                                                color: AppColors.textMuted,
                                                letterSpacing: 0.5,
                                              ),
                                            ),
                                            SizedBox(height: 0.5.h),
                                            Text(
                                              'Not enabled',
                                              style: TextStyle(
                                                fontSize: 15.sp,
                                                fontFamily: AppFonts.semiBold,

                                                color: AppColors.textSecondary,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      // Set Up Soft Blue Button[cite: 12]
                                      InkWell(
                                        onTap: () {},
                                        borderRadius: BorderRadius.circular(10),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 4.w,
                                            vertical: 1.h,
                                          ),
                                          decoration: BoxDecoration(
                                            color: AppColors.primary,
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: AppColors.primary
                                                    .withOpacity(0.10),
                                                offset: const Offset(0, 3),
                                                blurRadius: 6,
                                              ),
                                              BoxShadow(
                                                color: AppColors.white
                                                    .withOpacity(0.9),
                                                offset: const Offset(
                                                  -1.5,
                                                  -1.5,
                                                ),
                                                blurRadius: 4,
                                              ),
                                            ],
                                          ),
                                          child: Text(
                                            'Set Up',
                                            style: TextStyle(
                                              fontSize: 13.5.sp,
                                              fontFamily: AppFonts.bold,
                                              color: AppColors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 2.h,),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

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
                              SizedBox(width: 2.5.w),
                              Text(
                                'ACCESS CONTROL',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontFamily: AppFonts.bold,
                                  color: AppColors.textPrimary,
                                  letterSpacing: 0.8,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 1.8.h),


                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(22),
                              border: Border.all(
                                color: AppColors.white.withOpacity(0.95),
                                width: 1.2,
                              ),
                              boxShadow: [

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

                                BoxShadow(
                                  color: AppColors.white.withOpacity(0.95),
                                  offset: const Offset(-4, -4),
                                  blurRadius: 10,
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                            child: Column(
                              children: [

                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                                  child: Row(
                                    children: [

                                      Container(
                                        width: 44,
                                        height: 44,
                                        decoration: BoxDecoration(
                                          color: AppColors.primary,
                                          borderRadius: BorderRadius.circular(12),
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppColors.primary.withOpacity(0.08),
                                              offset: const Offset(0, 3),
                                              blurRadius: 6,
                                            ),
                                          ],
                                        ),
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.verified_user_outlined,
                                          color: AppColors.white,
                                          size: 20.sp,
                                        ),
                                      ),
                                      SizedBox(width: 3.5.w),

                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'ACCOUNT ROLE',
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                fontFamily: AppFonts.bold,
                                                color: AppColors.textMuted,
                                                letterSpacing: 0.5,
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Row(
                                              children: [
                                                Flexible(
                                                  child: Text(
                                                    'CompanyAdmin',
                                                    style: TextStyle(
                                                      fontSize: 15.sp,
                                                      fontFamily: AppFonts.bold,
                                                      color: AppColors.textPrimary,
                                                    ),
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                SizedBox(width: 2.w),

                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 2.w),
                                    ],
                                  ),
                                ),

                                Divider(
                                  height: 1,
                                  thickness: 1,
                                  color: AppColors.divider,
                                ),


                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                                  child: Row(
                                    children: [
                                      // Key Icon Box[cite: 13]
                                      Container(
                                        width: 44,
                                        height: 44,
                                        decoration: BoxDecoration(
                                          color: AppColors.primary,
                                          borderRadius: BorderRadius.circular(12),
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppColors.primary.withOpacity(0.08),
                                              offset: const Offset(0, 3),
                                              blurRadius: 6,
                                            ),
                                          ],
                                        ),
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.key_outlined,
                                          color: AppColors.white,
                                          size: 20.sp,
                                        ),
                                      ),
                                      SizedBox(width: 3.5.w),
                                      // Label & Standard Access Value[cite: 13]
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'PERMISSION LEVEL',
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                fontFamily: AppFonts.bold,
                                                color: AppColors.textMuted,
                                                letterSpacing: 0.5,
                                              ),
                                            ),
                                             SizedBox(height: 0.5.h),
                                            Text(
                                              'Standard Access',
                                              style: TextStyle(
                                                fontSize: 15.sp,
                                                fontFamily: AppFonts.bold,
                                                color: AppColors.textPrimary,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 5.h),
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
