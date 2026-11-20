import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raiser_amc/core/theme/app_colors.dart';
import 'package:raiser_amc/core/theme/app_fonts.dart';
import 'package:raiser_amc/core/utils/custom_app_bar.dart';
import 'package:raiser_amc/core/utils/custom_button.dart';
import 'package:raiser_amc/core/utils/custom_side_drawer.dart';
import 'package:raiser_amc/ui/company_panel/company_profile/view/comapny_%20security_profile.dart';
import 'package:raiser_amc/ui/company_panel/company_profile/view/company_profile.dart';
import 'package:raiser_amc/ui/company_panel/company_profile/view/personal_information.dart';
import 'package:raiser_amc/ui/company_panel/home_screen/widgets/dashboard_stat_card.dart';
import 'package:sizer/sizer.dart';


class CompanyHomeScreen extends StatefulWidget {
  const CompanyHomeScreen({super.key});

  @override
  State<CompanyHomeScreen> createState() => _CompanyHomeScreenState();
}

class _CompanyHomeScreenState extends State<CompanyHomeScreen> {
  final List<Map<String, String>> recentComplaints = [
    {
      'id': 'TKT-5037',
      'status': 'RESOLVED',
      'priority': 'CRITICAL',
      'date': '11/18/2026',
      'name': 'Ramesh Patel',
      'description':
          'Abnormal rattling sound observed in drive assembly during peak operation.',
    },
    {
      'id': 'TKT-5041',
      'status': 'RESOLVED',
      'priority': 'NORMAL',
      'date': '11/18/2026',
      'name': 'Pooja Sharma',
      'description':
          'Routine filter cleaning and preventative calibration report completed.',
    },
    {
      'id': 'TKT-5042',
      'status': 'OPEN',
      'priority': 'HIGH',
      'date': '11/17/2026',
      'name': 'Rahul Shah',
      'description':
          'Machine vibration issue reported during regular operation.',
    },
    {
      'id': 'TKT-5043',
      'status': 'ASSIGNED',
      'priority': 'NORMAL',
      'date': '11/17/2026',
      'name': 'Amit Patel',
      'description': 'Inspection request received for the AMC equipment.',
    },
    {
      'id': 'TKT-5044',
      'status': 'IN PROGRESS',
      'priority': 'HIGH',
      'date': '11/16/2026',
      'name': 'Neha Joshi',
      'description': 'Technician is checking the reported equipment issue.',
    },
  ];


  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer:  CustomSideDrawer(activeMenuId: 'dashboard'),
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 6.h),

              CustomAppBar(
                title: "Raiser AMC",
                subtitle: "Grevox Infotech",
                isBack: false,
                isMenu: true,
                isRightMenu: false,

                onMenuTap: () {
                  _scaffoldKey.currentState?.openDrawer();
                },

                onRightMenuTap: () {
                  _scaffoldKey.currentState?.openDrawer();
                },

                onProfileTap: () {
                  showMenu<String>(
                    context: context,
                    position: const RelativeRect.fromLTRB(180, 108, 10, 0),
                    elevation: 8,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    items: [
                      PopupMenuItem(
                        value: 'profile',
                        child: Row(
                          children: [
                            Icon(Icons.person_outline_rounded,
                                color: AppColors.primary, size: 18.sp),
                            SizedBox(width: 3.w),
                            Text('Profile'),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: 'security',
                        child: Row(
                          children: [
                            Icon(Icons.security_rounded,
                                color: AppColors.primary, size: 18.sp),
                            SizedBox(width: 3.w),
                            Text('Security'),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: 'company',
                        child: Row(
                          children: [
                            Icon(Icons.business_outlined,
                                color: AppColors.primary, size: 18.sp),
                            SizedBox(width: 3.w),
                            Text('Company Profile'),
                          ],
                        ),
                      ),
                    ],
                  ).then((value) {
                    if (value == null) return;

                    switch (value) {
                      case 'profile':
                        Get.to(() => PersonalInformation());
                        break;
                      case 'security':
                        Get.to(() => CompanySecurityProfile());
                        break;
                      case 'company':
                        Get.to(() => CompanyProfile());
                        break;
                    }
                  });
                },
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
                        width: double.infinity,
                        padding: EdgeInsets.all(3.5.w),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.white,
                              Color(0xFFF8FAFF),
                              Color(0xFFEFF6FF),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: const Color(0xFFE2EAF8),
                            width: 1,
                          ),
                          boxShadow: [
                            // Main elevated shadow
                            BoxShadow(
                              color: AppColors.primary.withValues(alpha: 0.13),
                              blurRadius: 18,
                              spreadRadius: 1,
                              offset: const Offset(0, 7),
                            ),

                            // Bottom depth shadow
                            BoxShadow(
                              color: AppColors.textPrimary.withValues(
                                alpha: 0.07,
                              ),
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),

                            // Top highlight
                            const BoxShadow(
                              color: Colors.white,
                              blurRadius: 4,
                              offset: Offset(-2, -2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // TITLE AND ADMIN
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Company Dashboard',
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          fontFamily: AppFonts.bold,
                                          color: AppColors.textPrimary,
                                        ),
                                      ),

                                      SizedBox(height: 0.5.h),

                                      Text(
                                        "Overview of Grewox Infotech's operations",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontFamily: AppFonts.regular,
                                          color: AppColors.textSecondary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // ADMIN BADGE
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 2.5.w,
                                    vertical: 0.6.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.primarySurface,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: AppColors.primary.withValues(
                                        alpha: 0.12,
                                      ),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.primary.withValues(
                                          alpha: 0.08,
                                        ),
                                        blurRadius: 5,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    'Admin',
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontFamily: AppFonts.semiBold,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 1.8.h),

                            Container(
                              width: double.infinity,
                              height: 5.5.h,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    AppColors.primaryLight,
                                    AppColors.primary,
                                    AppColors.primaryDark,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.primaryDark.withValues(
                                      alpha: 0.30,
                                    ),
                                    blurRadius: 9,
                                    offset: const Offset(0, 4),
                                  ),
                                  BoxShadow(
                                    color: AppColors.primary.withValues(
                                      alpha: 0.15,
                                    ),
                                    blurRadius: 5,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: CustomButton(
                                text: 'New AMC Contract',
                                width: 20.w,
                                onPressed: () {},
                                fontSize: 15.sp,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 2.h),

                      GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisSpacing: 3.w,
                        mainAxisSpacing: 2.h,
                        childAspectRatio: 1.35,
                        padding: EdgeInsets.zero,
                        children: [
                          DashboardStatCard(
                            title: 'TOTAL AMCS',
                            value: '2',
                            icon: Icons.settings_rounded,
                            iconColor: AppColors.primary,
                            iconBackground: AppColors.primarySurface,
                            onTap: () {},
                          ),

                          DashboardStatCard(
                            title: 'TOTAL REVENUE',
                            value: '₹28,500',
                            icon: Icons.currency_rupee_rounded,
                            iconColor: AppColors.success,
                            iconBackground: AppColors.successSurface,
                            onTap: () {},
                          ),

                          DashboardStatCard(
                            title: 'TOTAL USERS',
                            value: '5',
                            icon: Icons.groups_rounded,
                            iconColor: AppColors.secondary,
                            iconBackground: AppColors.secondarySurface,
                            onTap: () {},
                          ),

                          DashboardStatCard(
                            title: 'COMPLAINTS',
                            value: '3',
                            icon: Icons.warning_amber_rounded,
                            iconColor: AppColors.warning,
                            iconBackground: AppColors.warningSurface,
                            onTap: () {},
                          ),
                        ],
                      ),

                      SizedBox(height: 2.h),

                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(3.5.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(17),
                          border: Border.all(
                            color: const Color(0xFFE5EAF2),
                            width: 1,
                          ),
                          boxShadow: [
                            // White top highlight
                            BoxShadow(
                              color: Colors.white.withValues(alpha: 0.95),
                              blurRadius: 8,
                              spreadRadius: 1,
                              offset: const Offset(-3, -3),
                            ),

                            // Black bottom 3D shadow
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.10),
                              blurRadius: 10,
                              spreadRadius: 1,
                              offset: const Offset(4, 5),
                            ),

                            // Soft depth shadow
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.04),
                              blurRadius: 5,
                              offset: const Offset(1, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // HEADER
                            Row(
                              children: [
                                Container(
                                  height: 10.w,
                                  width: 10.w,
                                  decoration: BoxDecoration(
                                    color: AppColors.successSurface,
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                  child: Icon(
                                    Icons.currency_rupee_rounded,
                                    color: AppColors.success,
                                    size: 20.sp,
                                  ),
                                ),

                                SizedBox(width: 2.w),

                                Expanded(
                                  child: Text(
                                    'Financial Overview',
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      fontFamily: AppFonts.bold,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                ),

                                Text(
                                  'Billed: ₹28,500',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: AppFonts.medium,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 2.h),

                            // RECEIVED AND PENDING CARDS
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(2.5.w),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF0FDF8),
                                      borderRadius: BorderRadius.circular(13),
                                      border: Border.all(
                                        color: const Color(0xFFD1FAE5),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.white.withValues(
                                            alpha: 0.9,
                                          ),
                                          blurRadius: 4,
                                          offset: const Offset(-2, -2),
                                        ),
                                        BoxShadow(
                                          color: Colors.black.withValues(
                                            alpha: 0.04,
                                          ),
                                          blurRadius: 5,
                                          offset: const Offset(2, 3),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Received (Paid)',
                                          style: TextStyle(
                                            fontSize: 13.sp,
                                            fontFamily: AppFonts.medium,
                                            color: const Color(0xFF047857),
                                          ),
                                        ),

                                        SizedBox(height: 0.5.h),

                                        Text(
                                          '₹12,000',
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontFamily: AppFonts.bold,
                                            color: const Color(0xFF047857),
                                          ),
                                        ),

                                        SizedBox(height: 0.5.h),

                                        Text(
                                          '42.1% collected',
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontFamily: AppFonts.medium,
                                            color: const Color(0xFF059669),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                SizedBox(width: 2.5.w),

                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(2.5.w),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFFF5F5),
                                      borderRadius: BorderRadius.circular(13),
                                      border: Border.all(
                                        color: const Color(0xFFFEE2E2),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.white.withValues(
                                            alpha: 0.9,
                                          ),
                                          blurRadius: 4,
                                          offset: const Offset(-2, -2),
                                        ),
                                        BoxShadow(
                                          color: Colors.black.withValues(
                                            alpha: 0.04,
                                          ),
                                          blurRadius: 5,
                                          offset: const Offset(2, 3),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Pending',
                                          style: TextStyle(
                                            fontSize: 13.sp,
                                            fontFamily: AppFonts.medium,
                                            color: const Color(0xFFBE123C),
                                          ),
                                        ),

                                        SizedBox(height: 0.5.h),

                                        Text(
                                          '₹16,500',
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontFamily: AppFonts.bold,
                                            color: const Color(0xFFBE123C),
                                          ),
                                        ),

                                        SizedBox(height: 0.5.h),

                                        Text(
                                          '57.9% balance',
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontFamily: AppFonts.medium,
                                            color: const Color(0xFFE11D48),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 2.h),
                          ],
                        ),
                      ),

                      SizedBox(height: 2.h),

                      Column(
                        children: [
                          // ================= AMC OVERVIEW =================
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(3.w),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(17),
                              border: Border.all(
                                color: const Color(0xFFE5EAF2),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withValues(alpha: 0.95),
                                  blurRadius: 8,
                                  offset: const Offset(-3, -3),
                                ),
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.09),
                                  blurRadius: 10,
                                  offset: const Offset(3, 5),
                                ),
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.03),
                                  blurRadius: 4,
                                  offset: const Offset(1, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 10.w,
                                      width: 10.w,
                                      decoration: BoxDecoration(
                                        color: AppColors.primarySurface,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Icon(
                                        Icons.check_circle_outline_rounded,
                                        color: AppColors.primary,
                                        size: 20.sp,
                                      ),
                                    ),
                                    SizedBox(width: 2.w),
                                    Expanded(
                                      child: Text(
                                        'AMC Overview',
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          fontFamily: AppFonts.bold,
                                          color: AppColors.textPrimary,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 2.5.w,
                                        vertical: 0.5.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.primarySurface,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        '2 Total',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontFamily: AppFonts.medium,
                                          color: AppColors.primary,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 1.5.h),

                                Row(
                                  children: [
                                    Expanded(
                                      child: _overviewItem(
                                        title: 'Active',
                                        value: '2',
                                        color: AppColors.primary,
                                      ),
                                    ),
                                    SizedBox(width: 2.w),
                                    Expanded(
                                      child: _overviewItem(
                                        title: 'Expired',
                                        value: '0',
                                        color: AppColors.textSecondary,
                                      ),
                                    ),
                                    SizedBox(width: 2.w),
                                    Expanded(
                                      child: _overviewItem(
                                        title: 'Cancelled',
                                        value: '0',
                                        color: AppColors.textSecondary,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 2.h),

                          // ================= COMPLAINT OVERVIEW =================
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(3.5.w),
                            decoration: BoxDecoration(
                              color: AppColors.surface,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: AppColors.border,
                                width: 1,
                              ),
                              boxShadow: [
                                // Soft outer elevation shadow
                                BoxShadow(
                                  color: AppColors.textPrimary.withValues(
                                    alpha: 0.06,
                                  ),
                                  blurRadius: 20,
                                  spreadRadius: 2,
                                  offset: const Offset(0, 8),
                                ),
                                // Crisp close shadow for card definition
                                BoxShadow(
                                  color: AppColors.textPrimary.withValues(
                                    alpha: 0.03,
                                  ),
                                  blurRadius: 6,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // HEADER
                                Row(
                                  children: [
                                    Container(
                                      height: 10.w,
                                      width: 10.w,
                                      decoration: BoxDecoration(
                                        color: AppColors.warningSurface,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: AppColors.warning.withValues(
                                            alpha: 0.2,
                                          ),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColors.warning.withValues(
                                              alpha: 0.12,
                                            ),
                                            blurRadius: 8,
                                            offset: const Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      child: Icon(
                                        Icons.error_outline_rounded,
                                        color: AppColors.warning,
                                        size: 16.sp,
                                      ),
                                    ),
                                    SizedBox(width: 2.5.w),
                                    Expanded(
                                      child: Text(
                                        'Complaint Overview',
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          fontFamily: AppFonts.bold,
                                          color: AppColors.textPrimary,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 3.w,
                                        vertical: 0.6.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.primarySurface,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: AppColors.primary.withValues(
                                            alpha: 0.2,
                                          ),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColors.primary.withValues(
                                              alpha: 0.08,
                                            ),
                                            blurRadius: 6,
                                            offset: const Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: Text(
                                        '3 Total',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontFamily: AppFonts.bold,
                                          color: AppColors.primary,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 1.8.h),

                                // COMPLAINT GRID
                                GridView.count(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.zero,
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 2.5.w,
                                  mainAxisSpacing: 1.4.h,
                                  childAspectRatio: 1.32,
                                  children: [
                                    _complaintOverviewItem(
                                      title: 'Open',
                                      value: '0',
                                      color: AppColors.danger,
                                      surfaceColor: AppColors.dangerSurface,
                                    ),
                                    _complaintOverviewItem(
                                      title: 'Assigned',
                                      value: '0',
                                      color: AppColors.info,
                                      surfaceColor: AppColors.infoSurface,
                                    ),
                                    _complaintOverviewItem(
                                      title: 'In Progress',
                                      value: '0',
                                      color: AppColors.warning,
                                      surfaceColor: AppColors.warningSurface,
                                    ),
                                    _complaintOverviewItem(
                                      title: 'Resolved',
                                      value: '3',
                                      color: AppColors.success,
                                      surfaceColor: AppColors.successSurface,
                                      isHighlighted: true,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 2.h),

                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(3.5.w),
                            decoration: BoxDecoration(
                              color: AppColors.surface,
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(
                                color: AppColors.border,
                                width: 1,
                              ),
                              boxShadow: [
                                // Soft outer elevation shadow
                                BoxShadow(
                                  color: AppColors.textPrimary.withValues(
                                    alpha: 0.06,
                                  ),
                                  blurRadius: 18,
                                  spreadRadius: 1,
                                  offset: const Offset(0, 6),
                                ),
                                // Crisp close shadow
                                BoxShadow(
                                  color: AppColors.textPrimary.withValues(
                                    alpha: 0.03,
                                  ),
                                  blurRadius: 5,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // HEADER: Recent Complaints + View All
                                Row(
                                  children: [
                                    Container(
                                      height: 10.w,
                                      width: 10.w,
                                      decoration: BoxDecoration(
                                        color: AppColors.dangerSurface,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: AppColors.danger.withValues(
                                            alpha: 0.15,
                                          ),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColors.danger.withValues(
                                              alpha: 0.10,
                                            ),
                                            blurRadius: 6,
                                            offset: const Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: Icon(
                                        Icons.warning_amber_rounded,
                                        color: AppColors.danger,
                                        size: 20.sp,
                                      ),
                                    ),
                                    SizedBox(width: 2.5.w),
                                    Expanded(
                                      child: Text(
                                        'Recent Complaints',
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          fontFamily: AppFonts.bold,
                                          color: AppColors.textPrimary,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        // Navigate to all complaints
                                      },
                                      borderRadius: BorderRadius.circular(6),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 1.w,
                                          vertical: 0.4.h,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'View All',
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                fontFamily: AppFonts.bold,
                                                color: AppColors.danger,
                                              ),
                                            ),
                                            SizedBox(width: 0.5.w),
                                            Icon(
                                              Icons.chevron_right_rounded,
                                              color: AppColors.danger,
                                              size: 16.sp,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 1.5.h),

                                SizedBox(
                                  height: 21.h,
                                  child: ListView.separated(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 1.w,
                                      vertical: 0.5.h,
                                    ),
                                    itemCount: recentComplaints.length,
                                    separatorBuilder: (context, index) =>
                                        SizedBox(height: 1.2.h),
                                    itemBuilder: (context, index) {
                                      final item = recentComplaints[index];

                                      final status = item['status'] ?? '';
                                      final priority = item['priority'] ?? '';

                                      final Color statusColor =
                                          status == 'RESOLVED'
                                          ? AppColors.success
                                          : status == 'OPEN'
                                          ? AppColors.warning
                                          : status == 'ASSIGNED'
                                          ? AppColors.primary
                                          : AppColors.info;

                                      final Color statusSurface =
                                          status == 'RESOLVED'
                                          ? AppColors.successSurface
                                          : status == 'OPEN'
                                          ? AppColors.warningSurface
                                          : status == 'ASSIGNED'
                                          ? AppColors.primarySurface
                                          : AppColors.infoSurface;

                                      final Color priorityColor =
                                          priority == 'CRITICAL'
                                          ? AppColors.danger
                                          : priority == 'HIGH'
                                          ? AppColors.warning
                                          : AppColors.iconSecondary;

                                      final Color prioritySurface =
                                          priority == 'CRITICAL'
                                          ? AppColors.dangerSurface
                                          : priority == 'HIGH'
                                          ? AppColors.warningSurface
                                          : AppColors.surfaceSecondary;

                                      return Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.all(3.w),
                                        decoration: BoxDecoration(
                                          color: AppColors.background,
                                          // #F8FAFC
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          border: Border.all(
                                            color: AppColors.border, // #E2E8F0
                                            width: 1,
                                          ),
                                          boxShadow: [
                                            // Top-left white highlight for clean raised look
                                            BoxShadow(
                                              color: AppColors.white.withValues(
                                                alpha: 0.95,
                                              ),
                                              blurRadius: 4,
                                              offset: const Offset(-2, -2),
                                            ),
                                            // Bottom-right soft depth shadow
                                            BoxShadow(
                                              color: AppColors.textPrimary
                                                  .withValues(alpha: 0.06),
                                              blurRadius: 8,
                                              spreadRadius: 0.5,
                                              offset: const Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // TICKET ID + STATUS + PRIORITY + DATE
                                            Row(
                                              children: [
                                                Text(
                                                  item['id'] ?? '',
                                                  style: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontFamily: AppFonts.bold,
                                                    color:
                                                        AppColors.textPrimary,
                                                  ),
                                                ),

                                                SizedBox(width: 1.8.w),

                                                // Status Badge
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 2.w,
                                                    vertical: 0.35.h,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: statusSurface,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          5,
                                                        ),
                                                    border: Border.all(
                                                      color: statusColor
                                                          .withValues(
                                                            alpha: 0.2,
                                                          ),
                                                      width: 0.8,
                                                    ),
                                                  ),
                                                  child: Text(
                                                    status,
                                                    style: TextStyle(
                                                      fontSize: 13.sp,
                                                      fontFamily: AppFonts.bold,
                                                      color: statusColor,
                                                    ),
                                                  ),
                                                ),

                                                if (priority != 'NORMAL' &&
                                                    priority.isNotEmpty) ...[
                                                  SizedBox(width: 1.5.w),
                                                  // Priority Badge
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                          horizontal: 2.w,
                                                          vertical: 0.35.h,
                                                        ),
                                                    decoration: BoxDecoration(
                                                      color: prioritySurface,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            5,
                                                          ),
                                                      border: Border.all(
                                                        color: priorityColor
                                                            .withValues(
                                                              alpha: 0.2,
                                                            ),
                                                        width: 0.8,
                                                      ),
                                                    ),
                                                    child: Text(
                                                      priority,
                                                      style: TextStyle(
                                                        fontSize: 13.sp,
                                                        fontFamily:
                                                            AppFonts.bold,
                                                        color: priorityColor,
                                                      ),
                                                    ),
                                                  ),
                                                ],

                                                const Spacer(),

                                                Text(
                                                  item['date'] ?? '',
                                                  style: TextStyle(
                                                    fontSize: 13.sp,
                                                    fontFamily:
                                                        AppFonts.regular,
                                                    color:
                                                        AppColors.textPrimary,
                                                  ),
                                                ),
                                              ],
                                            ),

                                            SizedBox(height: 0.9.h),

                                            // CUSTOMER NAME + DESCRIPTION
                                            RichText(
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              text: TextSpan(
                                                style: TextStyle(
                                                  fontSize: 9.2.sp,
                                                  height: 1.35,
                                                  fontFamily: AppFonts.regular,
                                                  color:
                                                      AppColors.textSecondary,
                                                ),
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        '${item['name'] ?? ''} • ',
                                                    style: TextStyle(
                                                      fontFamily: AppFonts.bold,
                                                      color:
                                                          AppColors.textPrimary,
                                                      fontSize: 14.sp,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        item['description'] ??
                                                        '',
                                                    style: TextStyle(
                                                      fontSize: 13.sp,
                                                      fontFamily:
                                                          AppFonts.regular,
                                                      color: AppColors
                                                          .textSecondary,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 2.h),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(3.5.w),
                            decoration: BoxDecoration(
                              color: AppColors.surface,
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(
                                color: AppColors.border,
                                width: 1,
                              ),
                              boxShadow: [
                                // Soft outer elevation shadow
                                BoxShadow(
                                  color: AppColors.textPrimary.withValues(
                                    alpha: 0.06,
                                  ),
                                  blurRadius: 18,
                                  spreadRadius: 1,
                                  offset: const Offset(0, 6),
                                ),
                                // Crisp close shadow
                                BoxShadow(
                                  color: AppColors.textPrimary.withValues(
                                    alpha: 0.03,
                                  ),
                                  blurRadius: 5,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // HEADER: Upcoming Service Visits + View All
                                Row(
                                  children: [
                                    Container(
                                      height: 10.w,
                                      width: 10.w,
                                      decoration: BoxDecoration(
                                        color: AppColors.secondarySurface,
                                        // #EEF2FF
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: AppColors.secondary.withValues(
                                            alpha: 0.15,
                                          ),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColors.secondary
                                                .withValues(alpha: 0.10),
                                            blurRadius: 6,
                                            offset: const Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: Icon(
                                        Icons.calendar_today_rounded,
                                        color: AppColors.secondary, // #4F46E5
                                        size: 20.sp,
                                      ),
                                    ),
                                    SizedBox(width: 2.5.w),
                                    Expanded(
                                      child: Text(
                                        'Upcoming Service Visits',
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          fontFamily: AppFonts.bold,
                                          color: AppColors.textPrimary,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        // Navigate to all service visits
                                      },
                                      borderRadius: BorderRadius.circular(6),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 1.w,
                                          vertical: 0.4.h,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'View All',
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                fontFamily: AppFonts.bold,
                                                color: AppColors.primary,
                                              ),
                                            ),
                                            SizedBox(width: 0.5.w),
                                            Icon(
                                              Icons.chevron_right_rounded,
                                              color: AppColors.primary,
                                              size: 16.sp,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 1.6.h),

                                // INNER EMPTY STATE CONTAINER WITH BOX SHADOW
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 4.w,
                                    vertical: 3.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.background, // #F8FAFC
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(
                                      color: AppColors.border, // #E2E8F0
                                      width: 1.2,
                                    ),
                                    boxShadow: [
                                      // Top-left white highlight
                                      BoxShadow(
                                        color: AppColors.white.withValues(
                                          alpha: 0.95,
                                        ),
                                        blurRadius: 4,
                                        offset: const Offset(-2, -2),
                                      ),
                                      // Soft inner-card depth shadow
                                      BoxShadow(
                                        color: AppColors.textPrimary.withValues(
                                          alpha: 0.04,
                                        ),
                                        blurRadius: 10,
                                        spreadRadius: 0.5,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // Circular Calendar Icon Badge
                                      Container(
                                        height: 12.w,
                                        width: 12.w,
                                        decoration: BoxDecoration(
                                          color: AppColors.primary, // #FFFFFF
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: AppColors.border,
                                            width: 1,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppColors.white,
                                              blurRadius: 4,
                                              offset: const Offset(-2, -2),
                                            ),
                                            BoxShadow(
                                              color: AppColors.textPrimary
                                                  .withValues(alpha: 0.06),
                                              blurRadius: 8,
                                              offset: const Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: Icon(
                                          Icons.calendar_today_outlined,
                                          color: AppColors.white, // #94A3B8
                                          size: 20.sp,
                                        ),
                                      ),

                                      SizedBox(height: 1.4.h),

                                      // Empty State Message
                                      Text(
                                        'No upcoming service visits in the next 7 days.',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          fontFamily: AppFonts.regular,
                                          color: AppColors.textSecondary,
                                        ),
                                      ),

                                      SizedBox(height: 0.8.h),

                                      // Schedule a visit CTA Link
                                      InkWell(
                                        onTap: () {
                                          // Open schedule visit screen/modal
                                        },
                                        borderRadius: BorderRadius.circular(6),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 2.w,
                                            vertical: 0.4.h,
                                          ),
                                          child: Text(
                                            'Schedule a visit',
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              fontFamily: AppFonts.bold,
                                              color: AppColors.primary,
                                              decoration:
                                                  TextDecoration.underline,
                                              decorationColor:
                                                  AppColors.primary,
                                              decorationThickness: 1.5,
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

                          SizedBox(height: 5.h),
                        ],
                      ),
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

  Widget _overviewItem({
    required String title,
    required String value,
    required Color color,
    bool isResolved = false,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.2.h, horizontal: 1.w),
      decoration: BoxDecoration(
        color: isResolved ? const Color(0xFFECFDF5) : const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isResolved ? const Color(0xFFA7F3D0) : const Color(0xFFE2E8F0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withValues(alpha: 0.95),
            blurRadius: 5,
            offset: const Offset(-2, -2),
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 5,
            offset: const Offset(2, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14.sp,
              fontFamily: AppFonts.medium,
              color: AppColors.textSecondary,
            ),
          ),
          SizedBox(height: 0.5.h),
          Text(
            value,
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: AppFonts.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _complaintOverviewItem({
    required String title,
    required String value,
    required Color color,
    required Color surfaceColor,
    bool isHighlighted = false,
  }) {
    IconData icon;

    switch (title) {
      case 'Open':
        icon = Icons.pending_actions_rounded;
        break;
      case 'Assigned':
        icon = Icons.assignment_ind_rounded;
        break;
      case 'In Progress':
        icon = Icons.autorenew_rounded;
        break;
      case 'Resolved':
        icon = Icons.task_alt_rounded;
        break;
      default:
        icon = Icons.info_outline_rounded;
    }

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.4.h),
      decoration: BoxDecoration(
        color: isHighlighted ? surfaceColor : AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isHighlighted
              ? color.withValues(alpha: 0.35)
              : AppColors.border,
          width: 1.2,
        ),
        boxShadow: [
          // Top-left subtle highlight for 3D effect
          BoxShadow(
            color: AppColors.white.withValues(alpha: 0.9),
            blurRadius: 6,
            offset: const Offset(-2, -2),
          ),
          // Soft ambient shadow
          BoxShadow(
            color: AppColors.textPrimary.withValues(alpha: 0.05),
            blurRadius: 12,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          ),
          // Colored glow shadow when highlighted
          if (isHighlighted)
            BoxShadow(
              color: color.withValues(alpha: 0.12),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon Badge with inner shadow feel
          Container(
            height: 9.5.w,
            width: 9.5.w,
            decoration: BoxDecoration(
              color: isHighlighted ? AppColors.white : surfaceColor,
              borderRadius: BorderRadius.circular(11),
              border: Border.all(color: color.withValues(alpha: 0.15)),
              boxShadow: [
                BoxShadow(
                  color: color.withValues(alpha: 0.10),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Icon(icon, color: color, size: 18.sp),
          ),

          SizedBox(height: 1.h),

          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.sp,
              fontFamily: AppFonts.medium,
              color: AppColors.textSecondary,
            ),
          ),

          SizedBox(height: 0.3.h),

          Text(
            value,
            style: TextStyle(
              fontSize: 17.sp,
              fontFamily: AppFonts.bold,
              color: isHighlighted ? color : AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
