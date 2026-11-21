
import 'package:flutter/material.dart';
import 'package:raiser_amc/core/theme/app_colors.dart';
import 'package:raiser_amc/core/theme/app_fonts.dart';
import 'package:sizer/sizer.dart';

class EquipmentTypeBottomSheet {
  static void show({
    required BuildContext context,
    required VoidCallback onEquipmentTap,
    required VoidCallback onSparePartTap,
    required VoidCallback onServiceTap,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(4.w),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(22),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 0.5.h,
                  width: 12.w,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 2.5.h),
              Text(
                'Select Item Type',
                style: TextStyle(
                  fontSize: 17.sp,
                  fontFamily: AppFonts.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: 0.5.h),
              Text(
                'Choose what you want to create',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: AppFonts.regular,
                  color: Colors.grey.shade600,
                ),
              ),
              SizedBox(height: 2.h),

              _option(
                icon: Icons.inventory_2_outlined,
                title: 'Equipment / Machine',
                subtitle:
                'Machinery installed at client site (Elevator, AC Plant, Generator, RO)',
                selected: true,
                onTap: () {
                  Navigator.pop(context);
                  onEquipmentTap();
                },
              ),
              SizedBox(height: 1.3.h),

              _option(
                icon: Icons.layers_outlined,
                title: 'Spare Part / Item',
                subtitle:
                'Sellable inventory items & parts (Sensor, Filter, Oil, Capacitor)',
                onTap: () {
                  Navigator.pop(context);
                  onSparePartTap();
                },
              ),
              SizedBox(height: 1.3.h),

              _option(
                icon: Icons.build_outlined,
                title: 'Service / Labor Charge',
                subtitle:
                'Billable service rate (Breakdown visit, Repairing, Overhauling)',
                onTap: () {
                  Navigator.pop(context);
                  onServiceTap();
                },
              ),
              SizedBox(height: 2.h),
            ],
          ),
        );
      },
    );
  }

  static Widget _option({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    bool selected = false,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(3.w),
        decoration: BoxDecoration(
          color: selected
              ? const Color(0xFFF4F8FF)
              : AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected
                ? AppColors.primary
                : Colors.grey.shade300,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: selected
                  ? AppColors.primary
                  : Colors.blueGrey,
              size: 22.sp,
            ),
            SizedBox(width: 3.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: AppFonts.semiBold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: 0.5.h),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12.5.sp,
                      fontFamily: AppFonts.regular,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18.sp,
              color: selected
                  ? AppColors.primary
                  : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
