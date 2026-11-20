import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raiser_amc/core/theme/app_colors.dart';
import 'package:raiser_amc/core/theme/app_fonts.dart';
import 'package:raiser_amc/core/utils/custom_button.dart';
import 'package:raiser_amc/ui/company_panel/clients/view/client_screen.dart';
import 'package:raiser_amc/ui/company_panel/equipment/view/equipment_list.dart';
import 'package:raiser_amc/ui/company_panel/home_screen/view/company_home_screen.dart';
import 'package:raiser_amc/ui/company_panel/subscriptions/view/subscriptions.dart';
import 'package:sizer/sizer.dart';

const List<Map<String, dynamic>> _kAmcDrawerMenu = [
  {'id': 'dashboard', 'label': 'Dashboard', 'icon': Icons.grid_view_rounded},
  {
    'id': 'subscriptions',
    'label': 'Subscriptions',
    'icon': Icons.credit_card_rounded,
  },
  {'id': 'clients', 'label': 'Clients', 'icon': Icons.groups_outlined},
  {
    'id': 'technicians',
    'label': 'Technicians',
    'icon': Icons.settings_outlined,
  },
  {'id': 'equipment', 'label': 'Equipment', 'icon': Icons.view_in_ar_outlined},
  {
    'id': 'amc_contracts',
    'label': 'AMC Contracts',
    'icon': Icons.verified_user_outlined,
  },
  {
    'id': 'service_visits',
    'label': 'Service Visits',
    'icon': Icons.calendar_today_outlined,
  },
  {
    'id': 'complaints',
    'label': 'Complaints',
    'icon': Icons.access_time_rounded,
  },
  {'id': 'invoices', 'label': 'Invoices', 'icon': Icons.description_outlined},
  {'id': 'payments', 'label': 'Payments', 'icon': Icons.payments_outlined},
];

class CustomSideDrawer extends StatefulWidget {
  final String activeMenuId;

  const CustomSideDrawer({super.key, this.activeMenuId = 'dashboard'});

  static void open(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  @override
  State<CustomSideDrawer> createState() => _CustomSideDrawerState();
}

class _CustomSideDrawerState extends State<CustomSideDrawer> {
  bool isLogout = false;

  void _closeAndGo(VoidCallback action) {
    Get.back();
    Future.microtask(action);
  }

  void _onMenuTap(String id) {
    if (id == widget.activeMenuId) {
      Get.back();
      return;
    }

    switch (id) {
      case 'dashboard':
        _closeAndGo(() => Get.offAll(() => CompanyHomeScreen()));
        break;
      case 'subscriptions':
        _closeAndGo(() => Get.to(() => const Subscriptions()));
        Get.back();
        break;
      case 'clients':
        _closeAndGo(() => Get.to(() =>  ClientScreen()));
        Get.back();
        break;
      case 'technicians':
        // _closeAndGo(() => Get.to(() => const TechniciansScreen()));
        Get.back();
        break;
      case 'equipment':
        _closeAndGo(() => Get.to(() => const EquipmentList()));
        Get.back();
        break;
      case 'amc_contracts':
        // _closeAndGo(() => Get.to(() => const AmcContractsScreen()));
        Get.back();
        break;
      case 'service_visits':
        // _closeAndGo(() => Get.to(() => const ServiceVisitsScreen()));
        Get.back();
        break;
      case 'complaints':
        // _closeAndGo(() => Get.to(() => const ComplaintsScreen()));
        Get.back();
        break;
      case 'invoices':
        // _closeAndGo(() => Get.to(() => const InvoicesScreen()));
        Get.back();
        break;
      case 'payments':
        // _closeAndGo(() => Get.to(() => const PaymentsScreen()));
        Get.back();
        break;
    }
  }

