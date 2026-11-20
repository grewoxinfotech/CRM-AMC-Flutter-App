import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:raiser_amc/core/theme/app_colors.dart';
import 'package:raiser_amc/core/theme/app_fonts.dart';
import 'package:raiser_amc/core/utils/custom_app_bar.dart';
import 'package:raiser_amc/core/utils/custom_button.dart';
import 'package:raiser_amc/ui/company_panel/company_profile/view/edit_company_details.dart';
import 'package:raiser_amc/ui/company_panel/company_profile/view/edit_personal_information.dart';
import 'package:sizer/sizer.dart';

class CompanyProfile extends StatefulWidget {
  const CompanyProfile({super.key});

  @override
  State<CompanyProfile> createState() => _CompanyProfileState();
}

class _CompanyProfileState extends State<CompanyProfile> {
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
                title: 'Company Profile',
                isBack: true,
                isRightMenu: true,
              ).paddingSymmetric(horizontal: 4.w),
              SizedBox(height: 2.h),

              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
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
                                          'Registered Company',
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
                                CustomButton(
                                  onPressed: () {
                                    Get.to(() => EditCompanyDetails());
                                  },
                                  text: 'Edit Company Details',
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

                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4.w,
                          vertical: 1.8.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.warningSurface,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: AppColors.warning.withOpacity(0.30),
                            width: 1.2,
                          ),
                          boxShadow: [
                            // Main elevated shadow
                            BoxShadow(
                              color: AppColors.warning.withOpacity(0.14),
                              offset: const Offset(0, 7),
                              blurRadius: 18,
                              spreadRadius: 1,
                            ),

                            // Soft ambient shadow
                            BoxShadow(
                              color: AppColors.black.withOpacity(0.045),
                              offset: const Offset(0, 3),
                              blurRadius: 8,
                              spreadRadius: 0,
                            ),

                            // Top white highlight
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
                                color: const Color(0xFFFEF3C7),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: AppColors.warning.withOpacity(0.22),
                                  width: 1,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.warning.withOpacity(0.18),
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
                                Icons.description_outlined,
                                color: AppColors.warning,
                                size: 20.sp,
                              ),
                            ),

                            SizedBox(width: 3.5.w),

                            Expanded(
                              child: Text(
                                'These official business details (Company Name, Address, Phone, and GSTIN) are automatically printed on all client Tax Invoices, Payment Receipts, and AMC Contracts.',
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

                      SizedBox(height: 2.h),

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
                                Expanded(
                                  child: Text(
                                    'BUSINESS CONTACT & TAX IDENTITY',
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      fontFamily: AppFonts.bold,
                                      color: AppColors.textPrimary,
                                      letterSpacing: 0.5,
                                    ),
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

                            _buildContactInfoRow(
                              icon: Icons.phone_outlined,
                              label: 'BUSINESS PHONE',
                              value: '9328996135',
                            ),
                            SizedBox(height: 2.h),

                            _buildContactInfoRow(
                              icon: Icons.mail_outline_rounded,
                              label: 'BUSINESS EMAIL',
                              value: 'grewoxinfotech@gmail.com',
                            ),
                            SizedBox(height: 2.h),

                            _buildContactInfoRow(
                              icon: Icons.description_outlined,
                              label: 'GSTIN / TAX NUMBER',
                              value: '24AAAGG1234H1Z5',
                              isRegularFont: true,
                            ),
                            SizedBox(height: 2.h),

                            _buildContactInfoRow(
                              icon: Icons.language_rounded,
                              label: 'WEBSITE',
                              value: 'https://grewox.com',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 2.h),

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
                                        '101, Corporate Hub, Near Iscon Cross Road, SG Highway',
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
                                        value: ' Ahmedabad',
                                      ),
                                    ),
                                    SizedBox(width: 3.w),
                                    Expanded(
                                      child: _buildLocationBox(
                                        label: 'STATE',
                                        value: 'Gujarat',
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
                                        value: '380015',
                                      ),
                                    ),
                                    SizedBox(width: 3.w),
                                    Expanded(
                                      child: _buildLocationBox(
                                        label: 'COUNTRY',
                                        value: 'India',
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 5.h),
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

  Widget _buildContactInfoRow({
    required IconData icon,
    required String label,
    required String value,
    bool isRegularFont = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Left Soft Blue Icon Box
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          child: Icon(icon, color: AppColors.white, size: 20.sp),
        ),
        SizedBox(width: 3.5.w),

        // Right Label & Value
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontFamily: AppFonts.bold,
                  color: AppColors.iconSecondary,
                  letterSpacing: 0.4,
                ),
              ),
              SizedBox(height: 3),
              Text(
                value,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontFamily: isRegularFont ? AppFonts.medium : AppFonts.bold,
                  color: AppColors.textSecondary,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLocationBox({required String label, required String value}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFEDF0F5), width: 1),
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
