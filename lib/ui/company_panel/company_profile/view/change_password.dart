import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raiser_amc/core/theme/app_colors.dart';
import 'package:raiser_amc/core/theme/app_fonts.dart';
import 'package:raiser_amc/core/utils/custom_app_bar.dart';
import 'package:raiser_amc/core/utils/custom_button.dart';
import 'package:raiser_amc/core/utils/custom_text_field.dart'; // તમારો CustomTextField પાથ ચેક કરી લેવો
import 'package:sizer/sizer.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool obscureCurrent = true;
  bool obscureNew = true;
  bool obscureConfirm = true;

  // Password Strength Validation Flags
  bool hasMinLength = false;
  bool hasLetterAndNumber = false;
  bool hasSpecialChar = false;

  void _checkPasswordStrength(String password) {
    setState(() {
      hasMinLength = password.length >= 8;
      hasLetterAndNumber =
          RegExp(r'[A-Za-z]').hasMatch(password) &&
          RegExp(r'[0-9]').hasMatch(password);
      hasSpecialChar = RegExp(r'[!@#\$%\^&\*]').hasMatch(password);
    });
  }

  int get _strengthScore {
    int score = 0;
    if (newPasswordController.text.isNotEmpty) score++;
    if (hasMinLength) score++;
    if (hasLetterAndNumber) score++;
    if (hasSpecialChar) score++;
    return score;
  }

  String get _strengthLabel {
    if (newPasswordController.text.isEmpty) return '';
    if (_strengthScore <= 1) return 'Weak';
    if (_strengthScore == 2) return 'Fair';
    if (_strengthScore == 3) return 'Strong';
    return 'Very Strong';
  }

  Color get _strengthColor {
    if (_strengthScore <= 1) return AppColors.error;
    if (_strengthScore == 2) return AppColors.warning;
    return AppColors.success;
  }

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

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
                title: 'Change Password',
                isBack: true,
                isRightMenu: true,
              ),

              SizedBox(height: 2.h),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ==========================================
                      // 1. Top 3D Blue Info Banner[cite: 14]
                      // ==========================================
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
                            BoxShadow(
                              color: AppColors.primary.withOpacity(0.10),
                              offset: const Offset(0, 6),
                              blurRadius: 16,
                              spreadRadius: 1,
                            ),
                            BoxShadow(
                              color: AppColors.white.withOpacity(0.95),
                              offset: const Offset(-3, -3),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 42,
                              height: 42,
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.primary.withOpacity(0.25),
                                    offset: const Offset(0, 4),
                                    blurRadius: 8,
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
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 13.5.sp,
                                    fontFamily: AppFonts.regular,
                                    color: AppColors.textSecondary,
                                    height: 1.45,
                                  ),
                                  children: [
                                    const TextSpan(
                                      text:
                                          'Enter your current password and choose a strong new password with at least ',
                                    ),
                                    TextSpan(
                                      text: '8 characters',
                                      style: TextStyle(
                                        fontFamily: AppFonts.bold,
                                        color: AppColors.textPrimary,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          ' including letters, numbers, and symbols.',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 2.5.h),

                      CustomTextField(
                        hintText: '••••••••••••',
                        prefixIcon: Icons.lock_outline_rounded,
                        controller: currentPasswordController,
                        label: 'Current Password',
                        isPassword: true,
                      ),

                      SizedBox(height: 2.2.h),


                      CustomTextField(
                        label: 'New Password',
                        hintText: 'Create strong new password',
                        prefixIcon: Icons.lock_outline_rounded,
                        controller: newPasswordController,
                        onChanged: _checkPasswordStrength,
                        isPassword: true,
                      ),

                      SizedBox(height: 1.8.h),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Password Strength',
                            style: TextStyle(
                              fontSize: 13.5.sp,
                              fontFamily: AppFonts.medium,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          Text(
                            _strengthLabel,
                            style: TextStyle(
                              fontSize: 13.5.sp,
                              fontFamily: AppFonts.bold,
                              color: _strengthColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 1.h),

                      // 4-Segment Progress Bar[cite: 14]
                      Row(
                        children: List.generate(4, (index) {
                          final isActive = index < _strengthScore;
                          return Expanded(
                            child: Container(
                              height: 5,
                              margin: EdgeInsets.only(right: index < 3 ? 6 : 0),
                              decoration: BoxDecoration(
                                color: isActive
                                    ? _strengthColor
                                    : AppColors.divider,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          );
                        }),
                      ),

                      SizedBox(height: 1.5.h),


                      _buildRuleRow(
                        isMet: hasMinLength,
                        text: 'At least 8 characters',
                      ),
                      SizedBox(height: 0.8.h),
                      _buildRuleRow(
                        isMet: hasLetterAndNumber,
                        text: 'Contains letters and at least 1 number',
                      ),
                      SizedBox(height: 0.8.h),
                      _buildRuleRow(
                        isMet: hasSpecialChar,
                        text: 'Contains a special character (!@#\$%^&*)',
                      ),

                      SizedBox(height: 2.2.h),


                      CustomTextField(
                        label: 'Confirm New Password',
                        hintText: 'Re-enter new password',
                        prefixIcon: Icons.lock_outline_rounded,
                        controller: confirmPasswordController,

                        isPassword: true,
                      ),

                      SizedBox(height: 3.5.h),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [

                          Expanded(
                            child: CustomButton(
                              text: 'Cancel',
                              onPressed: () {},
                              isOutlined: true,
                              height: 5.8.h,
                              backgroundColor: AppColors.textMuted,
                              textColor: AppColors.textPrimary,
                              fontSize: 14.5.sp,
                            ),
                          ),
                          SizedBox(width: 3.w),
                          // Update Password Button[cite: 14]
                          Expanded(
                            child: CustomButton(
                              onPressed: () {

                              },
                              text: 'Update',
                              height: 5.8.h,
                              textColor: AppColors.white,
                              fontSize: 15.sp,
                              iconAtStart: true,
                              icon: Icons.lock,
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
          ).paddingSymmetric(horizontal: 4.w),
        ],
      ),
    );
  }

  // Helper Widget for Password Validation Rules[cite: 14]
  Widget _buildRuleRow({required bool isMet, required String text}) {
    return Row(
      children: [
        Icon(
          isMet ? Icons.check_rounded : Icons.radio_button_unchecked_rounded,
          color: isMet ? AppColors.success : AppColors.iconMuted,
          size: 16.sp,
        ),
        SizedBox(width: 2.w),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 13.sp,
              fontFamily: AppFonts.medium,
              color: isMet ? AppColors.success : AppColors.textMuted,
            ),
          ),
        ),
      ],
    );
  }
}