  void _logout() {
    Get.back();
    Get.dialog(
      StatefulBuilder(
        builder: (context, setDialogState) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.w),
            ),
            backgroundColor: AppColors.white,
            child: Padding(
              padding: EdgeInsets.all(5.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.logout_rounded,
                    color: AppColors.danger,
                    size: 5.h,
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    'Log out?',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontFamily: AppFonts.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Text(
                    'You will need to sign in again to access your company dashboard.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.5.sp,
                      fontFamily: AppFonts.regular,
                      color: AppColors.textSecondary,
                      height: 1.4,
                    ),
                  ),
                  SizedBox(height: 2.5.h),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          text: "Cancel",
                          height: 5.h,
                          backgroundColor: AppColors.surfaceSecondary,
                          textColor: AppColors.textPrimary,
                          fontSize: 14.sp,
                          onPressed: () {
                            Get.back();
                          },
                        ),
                      ),
                      SizedBox(width: 3.w),
                      Expanded(
                        child: isLogout
                            ? Container(
                                height: 5.h,
                                decoration: BoxDecoration(
                                  color: AppColors.danger,
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: const Center(
                                  child: SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2.5,
                                    ),
                                  ),
                                ),
                              )
                            : CustomButton(
                                text: "Logout",
                                height: 5.h,
                                backgroundColor: AppColors.danger,
                                textColor: AppColors.white,
                                fontSize: 14.sp,
                                onPressed: () {
                                  setDialogState(() {
                                    isLogout = true;
                                  });
                                  // અહીં તમારી Logout API કોલ કરવી અને પછી LoginScreen પર લઈ જવું:
                                  // Get.offAll(() => const LoginScreen());
                                },
                              ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 80.w,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(6.w),
          bottomRight: Radius.circular(6.w),
        ),
      ),
      backgroundColor: AppColors.white,
      child: Column(
        children: [
          SafeArea(
            bottom: false,
            child: Padding(
              padding: EdgeInsets.fromLTRB(4.5.w, 1.5.h, 4.5.w, 1.5.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF1D74F5), Color(0xFF3B82F6)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(13),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withOpacity(0.28),
                              offset: const Offset(0, 4),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.apartment_rounded,
                          color: AppColors.white,
                          size: 20.sp,
                        ),
                      ),
                      SizedBox(width: 3.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Raiser AMC',
                              style: TextStyle(
                                fontSize: 16.5.sp,
                                fontFamily: AppFonts.bold,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 2.h),

                  Container(
                    padding: EdgeInsets.all(3.2.w),
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: AppColors.borderLight),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [Color(0xFF1D74F5), Color(0xFF2563EB)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'G',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: AppFonts.bold,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                        SizedBox(width: 3.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Flexible(
                                    child: Text(
                                      'Grewox Infotech',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: AppFonts.bold,
                                        color: AppColors.textPrimary,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(width: 1.5.w),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 7,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFDBEAFE),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      'Admin',
                                      style: TextStyle(
                                        fontSize: 10.5.sp,
                                        fontFamily: AppFonts.bold,
                                        color: AppColors.primary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 3),
                              Text(
                                'grewoxinfotech@gmail.com',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontFamily: AppFonts.regular,
                                  color: AppColors.textMuted,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 1.4.h),

                  // Professional Plan ACTIVE Banner
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 3.5.w,
                      vertical: 1.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.successSurface,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColors.success.withOpacity(0.20),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: AppColors.success,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Expanded(
                          child: Text(
                            'Professional Plan',
                            style: TextStyle(
                              fontSize: 12.5.sp,
                              fontFamily: AppFonts.semiBold,
                              color: AppColors.success,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2.5,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.success.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            'ACTIVE',
                            style: TextStyle(
                              fontSize: 10.5.sp,
                              fontFamily: AppFonts.bold,
                              color: AppColors.success,
                              letterSpacing: 0.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Divider(height: 1, color: AppColors.divider),
          SizedBox(height: 2.h),

          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 3.5.w),
              itemCount: _kAmcDrawerMenu.length,
              itemBuilder: (context, i) {
                final item = _kAmcDrawerMenu[i];
                final String id = item['id'] as String;
                final bool isSelected = widget.activeMenuId == id;

                return Padding(
                  padding: EdgeInsets.only(bottom: 0.5.h),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => _onMenuTap(id),
                      borderRadius: BorderRadius.circular(14),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 3.5.w,
                          vertical: 1.4.h,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.primarySurface
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: AppColors.primary.withOpacity(0.08),
                                    offset: const Offset(0, 4),
                                    blurRadius: 10,
                                  ),
                                ]
                              : null,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              item['icon'] as IconData,
                              color: isSelected
                                  ? AppColors.primary
                                  : AppColors.iconMuted,
                              size: 2.5.h,
                            ),
                            SizedBox(width: 3.5.w),
                            Expanded(
                              child: Text(
                                item['label'] as String,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: isSelected
                                      ? AppFonts.bold
                                      : AppFonts.medium,
                                  color: isSelected
                                      ? AppColors.primary
                                      : AppColors.textSecondary,
                                ),
                              ),
                            ),
                            if (isSelected)
                              Container(
                                width: 4.5,
                                height: 18,
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          Divider(height: 1, color: AppColors.divider),

          // ==========================================
          // 3. BOTTOM LOGOUT AREA (WITH DIALOG)
          // ==========================================
          SafeArea(
            top: false,
            child: Padding(
              padding: EdgeInsets.fromLTRB(5.w, 1.h, 5.w, 1.5.h),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: _logout,
                  borderRadius: BorderRadius.circular(2.w),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 1.h,
                      horizontal: 2.w,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.logout_rounded,
                          color: AppColors.danger,
                          size: 2.4.h,
                        ),
                        SizedBox(width: 3.w),
                        Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: 14.5.sp,
                            fontFamily: AppFonts.bold,
                            color: AppColors.danger,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
