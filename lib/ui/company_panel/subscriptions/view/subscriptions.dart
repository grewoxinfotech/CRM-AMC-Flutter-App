import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:raiser_amc/core/theme/app_colors.dart';
import 'package:raiser_amc/core/theme/app_fonts.dart';
import 'package:raiser_amc/core/utils/custom_app_bar.dart';
import 'package:raiser_amc/core/utils/custom_button.dart';
import 'package:raiser_amc/core/utils/custom_side_drawer.dart';
import 'package:sizer/sizer.dart';

class Subscriptions extends StatefulWidget {
  const Subscriptions({super.key});

  @override
  State<Subscriptions> createState() => _SubscriptionsState();
}

class _SubscriptionsState extends State<Subscriptions> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool isAutoRenewal = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomSideDrawer(activeMenuId: 'subscriptions'),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 6.h),
              CustomAppBar(
                title: 'Subscriptions',
                isBack: false,
                isMenu: true,
                onMenuTap: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
              ).paddingSymmetric(horizontal: 4.w),

              SizedBox(height: 2.h),

              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'AMC Plan Management',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: AppFonts.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      SizedBox(height: 0.6.h),
                      Text(
                        "Manage your company's subscription plan and view billing history.",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: AppFonts.regular,
                          color: AppColors.textSecondary,
                          height: 1.4,
                        ),
                      ),

                      SizedBox(height: 2.h),

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
                            // Deep ambient shadow
                            BoxShadow(
                              color: AppColors.black.withOpacity(0.12),
                              offset: const Offset(0, 10),
                              blurRadius: 25,
                              spreadRadius: 1,
                            ),

                            // Bottom contact shadow
                            BoxShadow(
                              color: AppColors.black.withOpacity(0.05),
                              offset: const Offset(0, 4),
                              blurRadius: 10,
                              spreadRadius: 0,
                            ),

                            // Blue ambient glow
                            BoxShadow(
                              color: AppColors.primary.withOpacity(0.10),
                              offset: const Offset(0, 6),
                              blurRadius: 18,
                              spreadRadius: -2,
                            ),

                            // Top-left 3D highlight
                            BoxShadow(
                              color: AppColors.white.withOpacity(0.95),
                              offset: const Offset(-4, -4),
                              blurRadius: 10,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(22),
                          child: Container(
                            // Left Blue Accent Stripe[cite: 18]
                            decoration: const BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                  color: AppColors.white,
                                  width: 5,
                                ),
                              ),
                            ),
                            padding: EdgeInsets.all(4.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: AppColors.primary,
                                        borderRadius: BorderRadius.circular(11),
                                      ),
                                      alignment: Alignment.center,
                                      child: Icon(
                                        Icons.verified_outlined,
                                        color: AppColors.white,
                                        size: 20.sp,
                                      ),
                                    ),
                                    SizedBox(width: 3.w),
                                    Expanded(
                                      child: Text(
                                        'Subscription Status',
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          fontFamily: AppFonts.bold,
                                          color: AppColors.textPrimary,
                                        ),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          'REMAINING ACCESS',
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontFamily: AppFonts.bold,
                                            color: AppColors.textMuted,
                                            letterSpacing: 0.4,
                                          ),
                                        ),
                                        const SizedBox(height: 3),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 3,
                                          ),
                                          decoration: BoxDecoration(
                                            color: AppColors.primarySurface,
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                          ),
                                          child: Text(
                                            '29 days left',
                                            style: TextStyle(
                                              fontSize: 13.sp,
                                              fontFamily: AppFonts.bold,
                                              color: AppColors.primary,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                SizedBox(height: 2.h),

                                // ==========================================
                                // 2. INNER PLAN CARD: Professional Business Plan[cite: 18]
                                // ==========================================
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(3.8.w),
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xFFF8FAFF),
                                        Color(0xFFEFF6FF),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: AppColors.primary.withOpacity(
                                        0.18,
                                      ),
                                      width: 1,
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Badges Row: CURRENT ACTIVE PLAN + Active[cite: 18]
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10,
                                              vertical: 4,
                                            ),
                                            decoration: BoxDecoration(
                                              color: AppColors.white,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                color: AppColors.primary
                                                    .withOpacity(0.20),
                                              ),
                                            ),
                                            child: Text(
                                              'CURRENT ACTIVE PLAN',
                                              style: TextStyle(
                                                fontSize: 13.sp,
                                                fontFamily: AppFonts.bold,
                                                color: AppColors.primary,
                                                letterSpacing: 0.4,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10,
                                              vertical: 4,
                                            ),
                                            decoration: BoxDecoration(
                                              color: AppColors.successSurface,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Container(
                                                  width: 7,
                                                  height: 7,
                                                  decoration:
                                                      const BoxDecoration(
                                                        color:
                                                            AppColors.success,
                                                        shape: BoxShape.circle,
                                                      ),
                                                ),
                                                const SizedBox(width: 5),
                                                Text(
                                                  'Active',
                                                  style: TextStyle(
                                                    fontSize: 13.sp,
                                                    fontFamily: AppFonts.bold,
                                                    color: AppColors.success,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),

                                      SizedBox(height: 1.5.h),

                                      Text(
                                        'Professional Business Plan',
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          fontFamily: AppFonts.bold,
                                          color: AppColors.textPrimary,
                                        ),
                                      ),

                                      SizedBox(height: 0.6.h),

                                      Text(
                                        'Advanced capabilities for mid-sized teams with field technicians.',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontFamily: AppFonts.regular,
                                          color: AppColors.textSecondary,
                                          height: 1.35,
                                        ),
                                      ),

                                      SizedBox(height: 1.6.h),
                                      Divider(
                                        height: 1,
                                        thickness: 1,
                                        color: AppColors.primary.withOpacity(
                                          0.10,
                                        ),
                                      ),
                                      SizedBox(height: 1.4.h),

                                      // Price & Billing Cycle Row[cite: 18]
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.baseline,
                                        textBaseline: TextBaseline.alphabetic,
                                        children: [
                                          Text(
                                            '₹4,999',
                                            style: TextStyle(
                                              fontSize: 18.sp,
                                              fontFamily: AppFonts.bold,
                                              color: AppColors.textPrimary,
                                            ),
                                          ),
                                          Text(
                                            ' / Monthly',
                                            style: TextStyle(
                                              fontSize: 13.5.sp,
                                              fontFamily: AppFonts.medium,
                                              color: AppColors.textSecondary,
                                            ),
                                          ),
                                          const Spacer(),
                                          Text(
                                            'Billed Monthly',
                                            style: TextStyle(
                                              fontSize: 12.5.sp,
                                              fontFamily: AppFonts.medium,
                                              color: AppColors.textSecondary,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(height: 1.8.h),

                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 3.5.w,
                                    vertical: 1.5.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.background,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Start Date',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontFamily: AppFonts.medium,
                                          color: AppColors.textSecondary,
                                        ),
                                      ),
                                      Text(
                                        'November 19, 2026',
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          fontFamily: AppFonts.bold,
                                          color: AppColors.textPrimary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(height: 1.2.h),

                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 3.5.w,
                                    vertical: 1.5.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.background,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Renewal / Expiry Date',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontFamily: AppFonts.medium,
                                          color: AppColors.textSecondary,
                                        ),
                                      ),
                                      Text(
                                        'December 19, 2026',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontFamily: AppFonts.bold,
                                          color: AppColors.textPrimary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(height: 1.2.h),

                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 3.5.w,
                                    vertical: 1.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.background,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.sync_rounded,
                                        color: AppColors.primary,
                                        size: 19.sp,
                                      ),
                                      SizedBox(width: 2.5.w),
                                      Expanded(
                                        child: Text(
                                          'Auto Renewal',
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                            fontFamily: AppFonts.semiBold,
                                            color: AppColors.textPrimary,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 24,
                                        width: 42,
                                        child: Transform.scale(
                                          scale: 0.78,
                                          child: Switch(
                                            value: isAutoRenewal,
                                            activeThumbColor: AppColors.white,
                                            activeTrackColor: AppColors.primary,
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            onChanged: (val) {
                                              setState(() {
                                                isAutoRenewal = val;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(height: 2.h),

                                CustomButton(
                                  text: 'Renew / Upgrade Plan',
                                  icon: Icons.sync_rounded,
                                  iconAtStart: true,
                                  height: 5.8.h,
                                  fontSize: 15.sp,
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 2.h),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Section Header: Clock Icon + Title + Records Badge
                          Row(
                            children: [
                              Container(
                                width: 38,
                                height: 38,
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Icons.access_time_rounded,
                                  color: AppColors.white,
                                  size: 19.sp,
                                ),
                              ),
                              SizedBox(width: 2.w),
                              Expanded(
                                child: Text(
                                  'Subscription & Payment History',
                                  style: TextStyle(
                                    fontSize: 15.5.sp,
                                    fontFamily: AppFonts.bold,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 1.8.h),

                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(4.w),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(22),
                              border: Border.all(
                                color: AppColors.border,
                                width: 1,
                              ),
                              boxShadow: [
                                // Top-left white highlight (3D ઉપસેલો લુક)
                                BoxShadow(
                                  color: AppColors.white.withOpacity(0.95),
                                  offset: const Offset(-4, -4),
                                  blurRadius: 10,
                                  spreadRadius: 1,
                                ),
                                // Main ambient black shadow
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
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // 1. Header Row: Clock Icon + Title + Records Badge
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
                                        Icons.access_time_rounded,
                                        color: AppColors.white,
                                        size: 19.sp,
                                      ),
                                    ),
                                    SizedBox(width: 2.5.w),
                                    Expanded(
                                      child: Text(
                                        'Subscription & Payment History',
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          fontFamily: AppFonts.bold,
                                          color: AppColors.textPrimary,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 2.8.w,
                                        vertical: 0.5.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.surfaceSecondary,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        '${subscriptionHistoryList.length} records',
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          fontFamily: AppFonts.semiBold,
                                          color: AppColors.textSecondary,
                                        ),
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

                                SizedBox(
                                  height: subscriptionHistoryList.length > 3
                                      ? 39.h
                                      : null,
                                  // 3 થી વધુ હોય તો જ ફિક્સ હાઈટ અને સ્ક્રોલ
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    primary: false,
                                    physics: subscriptionHistoryList.length > 3
                                        ? const BouncingScrollPhysics()
                                        : const NeverScrollableScrollPhysics(),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 1.w,
                                      vertical: 0.5.h,
                                    ),
                                    itemCount: subscriptionHistoryList.length,
                                    separatorBuilder: (context, index) =>
                                        SizedBox(height: 1.4.h),
                                    itemBuilder: (context, index) {
                                      final item =
                                          subscriptionHistoryList[index];
                                      return _buildSubscriptionHistoryCard(
                                        planName: item['planName'] as String,
                                        cycle: item['cycle'] as String,
                                        price: item['price'] as String,
                                        status: item['status'] as String,
                                        isActive: item['isActive'] as bool,
                                        dateRange: item['dateRange'] as String,
                                        onInvoiceTap: () {
                                          // Download / View Invoice logic
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 2.h),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // ==========================================
                              // 1. HEADER: Sparkle Icon + Available Plans to Upgrade
                              // ==========================================
                              Row(
                                children: [
                                  Icon(
                                    Icons.auto_awesome_outlined,
                                    color: AppColors.primary,
                                    size: 20.sp,
                                  ),
                                  SizedBox(width: 2.w),
                                  Expanded(
                                    child: Text(
                                      'Available Plans to Upgrade',
                                      style: TextStyle(
                                        fontSize: 16.5.sp,
                                        fontFamily: AppFonts.bold,
                                        color: AppColors.textPrimary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 0.5.h),
                              Text(
                                'Choose from the available plans below to upgrade your workspace.',
                                style: TextStyle(
                                  fontSize: 13.5.sp,
                                  fontFamily: AppFonts.regular,
                                  color: AppColors.textSecondary,
                                ),
                              ),

                              SizedBox(height: 2.h),

                              SizedBox(
                                height: 62.h,
                                child: PageView.builder(
                                  controller: _planPageController,
                                  clipBehavior: Clip.none,
                                  itemCount: availablePlansList.length,
                                  onPageChanged: (index) {
                                    setState(() {
                                      _currentPlanPage = index;
                                    });
                                  },
                                  itemBuilder: (context, index) {
                                    return AnimatedBuilder(
                                      animation: _planPageController,
                                      builder: (context, child) {
                                        double value = 1.0;
                                        if (_planPageController.position.haveDimensions) {
                                          value = _planPageController.page! - index;
                                          value = (1 - (value.abs() * 0.14)).clamp(0.86, 1.0);
                                        } else {
                                          value = (index == _currentPlanPage) ? 1.0 : 0.86;
                                        }

                                        return Center(
                                          child: Transform.scale(
                                            scale: Curves.easeOut.transform(value),
                                            child: Opacity(
                                              opacity: (value < 0.92) ? 0.78 : 1.0,
                                              child: child,
                                            ),
                                          ),
                                        );
                                      },
                                      child: _buildPlanSliderCard(availablePlansList[index]),
                                    );
                                  },
                                ),
                              ),

                              SizedBox(height: 1.5.h),

                            ],
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

  final List<Map<String, dynamic>> subscriptionHistoryList = [
    {
      'planName': 'Professional Business Plan',
      'cycle': 'Monthly Cycle',
      'price': '₹4,999',
      'status': 'Active',
      'isActive': true,
      'dateRange': 'Nov 19, 2026 — Dec 19, 2026',
    },
    {
      'planName': 'Enterprise Unlimited Plan',
      'cycle': 'Yearly Cycle',
      'price': '₹14,999',
      'status': 'Expired',
      'isActive': false,
      'dateRange': 'Aug 18, 2026 — Aug 18, 2027',
    },
    {
      'planName': 'Starter Growth Plan',
      'cycle': 'Monthly Cycle',
      'price': '₹1,999',
      'status': 'Expired',
      'isActive': false,
      'dateRange': 'Jul 10, 2026 — Aug 10, 2026',
    },
    {
      'planName': 'Basic Trial Plan',
      'cycle': 'Monthly Cycle',
      'price': '₹999',
      'status': 'Expired',
      'isActive': false,
      'dateRange': 'Jun 01, 2026 — Jul 01, 2026',
    },
  ];

  Widget _buildSubscriptionHistoryCard({
    required String planName,
    required String cycle,
    required String price,
    required String status,
    required bool isActive,
    required String dateRange,
    required VoidCallback onInvoiceTap,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border, width: 1),
        boxShadow: [
          BoxShadow(
            color: AppColors.white.withOpacity(0.95),
            offset: const Offset(-3, -3),
            blurRadius: 8,
            spreadRadius: 1,
          ),

          BoxShadow(
            color: AppColors.black.withOpacity(0.07),
            offset: const Offset(0, 6),
            blurRadius: 16,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: AppColors.black.withOpacity(0.03),
            offset: const Offset(0, 2),
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row: Plan Name + Active/Expired Status Badge[cite: 19]
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      planName,
                      style: TextStyle(
                        fontSize: 15.5.sp,
                        fontFamily: AppFonts.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: 0.5.h),
                    Row(
                      children: [
                        Text(
                          cycle,
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontFamily: AppFonts.medium,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.w),
                          child: Text(
                            '•',
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: AppColors.textMuted,
                            ),
                          ),
                        ),
                        Text(
                          price,
                          style: TextStyle(
                            fontSize: 13.5.sp,
                            fontFamily: AppFonts.bold,
                            color: isActive
                                ? AppColors.primary
                                : AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: 2.w),
              // Status Pill Badge (Green for Active, Red for Expired)[cite: 19]
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
                        ? AppColors.success.withOpacity(0.35)
                        : AppColors.danger.withOpacity(0.30),
                    width: 1,
                  ),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: AppFonts.bold,
                    color: isActive ? AppColors.success : AppColors.danger,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 1.6.h),
          Divider(height: 1, thickness: 1, color: AppColors.borderLight),
          SizedBox(height: 1.4.h),

          // Bottom Row: Calendar Date Range + Invoice Download Button[cite: 19]
          Row(
            children: [
              Icon(
                Icons.calendar_today_outlined,
                size: 16.sp,
                color: AppColors.iconMuted,
              ),
              SizedBox(width: 2.w),
              Expanded(
                child: Text(
                  dateRange,
                  style: TextStyle(
                    fontSize: 12.5.sp,
                    fontFamily: AppFonts.medium,
                    color: AppColors.textSecondary,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(width: 2.w),
              InkWell(
                onTap: onInvoiceTap,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 3.2.w,
                    vertical: 0.8.h,
                  ),
                  decoration: BoxDecoration(
                    color: isActive
                        ? AppColors.primarySurface
                        : AppColors.surfaceSecondary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.download_rounded,
                        size: 16.sp,
                        color: isActive
                            ? AppColors.primary
                            : AppColors.iconSecondary,
                      ),
                      SizedBox(width: 1.2.w),
                      Text(
                        'Invoice',
                        style: TextStyle(
                          fontSize: 12.5.sp,
                          fontFamily: AppFonts.bold,
                          color: isActive
                              ? AppColors.primary
                              : AppColors.textSecondary,
                        ),
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

  late PageController _planPageController;
  int _currentPlanPage =
      1;

  final List<Map<String, dynamic>> availablePlansList = [
    {
      'title': 'Basic Growth Plan',
      'subtitle':
          'Ideal for small service providers managing routine maintenance contracts.',
      'price': '₹1,499',
      'cycle': '/ monthly',
      'isPopular': false,
      'isCurrent': false,
      'features': [
        '5 Users',
        '25 AMCs',
        '50 Products',
        'Invoicing & Payments',
        'Email Support',
      ],
    },
    {
      'title': 'Professional Business Plan',
      'subtitle':
          'Advanced capabilities for mid-sized teams with field technicians.',
      'price': '₹4,999',
      'cycle': '/ yearly',
      'isPopular': true,
      'isCurrent': true,
      'features': [
        '15 Users',
        '100 AMCs',
        '200 Products',
        'Service Visits & Digital Signatures',
        'Complaint Tracking',
        'Priority Support',
      ],
    },
    {
      'title': 'Enterprise Unlimited Plan',
      'subtitle':
          'Full-featured enterprise plan with unlimited users and high-volume AMCs.',
      'price': '₹14,999',
      'cycle': '/ yearly',
      'isPopular': false,
      'isCurrent': false,
      'features': [
        'Unlimited Users',
        'Unlimited AMCs',
        'Unlimited Products',
        'Custom Branding',
        'Dedicated Account Manager',
        '24/7 SLA Support',
      ],
    },
  ];

  @override
  void initState() {
    super.initState();
    _planPageController = PageController(
      viewportFraction: 0.84,
      initialPage: 1,
    );
  }

  @override
  void dispose() {
    _planPageController.dispose();
    super.dispose();
  }

  Widget _buildPlanSliderCard(Map<String, dynamic> plan) {
    final bool isPopular = plan['isPopular'] as bool;
    final bool isCurrent = plan['isCurrent'] as bool;
    final List<String> features = plan['features'] as List<String>;

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(
            top: 16,
            bottom: 16,
            left: 4,
            right: 4,
          ),
          padding: EdgeInsets.fromLTRB(4.5.w, isPopular ? 2.8.h : 2.2.h, 4.5.w, 2.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: isPopular ? AppColors.primary : AppColors.border,
              width: isPopular ? 1.8 : 1.1,
            ),
            boxShadow: [
              // Top-left white highlight (3D ઉપસેલો લુક)
              BoxShadow(
                color: AppColors.white.withOpacity(0.95),
                offset: const Offset(-4, -4),
                blurRadius: 10,
                spreadRadius: 1,
              ),
              // Primary glow for Popular card, soft black for others
              BoxShadow(
                color: isPopular
                    ? AppColors.primary.withOpacity(0.16)
                    : AppColors.black.withOpacity(0.08),
                offset: const Offset(0, 10),
                blurRadius: 22,
                spreadRadius: 1,
              ),
              BoxShadow(
                color: AppColors.black.withOpacity(0.03),
                offset: const Offset(0, 3),
                blurRadius: 6,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Plan Title & Subtitle
              Text(
                plan['title'] as String,
                style: TextStyle(
                  fontSize: 16.5.sp,
                  fontFamily: AppFonts.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: 0.6.h),
              Text(
                plan['subtitle'] as String,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontFamily: AppFonts.regular,
                  color: AppColors.textSecondary,
                  height: 1.35,
                ),
              ),

              SizedBox(height: 1.6.h),
              Divider(height: 1, thickness: 1, color: AppColors.borderLight),
              SizedBox(height: 1.6.h),

              // Price Row
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    plan['price'] as String,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontFamily: AppFonts.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(width: 1.w),
                  Text(
                    plan['cycle'] as String,
                    style: TextStyle(
                      fontSize: 13.5.sp,
                      fontFamily: AppFonts.medium,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 1.6.h),
              Divider(height: 1, thickness: 1, color: AppColors.borderLight),
              SizedBox(height: 1.4.h),

              // FEATURES Label[cite: 20]
              Text(
                'FEATURES',
                style: TextStyle(
                  fontSize: 11.5.sp,
                  fontFamily: AppFonts.bold,
                  color: AppColors.textMuted,
                  letterSpacing: 0.6,
                ),
              ),
              SizedBox(height: 1.h),

              // Features Checklist[cite: 20]
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: features.length,
                  itemBuilder: (context, idx) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 0.9.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.check_rounded,
                            color: AppColors.primary,
                            size: 17.sp,
                          ),
                          SizedBox(width: 2.5.w),
                          Expanded(
                            child: Text(
                              features[idx],
                              style: TextStyle(
                                fontSize: 13.5.sp,
                                fontFamily: AppFonts.medium,
                                color: AppColors.textSecondary,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 1.h),

              // Bottom Action Button (Gradient for Current Plan, Outlined for Upgrade)[cite: 20]
              isCurrent
                  ? Opacity(
                opacity: 0.85,
                child: CustomButton(
                  text: 'Current Plan',
                  height: 5.4.h,
                  fontSize: 14.sp,
                  onPressed: () {},
                ),
              )
                  : CustomButton(
                text: 'Upgrade to this Plan',
                height: 5.4.h,
                fontSize: 14.sp,
                isOutlined: true,
                onPressed: () {
                  // Upgrade plan logic
                },
              ),
            ],
          ),
        ),

        // Top Floating "MOST POPULAR" Pill Badge[cite: 20]
        if (isPopular)
          Positioned(
            top: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4.5),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1D74F5), Color(0xFF4F46E5)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.30),
                    offset: const Offset(0, 4),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Text(
                'MOST POPULAR',
                style: TextStyle(
                  fontSize: 10.5.sp,
                  fontFamily: AppFonts.bold,
                  color: AppColors.white,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
