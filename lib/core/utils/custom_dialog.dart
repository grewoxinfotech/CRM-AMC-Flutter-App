
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raiser_amc/core/theme/app_colors.dart';
import 'package:raiser_amc/core/theme/app_fonts.dart';
import 'package:sizer/sizer.dart';

void showCustomDialog({
  required String title,
  required String message,
  IconData? customIcon,
  bool isSuccess = false,
  String yesButtonText = "Yes",
  String noButtonText = "No",
  VoidCallback? onYes,
  VoidCallback? onNo,
}) {
  final Color primaryColor = isSuccess ? AppColors.success : Colors.red;
  final Color secondaryColor =
  isSuccess ? AppColors.primary : Colors.red;

  Get.dialog(
    Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 6.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 5.w,
              vertical: 3.5.h,
            ),
            decoration: BoxDecoration(
              color: AppColors.white.withOpacity(0.92),
              borderRadius: BorderRadius.circular(28),
              border: Border.all(
                color: AppColors.white.withOpacity(0.6),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.08),
                  blurRadius: 25,
                  offset: const Offset(0, 12),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Icon
                Container(
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: isSuccess
                          ? [
                        AppColors.primaryLight,
                        AppColors.primary,
                      ]
                          : [
                        secondaryColor,
                        primaryColor,
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: (isSuccess
                            ? AppColors.primary
                            : primaryColor)
                            .withOpacity(0.35),
                        blurRadius: 18,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Icon(
                    customIcon ??
                        (isSuccess
                            ? Icons.check_rounded
                            : Icons.priority_high_rounded),
                    color: Colors.white,
                    size: 32,
                  ),
                ),

                SizedBox(height: 3.h),

                // Title
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: AppColors.textPrimary,
                    fontFamily: AppFonts.bold,
                    letterSpacing: 0.3,
                  ),
                ),

                SizedBox(height: 1.5.h),

                // Message
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: AppColors.textSecondary,
                    height: 1.4,
                    fontFamily: AppFonts.semiBold,
                  ),
                ),

                SizedBox(height: 4.h),

                // Yes / No Buttons
                Row(
                  children: [
                    // No Button
                    Expanded(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () {
                          Get.back();
                          onNo?.call();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 1.6.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: AppColors.borderLight,
                              width: 1.2,
                            ),
                            color: AppColors.white,
                          ),
                          child: Center(
                            child: Text(
                              noButtonText,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.textPrimary,
                                fontFamily: AppFonts.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 3.w),

                    // Yes Button
                    Expanded(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () {
                          Get.back();
                          onYes?.call();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 1.6.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: isSuccess
                                  ? [
                                AppColors.primaryLight,
                                AppColors.primary,
                              ]
                                  : [
                                secondaryColor,
                                primaryColor,
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: (isSuccess
                                    ? AppColors.primary
                                    : primaryColor)
                                    .withOpacity(0.3),
                                blurRadius: 12,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              yesButtonText,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.white,
                                fontFamily: AppFonts.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ),
    barrierDismissible: false,
    barrierColor: AppColors.black.withOpacity(0.4),
  );
}
