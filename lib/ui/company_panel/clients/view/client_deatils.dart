import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:raiser_amc/core/theme/app_colors.dart';
import 'package:raiser_amc/core/theme/app_fonts.dart';
import 'package:raiser_amc/core/utils/custom_app_bar.dart';
import 'package:raiser_amc/core/utils/custom_side_drawer.dart';
import 'package:sizer/sizer.dart';

class ClientDetails extends StatefulWidget {
  const ClientDetails({super.key});

  @override
  State<ClientDetails> createState() => _ClientDetailsState();
}

class _ClientDetailsState extends State<ClientDetails> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomSideDrawer(activeMenuId: 'clients'),
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 6.h),
              CustomAppBar(
                title: 'Client Details',
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
                            // Top-left highlight
                            BoxShadow(
                              color: AppColors.white.withOpacity(1),
                              offset: const Offset(-5, -5),
                              blurRadius: 12,
                              spreadRadius: 1,
                            ),

                            // Bottom-right 3D shadow
                            BoxShadow(
                              color: AppColors.black.withOpacity(0.12),
                              offset: const Offset(5, 6),
                              blurRadius: 14,
                              spreadRadius: 1,
                            ),

                            // Soft ambient shadow
                            BoxShadow(
                              color: AppColors.black.withOpacity(0.05),
                              offset: const Offset(0, 4),
                              blurRadius: 18,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(
                                      color: AppColors.primary.withOpacity(
                                        0.15,
                                      ),
                                      width: 1,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.apartment_rounded,
                                    color: AppColors.white,
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
                                        'Shree Ram Hospital & Trauma Centre',
                                        style: TextStyle(
                                          fontSize: 16.5.sp,
                                          fontFamily: AppFonts.bold,
                                          color: AppColors.textPrimary,
                                          height: 1.25,
                                        ),
                                      ),
                                      SizedBox(height: 1.h),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppColors.successSurface,
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          border: Border.all(
                                            color: AppColors.success
                                                .withOpacity(0.35),
                                            width: 1,
                                          ),
                                        ),
                                        child: Text(
                                          'Active',
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontFamily: AppFonts.bold,
                                            color: AppColors.success,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 1.h),
                                      RichText(
                                        text: TextSpan(
                                          text: 'Contact Person: ',
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontFamily: AppFonts.regular,
                                            color: AppColors.textSecondary,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: 'Ramesh Patel',
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

                            SizedBox(height: 1.8.h),
                            Divider(
                              height: 1,
                              thickness: 1,
                              color: AppColors.divider,
                            ),
                            SizedBox(height: 1.8.h),

                            Wrap(
                              spacing: 2.2.w,
                              runSpacing: 1.1.h,
                              children: [
                                // Phone Chip[cite: 13]
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 3.w,
                                    vertical: 0.9.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(11),
                                    border: Border.all(
                                      color: AppColors.border,
                                      width: 1,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.phone_outlined,
                                        size: 18.sp,
                                        color: AppColors.primary,
                                      ),
                                      SizedBox(width: 1.8.w),
                                      Text(
                                        '9825012345',
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          fontFamily: AppFonts.medium,
                                          color: AppColors.textPrimary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 3.w,
                                    vertical: 0.9.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(11),
                                    border: Border.all(
                                      color: AppColors.border,
                                      width: 1,
                                    ),
                                  ),
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Alt: ',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: AppFonts.regular,
                                        color: AppColors.textSecondary,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: '9825012346',
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                            fontFamily: AppFonts.medium,
                                            color: AppColors.textPrimary,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                // Email Chip[cite: 13]
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 3.w,
                                    vertical: 0.9.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(11),
                                    border: Border.all(
                                      color: AppColors.border,
                                      width: 1,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.mail_outline_rounded,
                                        size: 18.sp,
                                        color: AppColors.primary,
                                      ),
                                      SizedBox(width: 1.8.w),
                                      Flexible(
                                        child: Text(
                                          'contact@shreeramhospital.com',
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                            fontFamily: AppFonts.medium,
                                            color: AppColors.textPrimary,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // Location Chip[cite: 13]
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 3.w,
                                    vertical: 0.9.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(11),
                                    border: Border.all(
                                      color: AppColors.border,
                                      width: 1,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        size: 18.sp,
                                        color: AppColors.primary,
                                      ),
                                      SizedBox(width: 1.5.w),
                                      Text(
                                        'Rajkot, Gujarat',
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          fontFamily: AppFonts.medium,
                                          color: AppColors.textPrimary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // GST Badge Chip[cite: 13]
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 3.w,
                                    vertical: 0.8.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: AppColors.border,
                                      width: 1,
                                    ),
                                  ),
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'GST:  ',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: AppFonts.semiBold,
                                        color: AppColors.primary,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: '24AABCS1234F1Z9',
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                            fontFamily: AppFonts.semiBold,
                                            color: AppColors.textPrimary,
                                            letterSpacing: 0.3,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 1.8.h),

                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(3.5.w),
                              decoration: BoxDecoration(
                                color: AppColors.background,
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                  color: AppColors.borderLight,
                                  width: 1,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.info_outline_rounded,
                                        size: 18.sp,
                                        color: AppColors.primary,
                                      ),
                                      SizedBox(width: 1.8.w),
                                      Text(
                                        'SPECIAL NOTES',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontFamily: AppFonts.bold,
                                          color: AppColors.textSecondary,
                                          letterSpacing: 0.6,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 0.8.h),
                                  Text(
                                    'Visiting hours 10:00 AM to 6:00 PM. Contact receptionist before visiting.',
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      fontFamily: AppFonts.regular,
                                      color: AppColors.textSecondary,
                                      height: 1.4,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 2.h,),


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
