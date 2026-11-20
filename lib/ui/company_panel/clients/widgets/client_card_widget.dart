import 'package:flutter/material.dart';
import 'package:raiser_amc/core/theme/app_colors.dart';
import 'package:raiser_amc/core/theme/app_fonts.dart';
import 'package:sizer/sizer.dart';

class ClientCardWidget extends StatelessWidget {
  final String name;
  final String companyName;
  final String status;
  final bool isActive;
  final String email;
  final String phone;
  final String altPhone;
  final String cityState;
  final String address;
  final String equipmentText;
  final String amcText;
  final String clientId;
  final VoidCallback? onViewMapTap;
  final VoidCallback? onViewTap;
  final VoidCallback? onEditTap;
  final VoidCallback? onCallTap;
  final VoidCallback? onDeleteTap;

  const ClientCardWidget({
    super.key,
    required this.name,
    required this.companyName,
    required this.status,
    required this.isActive,
    required this.email,
    required this.phone,
    this.altPhone = '',
    required this.cityState,
    required this.address,
    required this.equipmentText,
    required this.amcText,
    required this.clientId,
    this.onViewMapTap,
    this.onViewTap,
    this.onEditTap,
    this.onCallTap,
    this.onDeleteTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onViewTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(4.w),

        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.white.withOpacity(0.95),
            width: 1.2,
          ),
          boxShadow: [
            // Top-left white highlight
            BoxShadow(
              color: AppColors.white.withOpacity(1),
              offset: const Offset(-5, -5),
              blurRadius: 12,
              spreadRadius: 1,
            ),

            // Main bottom shadow - card elevation
            BoxShadow(
              color: AppColors.black.withOpacity(0.10),
              offset: const Offset(0, 9),
              blurRadius: 22,
              spreadRadius: 1,
            ),

            // Bottom-right depth shadow
            BoxShadow(
              color: AppColors.black.withOpacity(0.05),
              offset: const Offset(4, 5),
              blurRadius: 12,
              spreadRadius: 0,
            ),

            // Soft primary ambient glow
            BoxShadow(
              color: AppColors.primary.withOpacity(0.07),
              offset: const Offset(0, 5),
              blurRadius: 18,
              spreadRadius: -2,
            ),

            // Contact shadow
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontFamily: AppFonts.bold,
                          color: AppColors.primary,
                        ),
                      ),
                      SizedBox(height: 0.4.h),
                      Text(
                        companyName,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: AppFonts.medium,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 2.w),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: isActive
                        ? AppColors.successSurface
                        : AppColors.dangerSurface,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isActive
                          ? AppColors.success.withOpacity(0.28)
                          : AppColors.danger.withOpacity(0.28),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontFamily: AppFonts.bold,
                      color: isActive ? AppColors.success : AppColors.danger,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 1.6.h),

            // ==========================================
            // 2. CONTACT INFO SOFT BOX (Email & Phone)[cite: 14]
            // ==========================================
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 3.5.w, vertical: 1.4.h),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: AppColors.borderLight,
                  width: 1,
                ),
              ),
              child: Column(
                children: [
                  // Email Row[cite: 14]
                  Row(
                    children: [
                      Icon(
                        Icons.mail_outline_rounded,
                        size: 18.sp,
                        color: AppColors.primary,
                      ),
                      SizedBox(width: 2.5.w),
                      Expanded(
                        child: Text(
                          email,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: AppFonts.regular,
                            color: AppColors.textPrimary,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 0.9.h),
                  // Phone + Alt Phone Row[cite: 14]
                  Row(
                    children: [
                      Icon(
                        Icons.phone_outlined,
                        size: 18.sp,
                        color: AppColors.primary,
                      ),
                      SizedBox(width: 2.5.w),
                      Expanded(
                        child: RichText(
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: AppFonts.medium,
                              color: AppColors.textPrimary,
                            ),
                            children: [
                              TextSpan(text: phone),
                              if (altPhone.isNotEmpty) ...[
                                TextSpan(
                                  text: '  •  ',
                                  style: TextStyle(color: AppColors.primary),
                                ),
                                TextSpan(
                                  text: 'Alt: ',
                                  style: TextStyle(
                                    fontFamily: AppFonts.regular,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                                TextSpan(text: altPhone),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 1.6.h),


            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cityState,
                        style: TextStyle(
                          fontSize: 13.5.sp,
                          fontFamily: AppFonts.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        address,
                        style: TextStyle(
                          fontSize: 12.5.sp,
                          fontFamily: AppFonts.regular,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 2.w),
                InkWell(
                  onTap: onViewMapTap,
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 1.5.w,
                      vertical: 0.4.h,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 10.w,
                          height: 5.h,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primary.withOpacity(0.25),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Icon(
                              Icons.location_on_rounded,
                              size: 20.sp,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 1.h),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.8.h),
              decoration: BoxDecoration(
                color: AppColors.secondarySurface,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColors.secondary.withOpacity(0.18),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.inventory_2_outlined,
                    size: 16.sp,
                    color:  AppColors.primary,
                  ),
                  SizedBox(width: 2.w),
                  Flexible(
                    child: Text(
                      equipmentText,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontFamily: AppFonts.semiBold,
                        color: AppColors.secondary,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 0.9.h),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.8.h),
              decoration: BoxDecoration(
                color: AppColors.successSurface,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColors.success.withOpacity(0.22),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.verified_user_outlined,
                    size: 16.sp,
                    color: AppColors.success,
                  ),
                  SizedBox(width: 2.w),
                  Text(
                    amcText,
                    style: TextStyle(
                      fontSize: 12.5.sp,
                      fontFamily: AppFonts.semiBold,
                      color: AppColors.success,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 1.6.h),
            Divider(height: 1, thickness: 1, color: AppColors.divider),
            SizedBox(height: 1.3.h),


            Row(
              children: [
                Text(
                  'ID: $clientId',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: AppFonts.medium,
                    color: AppColors.textPrimary,
                  ),
                ),
                 Spacer(),

                InkWell(
                  onTap: onEditTap,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.edit_note_rounded,
                      size: 19.sp,
                      color: AppColors.white,
                    ),
                  ),
                ),
                SizedBox(width: 2.w),
                // Call Button[cite: 14]
                InkWell(
                  onTap: onCallTap,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.phone_outlined,
                      size: 18.sp,
                      color: AppColors.white,
                    ),
                  ),
                ),
                SizedBox(width: 2.w),
                // Delete Button[cite: 14]
                InkWell(
                  onTap: onDeleteTap,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: AppColors.danger,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.delete_outline_rounded,
                      size: 18.sp,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}