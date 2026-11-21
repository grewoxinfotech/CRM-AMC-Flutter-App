import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:raiser_amc/core/theme/app_colors.dart';
import 'package:raiser_amc/core/theme/app_fonts.dart';
import 'package:raiser_amc/core/utils/custom_app_bar.dart';
import 'package:raiser_amc/core/utils/custom_button.dart';
import 'package:raiser_amc/core/utils/custom_dropdown.dart';
import 'package:raiser_amc/core/utils/custom_side_drawer.dart';
import 'package:sizer/sizer.dart';

class ClientDetails extends StatefulWidget {
  const ClientDetails({super.key});

  @override
  State<ClientDetails> createState() => _ClientDetailsState();
}

class _ClientDetailsState extends State<ClientDetails> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  int _selectedTabIndex = 0;


  final List<Map<String, dynamic>> _clientTabs = [
    {
      'title': 'AMC Contracts',
      'count': '1',
      'icon': Icons.description_outlined,
    },
    {
      'title': 'Equipment',
      'count': '1',
      'icon': Icons.memory_rounded,
    },
    {
      'title': 'Service Visits',
      'count': '3',
      'icon': Icons.calendar_today_outlined,
    },
    {
      'title': 'Complaints',
      'count': '3',
      'icon': Icons.error_outline_rounded,
    },
    {
      'title': 'Invoices',
      'count': '2',
      'icon': Icons.credit_card_rounded,
    },
  ];

  final TextEditingController _tabSearchController = TextEditingController();
  String _searchQuery = '';
  String _selectedStatusFilter = 'All Status';
  final ScrollController _tabListScrollController = ScrollController();

  @override
  void dispose() {
    _tabSearchController.dispose();
    _tabListScrollController.dispose();
    super.dispose();
  }



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
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(22),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(4.2.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Wrap(
                                                spacing: 2.w,
                                                runSpacing: 0.8.h,
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.center,
                                                children: [
                                                  // CORPORATE CLIENT Badge
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                          horizontal: 2.8.w,
                                                          vertical: 0.5.h,
                                                        ),
                                                    decoration: BoxDecoration(
                                                      color: AppColors.primary,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            20,
                                                          ),
                                                      border: Border.all(
                                                        color: AppColors.white,
                                                        width: 1,
                                                      ),
                                                    ),
                                                    child: Text(
                                                      'CORPORATE CLIENT',
                                                      style: TextStyle(
                                                        fontSize: 14.sp,
                                                        fontFamily:
                                                            AppFonts.bold,
                                                        color: AppColors.white,
                                                        letterSpacing: 0.4,
                                                      ),
                                                    ),
                                                  ),

                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                          horizontal: 2.8.w,
                                                          vertical: 0.5.h,
                                                        ),
                                                    decoration: BoxDecoration(
                                                      color: AppColors.success,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            20,
                                                          ),
                                                      border: Border.all(
                                                        color: AppColors.white,
                                                        width: 1,
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Text(
                                                          'Active',
                                                          style: TextStyle(
                                                            fontSize: 14.sp,
                                                            fontFamily:
                                                                AppFonts.bold,
                                                            color:
                                                                AppColors.white,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              SizedBox(height: 1.3.h),

                                              Text(
                                                'Shree Ram Hospital &\nTrauma Centre',
                                                style: TextStyle(
                                                  fontSize: 15.sp,
                                                  fontFamily: AppFonts.bold,
                                                  color: AppColors.textPrimary,
                                                  height: 1.25,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        SizedBox(width: 3.w),

                                        Container(
                                          width: 48,
                                          height: 48,
                                          decoration: BoxDecoration(
                                            color: AppColors.primary,
                                            borderRadius: BorderRadius.circular(
                                              14,
                                            ),
                                            border: Border.all(
                                              color: AppColors.white,
                                              width: 1,
                                            ),
                                          ),
                                          alignment: Alignment.center,
                                          child: Icon(
                                            Icons.domain_rounded,
                                            color: AppColors.white,
                                            size: 21.sp,
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

                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 3.5.w,
                                        vertical: 1.4.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF8FAFC),
                                        borderRadius: BorderRadius.circular(14),
                                        border: Border.all(
                                          color: Colors.grey.shade200,
                                          width: 1,
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'PRIMARY CONTACT',
                                                  style: TextStyle(
                                                    fontSize: 13.sp,
                                                    fontFamily: AppFonts.bold,
                                                    color:
                                                        AppColors.textSecondary,
                                                    letterSpacing: 0.6,
                                                  ),
                                                ),
                                                SizedBox(height: 0.4.h),
                                                Text(
                                                  'Ramesh Patel',
                                                  style: TextStyle(
                                                    fontSize: 15.sp,
                                                    fontFamily: AppFonts.bold,
                                                    color:
                                                        AppColors.textPrimary,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                          // Phone Action Button
                                          InkWell(
                                            onTap: () {
                                              // Phone call action
                                            },
                                            borderRadius: BorderRadius.circular(
                                              30,
                                            ),
                                            child: Container(
                                              width: 38,
                                              height: 38,
                                              decoration: BoxDecoration(
                                                color: AppColors.primary,
                                                shape: BoxShape.circle,
                                              ),
                                              alignment: Alignment.center,
                                              child: Icon(
                                                Icons.phone_outlined,
                                                color: AppColors.white,
                                                size: 18.sp,
                                              ),
                                            ),
                                          ),

                                          SizedBox(width: 2.5.w),

                                          InkWell(
                                            onTap: () {
                                              // Email action
                                            },
                                            borderRadius: BorderRadius.circular(
                                              30,
                                            ),
                                            child: Container(
                                              width: 38,
                                              height: 38,
                                              decoration: BoxDecoration(
                                                color: AppColors.primary,
                                                shape: BoxShape.circle,
                                              ),
                                              alignment: Alignment.center,
                                              child: Icon(
                                                Icons.mail_outline_rounded,
                                                color: AppColors.white,
                                                size: 18.sp,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    SizedBox(height: 1.8.h),

                                    // ==========================================================
                                    // 4. PHONE + ALT PHONE ROW
                                    // ==========================================================
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(1.8.w),
                                          decoration: BoxDecoration(
                                            color: AppColors.primary,
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.phone_outlined,
                                            size: 18.sp,
                                            color: AppColors.white,
                                          ),
                                        ),
                                        SizedBox(width: 2.5.w),
                                        Expanded(
                                          child: RichText(
                                            overflow: TextOverflow.ellipsis,
                                            text: TextSpan(
                                              text: '9825012345',
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                fontFamily: AppFonts.semiBold,
                                                color: AppColors.textPrimary,
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: '  |  ',
                                                  style: TextStyle(
                                                    fontSize: 13.5.sp,
                                                    color: Colors.grey.shade400,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: 'Alt: 9825012346',
                                                  style: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontFamily:
                                                        AppFonts.regular,
                                                    color:
                                                        AppColors.textSecondary,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: 1.2.h),

                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(1.8.w),
                                          decoration: BoxDecoration(
                                            color: AppColors.primary,
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.alternate_email_rounded,
                                            size: 18.sp,
                                            color: AppColors.white,
                                          ),
                                        ),
                                        SizedBox(width: 2.5.w),
                                        Expanded(
                                          child: Text(
                                            'contact@shreeramhospital.com',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              fontFamily: AppFonts.medium,
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
                                      color: AppColors.divider,
                                    ),
                                    SizedBox(height: 1.4.h),

                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          child: RichText(
                                            overflow: TextOverflow.ellipsis,
                                            text: TextSpan(
                                              text: 'GST: ',
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                fontFamily: AppFonts.regular,
                                                color: AppColors.textSecondary,
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: '24AABCS1234F1Z9',
                                                  style: TextStyle(
                                                    fontSize: 15.sp,
                                                    fontFamily: AppFonts.bold,
                                                    color:
                                                        AppColors.textPrimary,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 2.w),
                                        Text(
                                          'Client Since Nov 18, 2026',
                                          style: TextStyle(
                                            fontSize: 13.sp,
                                            fontFamily: AppFonts.regular,
                                            color: AppColors.textSecondary,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 0.5.h),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 2.h),

                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: _buildStatCard(
                                  title: 'AMC CONTRACTS',
                                  value: '1',
                                  icon: Icons.description_outlined,
                                  iconColor: const Color(0xFF2563EB),
                                  // Blue
                                  iconBgColor: const Color(0xFFEFF6FF),
                                  subtitleWidget: Text(
                                    'Active (1 Total)',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontFamily: AppFonts.medium,
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(width: 3.5.w),

                              Expanded(
                                child: _buildStatCard(
                                  title: 'EQUIPMENT UNITS',
                                  value: '1',
                                  icon: Icons.memory_rounded,
                                  iconColor: const Color(0xFF9333EA),
                                  // Purple
                                  iconBgColor: const Color(0xFFFAF5FF),
                                  subtitleWidget: Text(
                                    'Installed Assets',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontFamily: AppFonts.medium,
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 1.8.h),

                          Row(
                            children: [
                              // 3. TOTAL INVOICED CARD
                              Expanded(
                                child: _buildStatCard(
                                  title: 'TOTAL INVOICED',
                                  value: '₹13,180',
                                  icon: Icons.credit_card_rounded,
                                  iconColor: const Color(0xFF059669),
                                  // Emerald Green
                                  iconBgColor: const Color(0xFFECFDF5),
                                  subtitleWidget: Row(
                                    children: [
                                      Container(
                                        width: 6,
                                        height: 6,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF10B981),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      SizedBox(width: 1.5.w),
                                      Expanded(
                                        child: Text(
                                          'Due: ₹0',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 13.sp,
                                            fontFamily: AppFonts.semiBold,
                                            color: const Color(0xFF059669),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              SizedBox(width: 3.5.w),

                              // 4. COMPLAINTS CARD
                              Expanded(
                                child: _buildStatCard(
                                  title: 'COMPLAINTS',
                                  value: '3',
                                  icon: Icons.warning_amber_rounded,
                                  iconColor: const Color(0xFFD97706),
                                  // Amber / Orange
                                  iconBgColor: const Color(0xFFFFFBEB),
                                  subtitleWidget: Text(
                                    '1 Open / Pending',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontFamily: AppFonts.semiBold,
                                      color: const Color(0xFFD97706),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h,),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          // ==========================================================
                          // TAB BAR + SEARCH/FILTER/ADD + FIXED HEIGHT LIST (3 ITEMS)
                          // ==========================================================
                          Container(
                            width: double.infinity,
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
                                  offset: const Offset(5, 6),
                                  blurRadius: 14,
                                  spreadRadius: 1,
                                ),
                                BoxShadow(
                                  color: AppColors.black.withOpacity(0.05),
                                  offset: const Offset(0, 4),
                                  blurRadius: 18,
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(22),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // 1. HORIZONTAL SCROLLABLE TAB BAR
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.grey.shade200,
                                          width: 1.2,
                                        ),
                                      ),
                                    ),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      padding: EdgeInsets.symmetric(horizontal: 3.5.w),
                                      child: Row(
                                        children: List.generate(_clientTabs.length, (index) {
                                          final tab = _clientTabs[index];
                                          final bool isSelected = _selectedTabIndex == index;

                                          return GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                _selectedTabIndex = index;
                                                _tabSearchController.clear();
                                                _searchQuery = '';
                                                _selectedStatusFilter = 'All Status';
                                              });
                                            },
                                            behavior: HitTestBehavior.opaque,
                                            child: Container(
                                              margin: EdgeInsets.only(right: 4.5.w),
                                              padding: EdgeInsets.only(top: 1.6.h),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      Icon(
                                                        tab['icon'] as IconData,
                                                        size: 16.sp,
                                                        color: isSelected
                                                            ? const Color(0xFF2563EB)
                                                            : AppColors.textSecondary,
                                                      ),
                                                      SizedBox(width: 1.8.w),
                                                      Text(
                                                        tab['title'] as String,
                                                        style: TextStyle(
                                                          fontSize: 13.5.sp,
                                                          fontFamily: isSelected
                                                              ? AppFonts.bold
                                                              : AppFonts.semiBold,
                                                          color: isSelected
                                                              ? const Color(0xFF2563EB)
                                                              : AppColors.textSecondary,
                                                        ),
                                                      ),
                                                      SizedBox(width: 1.8.w),
                                                      AnimatedContainer(
                                                        duration: const Duration(milliseconds: 200),
                                                        padding: EdgeInsets.symmetric(
                                                          horizontal: 2.2.w,
                                                          vertical: 0.25.h,
                                                        ),
                                                        decoration: BoxDecoration(
                                                          color: isSelected
                                                              ? const Color(0xFFDBEAFE)
                                                              : const Color(0xFFF1F5F9),
                                                          borderRadius: BorderRadius.circular(20),
                                                        ),
                                                        child: Text(
                                                          tab['count'] as String,
                                                          style: TextStyle(
                                                            fontSize: 11.sp,
                                                            fontFamily: AppFonts.bold,
                                                            color: isSelected
                                                                ? const Color(0xFF1D4ED8)
                                                                : AppColors.textPrimary,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 1.3.h),
                                                  AnimatedContainer(
                                                    duration: const Duration(milliseconds: 220),
                                                    curve: Curves.easeInOut,
                                                    height: 2.8,
                                                    width: isSelected ? 110 : 0,
                                                    decoration: BoxDecoration(
                                                      color: const Color(0xFF2563EB),
                                                      borderRadius: BorderRadius.circular(4),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                                      ),
                                    ),
                                  ),

                                  // 2. SEARCH + STATUS FILTER + ADD BUTTON BAR
                                  _buildTabFilterAndActionHeader(),

                                  // 3. FIXED HEIGHT SCROLLABLE LIST (MAX 3 CARDS VISIBLE)
                                  _buildSelectedTabContent(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 2.h),

                      Column(
                        children: [
                          _buildHealthMetricCard(
                            icon: Icons.credit_card_rounded,
                            iconColor: AppColors.success,
                            iconBgColor: AppColors.success.withOpacity(0.2),
                            title: 'Billing & Collection',
                            subtitle: 'Invoice payment tracking',
                            badgeText: 'Settled',
                            badgeTextColor: AppColors.success,
                            badgeBgColor: AppColors.success.withOpacity(0.1),
                            badgeBorderColor: AppColors.success.withOpacity(
                              0.1,
                            ),
                            rows: [
                              _buildMetricRow(
                                label: 'Total Invoiced',
                                value: '₹13,180',
                              ),
                              _buildMetricRow(
                                label: 'Collected Amount',
                                value: '₹13,180',
                              ),
                              _buildMetricRow(
                                label: 'Outstanding Due',
                                value: '₹0',
                                valueColor: AppColors.success,
                              ),
                            ],
                            progressLabel: 'Collection Rate',
                            progressPercentageText: '100%',
                            progressValue: 1.0,
                            progressColor: AppColors.success.withOpacity(0.9),
                          ),

                          SizedBox(height: 2.2.h),

                          _buildHealthMetricCard(
                            icon: Icons.notifications_none_rounded,
                            iconColor: AppColors.primary,
                            iconBgColor: AppColors.primary.withOpacity(0.2),
                            title: 'Service & Support Health',
                            subtitle: 'Maintenance & ticket resolution',
                            badgeText: '1 Open Issue',
                            badgeTextColor: AppColors.danger,
                            badgeBgColor: AppColors.dangerSurface,
                            badgeBorderColor: AppColors.danger,
                            rows: [
                              _buildMetricRow(
                                label: 'Active AMC Contracts',
                                value: '1',
                              ),
                              _buildMetricRow(
                                label: 'Service Visits Logged',
                                value: '3 Visits',
                              ),
                              _buildMetricRow(
                                label: 'Complaints Resolved',
                                value: '2',
                                secondaryValue: ' / 3',
                              ),
                            ],
                            progressLabel: 'Resolution Rate',
                            progressPercentageText: '67%',
                            progressValue: 0.67,
                            progressColor: AppColors.primary,
                          ),
                        ],
                      ),

                      SizedBox(height: 2.h),

                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(4.2.w),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(22),
                          border: Border.all(
                            color: AppColors.white.withOpacity(0.9),
                            width: 1.2,
                          ),
                          boxShadow: [
                            // Top-left 3D highlight
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
                              children: [
                                Container(
                                  width: 34,
                                  height: 34,
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.location_on_outlined,
                                    color: AppColors.white,
                                    size: 20.sp,
                                  ),
                                ),
                                SizedBox(width: 2.8.w),
                                Expanded(
                                  child: Text(
                                    'PREMISES LOCATION',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      fontFamily: AppFonts.bold,
                                      color: AppColors.textPrimary,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 2.w),

                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 3.w,
                                    vertical: 0.55.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.primarySurface,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    'RAJKOT',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontFamily: AppFonts.bold,
                                      color: AppColors.primary,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 1.6.h),

                            Text(
                              'Near Ring Road, Kalawad Road, Opp. Crystal Mall, Rajkot, Gujarat, 360005',
                              style: TextStyle(
                                fontSize: 13.5.sp,
                                fontFamily: AppFonts.medium,
                                color: AppColors.textSecondary,
                                height: 1.45,
                              ),
                            ),

                            SizedBox(height: 1.8.h),

                            Center(
                              child: CustomButton(
                                text: 'Open in Google Maps',
                                onPressed: () {},
                                height: 5.h,
                                icon: Icons.pin_drop,
                                iconAtStart: true,
                                fontSize: 14.sp,
                                width: 70.w,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.h,),
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

  Widget _buildStatCard({
    required String title,
    required String value,
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required Widget subtitleWidget,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(3.8.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.white.withOpacity(0.9),
            width: 1.2,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.white.withOpacity(1),
              offset: const Offset(-4, -4),
              blurRadius: 10,
              spreadRadius: 1,
            ),

            BoxShadow(
              color: AppColors.black.withOpacity(0.11),
              offset: const Offset(4, 6),
              blurRadius: 14,
              spreadRadius: 1,
            ),

            BoxShadow(
              color: AppColors.black.withOpacity(0.04),
              offset: const Offset(0, 3),
              blurRadius: 16,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontFamily: AppFonts.bold,
                      color: AppColors.textSecondary,
                      letterSpacing: 0.4,
                    ),
                  ),
                ),
                SizedBox(width: 1.5.w),
                Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    color: iconBgColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Icon(icon, color: iconColor, size: 18.sp),
                ),
              ],
            ),

            SizedBox(height: 1.4.h),

            Text(
              value,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 18.sp,
                fontFamily: AppFonts.bold,
                color: AppColors.textPrimary,
                height: 1.15,
              ),
            ),

            SizedBox(height: 0.8.h),

            subtitleWidget,
          ],
        ),
      ),
    );
  }

  Widget _buildHealthMetricCard({
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required String title,
    required String subtitle,
    required String badgeText,
    required Color badgeTextColor,
    required Color badgeBgColor,
    required Color badgeBorderColor,
    required List<Widget> rows,
    required String progressLabel,
    required String progressPercentageText,
    required double progressValue,
    required Color progressColor,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(4.2.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.white.withOpacity(0.9), width: 1.2),
        boxShadow: [
          // Top-left 3D highlight
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
          // 1. HEADER ROW (Icon + Title/Subtitle + Right Status Pill)
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: iconBgColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Icon(icon, color: iconColor, size: 19.sp),
              ),
              SizedBox(width: 3.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontFamily: AppFonts.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: 0.2.h),
                    Text(
                      subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontFamily: AppFonts.regular,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 2.w),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 3.w,
                  vertical: 0.55.h,
                ),
                decoration: BoxDecoration(
                  color: badgeBgColor,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: badgeBorderColor, width: 1),
                ),
                child: Text(
                  badgeText,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontFamily: AppFonts.bold,
                    color: badgeTextColor,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 1.6.h),
          Divider(height: 1, thickness: 1, color: AppColors.divider),
          SizedBox(height: 1.6.h),

          ...rows,

          SizedBox(height: 0.6.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                progressLabel,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontFamily: AppFonts.medium,
                  color: AppColors.textSecondary,
                ),
              ),
              Text(
                progressPercentageText,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontFamily: AppFonts.bold,
                  color: progressColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 0.9.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progressValue,
              minHeight: 7,
              backgroundColor: const Color(0xFFF1F5F9),
              valueColor: AlwaysStoppedAnimation<Color>(progressColor),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricRow({
    required String label,
    required String value,
    String? secondaryValue,
    Color? valueColor,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 1.3.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              fontFamily: AppFonts.medium,
              color: AppColors.textSecondary,
            ),
          ),
          RichText(
            text: TextSpan(
              text: value,
              style: TextStyle(
                fontSize: 15.sp,
                fontFamily: AppFonts.bold,
                color: valueColor ?? AppColors.textPrimary,
              ),
              children: [
                if (secondaryValue != null)
                  TextSpan(
                    text: secondaryValue,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontFamily: AppFonts.medium,
                      color: AppColors.textSecondary,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }



  Widget _buildTabFilterAndActionHeader() {
    String searchHint = 'Search...';
    bool hasStatusFilter = false;
    String? addButtonText;

    switch (_selectedTabIndex) {
      case 0:
        searchHint = 'Search contracts...';
        hasStatusFilter = true;
        addButtonText = 'New Contract';
        break;

      case 1:
        searchHint = 'Search equipment...';
        addButtonText = 'Add Equipment';
        break;

      case 2:
        searchHint = 'Search service visits...';
        hasStatusFilter = true;
        break;

      case 3:
        searchHint = 'Search complaints...';
        hasStatusFilter = true;
        addButtonText = 'Log Complaint';
        break;

      case 4:
        searchHint = 'Search invoices...';
        addButtonText = 'Create Invoice';
        break;
    }

    final List<String> statusOptions =
    _getStatusOptionsForTab(_selectedTabIndex);

    final String selectedStatus =
    statusOptions.contains(_selectedStatusFilter)
        ? _selectedStatusFilter
        : 'All Status';

    return Container(
      padding: EdgeInsets.fromLTRB(3.5.w, 1.5.h, 3.5.w, 1.2.h),
      decoration: BoxDecoration(
        color: const Color(0xFFFAFBFC),
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade200,
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          // Search Field
          Container(
            height: 42,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.grey.shade300,
                width: 1,
              ),
            ),
            child: TextField(
              controller: _tabSearchController,
              onChanged: (val) {
                setState(() {
                  _searchQuery = val.trim().toLowerCase();
                });
              },
              style: TextStyle(
                fontSize: 13.sp,
                fontFamily: AppFonts.medium,
                color: AppColors.textPrimary,
              ),
              decoration: InputDecoration(
                hintText: searchHint,
                hintStyle: TextStyle(
                  fontSize: 13.sp,
                  fontFamily: AppFonts.regular,
                  color: AppColors.textSecondary,
                ),
                prefixIcon: Icon(
                  Icons.search_rounded,
                  size: 17.sp,
                  color: AppColors.textSecondary,
                ),
                suffixIcon: _searchQuery.isNotEmpty
                    ? GestureDetector(
                  onTap: () {
                    setState(() {
                      _tabSearchController.clear();
                      _searchQuery = '';
                    });
                  },
                  child: Icon(
                    Icons.close_rounded,
                    size: 16.sp,
                    color: AppColors.textSecondary,
                  ),
                )
                    : null,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
              ),
            ),
          ),

          // Status Dropdown + Custom Button
          if (hasStatusFilter || addButtonText != null) ...[
            SizedBox(height: 1.1.h),

            Row(
              children: [
                if (hasStatusFilter)
                  Expanded(
                    child: CustomDropdown<String>(
                      label: '',
                      hintText: 'All Status',
                      items: statusOptions,
                      value: selectedStatus,
                      itemLabel: (item) => item,
                      isSearch: false,
                      onChanged: (val) {
                        if (val != null) {
                          setState(() {
                            _selectedStatusFilter = val;
                          });
                        }
                      },
                    ),
                  ),

                if (hasStatusFilter && addButtonText != null)
                  SizedBox(width: 2.5.w),

                if (addButtonText != null)
                  Expanded(
                    child: CustomButton(
                      text: addButtonText,
                      height: 5.2.h,
                      fontSize: 12.5.sp,
                      icon: Icons.add_rounded,
                      iconAtStart: true,
                      iconSize: 16.5.sp,
                      backgroundColor: const Color(0xFF3B5BFD),
                      onPressed: () {
                        _onTabAddButtonTap(_selectedTabIndex);
                      },
                    ),
                  ),
              ],
            ),
          ],
        ],
      ),
    );
  }


  void _onTabAddButtonTap(int tabIndex) {
    switch (tabIndex) {
      case 0:

        break;
      case 1:

        break;
      case 3:

        break;
      case 4:

        break;
    }
  }

  List<String> _getStatusOptionsForTab(int tabIndex) {
    switch (tabIndex) {
      case 0:
        return ['All Status', 'Active', 'Expired', 'Pending'];
      case 2:
        return ['All Status', 'In Progress', 'Scheduled', 'Completed'];
      case 3:
        return ['All Status', 'Open', 'Resolved', 'In Progress'];
      default:
        return ['All Status'];
    }
  }

  Widget _buildSelectedTabContent() {
    final List<Map<String, dynamic>> rawList =
        _getTabListData(_selectedTabIndex);


    final List<Map<String, dynamic>> filteredList = rawList.where((item) {
      final String allText = item.values.join(' ').toLowerCase();
      final bool matchesSearch =
          _searchQuery.isEmpty || allText.contains(_searchQuery);

      final String itemStatus = (item['status'] ?? '').toString().toLowerCase();
      final bool matchesStatus = _selectedStatusFilter == 'All Status' ||
          itemStatus == _selectedStatusFilter.toLowerCase();

      return matchesSearch && matchesStatus;
    }).toList();

    if (filteredList.isEmpty) {
      return SizedBox(
        height: 22.h,
        child: Center(
          child: Text(
            'No matching records found',
            style: TextStyle(
              fontSize: 15.sp,
              fontFamily: AppFonts.medium,
              color: AppColors.textSecondary,
            ),
          ),
        ),
      );
    }

    return SizedBox(
      height: 37.h,
      child: Scrollbar(
        controller: _tabListScrollController,
        thumbVisibility: filteredList.length > 3,
        radius: const Radius.circular(10),
        child: ListView.separated(
          controller: _tabListScrollController,
          padding: EdgeInsets.all(3.2.w),
          physics: const BouncingScrollPhysics(),
          itemCount: filteredList.length,
          separatorBuilder: (context, index) => SizedBox(height: 1.2.h),
          itemBuilder: (context, index) {
            final item = filteredList[index];
            return _buildTabCardByIndex(_selectedTabIndex, item);
          },
        ),
      ),
    );
  }

  Widget _buildTabCardByIndex(int tabIndex, Map<String, dynamic> item) {
    switch (tabIndex) {

      case 0:
        return _buildInnerCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      _pillBadge(
                        text: item['contractNo'],
                        bgColor: AppColors.primarySurface,
                        textColor: AppColors.primary,
                      ),
                      SizedBox(width: 2.w),
                      _pillBadge(
                        text: item['type'],
                        bgColor:  AppColors.primarySurface,
                        textColor: AppColors.primary,
                      ),
                    ],
                  ),
                  Text(
                    item['value'],
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontFamily: AppFonts.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 0.9.h),
              Text(
                item['equipment'],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13.5.sp,
                  fontFamily: AppFonts.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: 0.4.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item['model'],
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: AppFonts.regular,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  Text(
                    item['duration'],
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontFamily: AppFonts.medium,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );

    // 2. EQUIPMENT CARD
      case 1:
        return _buildInnerCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      item['name'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: AppFonts.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  SizedBox(width: 2.w),
                  _pillBadge(
                    text: item['category'],
                    bgColor: AppColors.primarySurface,
                    textColor: AppColors.primary,
                  ),
                ],
              ),
              SizedBox(height: 0.6.h),
              Text(
                '${item['brand']} • ${item['modelSerial']}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13.5.sp,
                  fontFamily: AppFonts.medium,
                  color: AppColors.textSecondary,
                ),
              ),
              SizedBox(height: 0.4.h),
              Row(
                children: [
                  Icon(
                    Icons.place_outlined,
                    size: 18.sp,
                    color: AppColors.primary,
                  ),
                  SizedBox(width: 1.w),
                  Expanded(
                    child: Text(
                      item['location'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: AppFonts.regular,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );

    // 3. SERVICE VISITS CARD
      case 2:
        final bool isInProgress = item['status'] == 'In Progress';
        return _buildInnerCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        item['visitNo'],
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: AppFonts.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      SizedBox(width: 2.w),
                      _pillBadge(
                        text: item['serviceType'],
                        bgColor:  AppColors.primarySurface,
                        textColor:  AppColors.primary,
                      ),
                    ],
                  ),
                  _pillBadge(
                    text: item['status'],
                    bgColor: isInProgress
                        ?  AppColors.primarySurface
                        : AppColors.warning.withOpacity(0.1),
                    textColor: isInProgress
                        ? AppColors.primary
                        : AppColors.warning,
                  ),
                ],
              ),
              SizedBox(height: 0.7.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tech: ${item['technician']}',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontFamily: AppFonts.semiBold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    item['date'],
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontFamily: AppFonts.regular,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );

    // 4. COMPLAINTS CARD
      case 3:
        final bool isOpen = item['status'] == 'Open';
        final String priority = item['priority'];
        Color priorityBg = AppColors.primarySurface;
        Color priorityText = AppColors.primary;
        if (priority == 'High') {
          priorityBg = const Color(0xFFFFFBEB);
          priorityText = const Color(0xFFD97706);
        } else if (priority == 'Critical') {
          priorityBg = const Color(0xFFFEF2F2);
          priorityText = const Color(0xFFDC2626);
        }

        return _buildInnerCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        item['ticketNo'],
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: AppFonts.bold,
                          color: const Color(0xFF2563EB),
                        ),
                      ),
                      SizedBox(width: 2.w),
                      _pillBadge(
                        text: priority,
                        bgColor: priorityBg,
                        textColor: priorityText,
                      ),
                    ],
                  ),
                  _pillBadge(
                    text: item['status'],
                    bgColor: isOpen
                        ?  AppColors.primarySurface
                        : AppColors.successSurface,
                    textColor: isOpen
                        ? AppColors.primary
                        : AppColors.success,
                  ),
                ],
              ),
              SizedBox(height: 0.7.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      '${item['contract']} • Tech: ${item['tech']}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontFamily: AppFonts.medium,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                  SizedBox(width: 2.w),
                  Text(
                    item['loggedOn'],
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontFamily: AppFonts.regular,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );

    // 5. INVOICES CARD
      case 4:
        return _buildInnerCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        item['invoiceNo'],
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: AppFonts.bold,
                          color: AppColors.primary,
                        ),
                      ),
                      SizedBox(width: 2.w),
                      _pillBadge(
                        text: item['contract'],
                        bgColor: AppColors.primarySurface,
                        textColor: AppColors.primary,
                      ),
                    ],
                  ),
                  Text(
                    item['totalAmount'],
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontFamily: AppFonts.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 0.7.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Issued: ${item['issueDate']}',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: AppFonts.regular,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  Text(
                    'Paid: ${item['paidAmount']}',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: AppFonts.bold,
                      color: AppColors.success,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );

      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildInnerCard({required Widget child}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.5.w, vertical: 1.25.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200, width: 1),
      ),
      child: child,
    );
  }

  Widget _pillBadge({
    required String text,
    required Color bgColor,
    required Color textColor,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.4.w, vertical: 0.35.h),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 13.sp,
          fontFamily: AppFonts.bold,
          color: textColor,
        ),
      ),
    );
  }


  List<Map<String, dynamic>> _getTabListData(int tabIndex) {
    switch (tabIndex) {
      case 0: // AMC Contracts
        return [
          {
            'contractNo': 'AMC-GREW-1009',
            'type': 'Comprehensive',
            'equipment': 'OT & Stretcher Bed Elevator (16 Passenger)',
            'model': 'SCH-5500-MED',
            'duration': 'Sep 1, 2026 - Sep 1, 2027',
            'value': '₹12,000',
            'status': 'Active',
          },
        ];

      case 1: // Equipment
        return [
          {
            'name': 'OT & Stretcher Bed Elevator (16 Passenger)',
            'category': 'Elevator',
            'brand': 'Schindler',
            'modelSerial': 'SCH-5500-MED (SN-SCH-2024-8841)',
            'location': 'Block A - Main OT Wing',
            'status': 'Active',
          },
        ];

      case 2:
        return [
          {
            'visitNo': 'VISIT-23',
            'contract': 'AMC-GREW-1009',
            'serviceType': 'Maintenance',
            'date': 'Nov 18, 2026',
            'technician': 'Haresh Vaghela',
            'status': 'In Progress',
          },
          {
            'visitNo': 'VISIT-22',
            'contract': 'AMC-GREW-1009',
            'serviceType': 'Maintenance',
            'date': 'Nov 18, 2026',
            'technician': 'Mahesh Makwana',
            'status': 'Scheduled',
          },
          {
            'visitNo': 'VISIT-21',
            'contract': 'AMC-GREW-1009',
            'serviceType': 'Maintenance',
            'date': 'Oct 22, 2026',
            'technician': 'Haresh Vaghela',
            'status': 'Scheduled',
          },
          {
            'visitNo': 'VISIT-20',
            'contract': 'AMC-GREW-1009',
            'serviceType': 'Inspection',
            'date': 'Sep 15, 2026',
            'technician': 'Haresh Vaghela',
            'status': 'Completed',
          },
        ];

      case 3: // Complaints
        return [
          {
            'ticketNo': 'TKT202600016',
            'contract': 'AMC-GREW-1009',
            'priority': 'High',
            'tech': 'Unassigned',
            'loggedOn': 'Nov 20, 2026',
            'status': 'Open',
          },
          {
            'ticketNo': 'TKT-5037',
            'contract': 'AMC-GREW-1009',
            'priority': 'Critical',
            'tech': 'Unassigned',
            'loggedOn': 'Nov 18, 2026',
            'status': 'Resolved',
          },
          {
            'ticketNo': 'TKT-5041',
            'contract': 'AMC-GREW-1009',
            'priority': 'Medium',
            'tech': 'Unassigned',
            'loggedOn': 'Nov 18, 2026',
            'status': 'Resolved',
          },
          {
            'ticketNo': 'TKT-5012',
            'contract': 'AMC-GREW-1009',
            'priority': 'Low',
            'tech': 'Haresh Vaghela',
            'loggedOn': 'Oct 05, 2026',
            'status': 'Resolved',
          },
        ];

      case 4: // Invoices
        return [
          {
            'invoiceNo': 'INV-2026-0003',
            'contract': 'General',
            'issueDate': 'Nov 19, 2026',
            'dueDate': 'Dec 4, 2026',
            'totalAmount': '₹1,180',
            'paidAmount': '₹1,180',
            'status': 'Paid',
          },
          {
            'invoiceNo': 'INV-GREW-8009',
            'contract': 'AMC-GREW-1009',
            'issueDate': 'Oct 29, 2026',
            'dueDate': 'Nov 28, 2026',
            'totalAmount': '₹12,000',
            'paidAmount': '₹12,000',
            'status': 'Paid',
          },
        ];

      default:
        return [];
    }
  }

}
