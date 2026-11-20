
import 'package:flutter/material.dart';
import 'package:raiser_amc/core/theme/app_colors.dart';
import 'package:raiser_amc/core/theme/app_fonts.dart';
import 'package:sizer/sizer.dart';

class EquipmentCardWidget extends StatelessWidget {
  final int id;
  final String brand;
  final String category;
  final String typeBadge;
  final String title;
  final String location;
  final String mapUrl;

  final bool isAssigned;
  final String clientName;
  final String clientPhone;

  final String modelNo;
  final String serialNo;
  final String installDate;
  final String price;

  final IconData leadingIcon;
  final Color iconColor;
  final Color iconBgColor;

  final Color? cardBgColor;
  final Color? borderColor;

  final VoidCallback? onMapTap;
  final VoidCallback? onCallTap;
  final VoidCallback? onEditTap;
  final VoidCallback? onDeleteTap;
  final VoidCallback? onAssignTap;

  const EquipmentCardWidget({
    super.key,
    required this.id,
    required this.brand,
    required this.category,
    required this.typeBadge,
    required this.title,
    required this.location,
    this.mapUrl = '',
    required this.isAssigned,
    this.clientName = '',
    this.clientPhone = '',
    required this.modelNo,
    required this.serialNo,
    required this.installDate,
    this.price = '-',
    required this.leadingIcon,
    required this.iconColor,
    required this.iconBgColor,
    this.cardBgColor,
    this.borderColor,
    this.onMapTap,
    this.onCallTap,
    this.onEditTap,
    this.onDeleteTap,
    this.onAssignTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 1.5.h),
      padding: EdgeInsets.all(3.5.w),
      decoration: BoxDecoration(
        color: cardBgColor ?? AppColors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: borderColor ?? AppColors.borderLight,
          width: 1.1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.white.withOpacity(0.9),
            offset: const Offset(-4, -4),
            blurRadius: 12,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: AppColors.black.withOpacity(0.10),
            offset: const Offset(0, 7),
            blurRadius: 18,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: AppColors.black.withOpacity(0.05),
            offset: const Offset(4, 5),
            blurRadius: 12,
          ),
          BoxShadow(
            color: AppColors.primary.withOpacity(0.06),
            offset: const Offset(0, 5),
            blurRadius: 16,
            spreadRadius: -2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // HEADER
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 10.w,
                height: 10.w,
                decoration: BoxDecoration(
                  color: iconBgColor,
                  borderRadius: BorderRadius.circular(11),
                  border: Border.all(
                    color: iconColor.withOpacity(0.12),
                  ),
                ),
                child: Icon(
                  leadingIcon,
                  color: iconColor,
                  size: 20.sp,
                ),
              ),
              SizedBox(width: 2.5.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 2.w,
                      runSpacing: 0.4.h,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 1.5.w,
                            vertical: 0.3.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.background,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            brand.toUpperCase(),
                            style: TextStyle(
                              fontSize: 8.5.sp,
                              fontFamily: AppFonts.bold,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ),
                        Text(
                          category,
                          style: TextStyle(
                            fontSize: 9.sp,
                            fontFamily: AppFonts.regular,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 0.5.h),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 11.5.sp,
                        height: 1.25,
                        fontFamily: AppFonts.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 1.w),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 2.w,
                  vertical: 0.5.h,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF6FF),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0xFFDBEAFE),
                  ),
                ),
                child: Text(
                  typeBadge,
                  style: TextStyle(
                    fontSize: 8.sp,
                    fontFamily: AppFonts.medium,
                    color: const Color(0xFF2563EB),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 1.8.h),

          // LOCATION
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: 3.w,
              vertical: 1.2.h,
            ),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(11),
              border: Border.all(
                color: AppColors.borderLight,
                width: 0.8,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 16.sp,
                  color: AppColors.iconSecondary,
                ),
                SizedBox(width: 2.w),
                Expanded(
                  child: Text(
                    location,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 9.5.sp,
                      height: 1.3,
                      fontFamily: AppFonts.regular,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
                SizedBox(width: 1.w),
                InkWell(
                  onTap: onMapTap,
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 1.w,
                      vertical: 0.5.h,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Map',
                          style: TextStyle(
                            fontSize: 9.sp,
                            fontFamily: AppFonts.medium,
                            color: AppColors.primary,
                          ),
                        ),
                        Icon(
                          Icons.open_in_new_rounded,
                          size: 11.sp,
                          color: AppColors.primary,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 1.5.h),

          // ASSIGNED CLIENT / UNASSIGNED
          if (isAssigned)
            Row(
              children: [
                Container(
                  width: 8.w,
                  height: 8.w,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.12),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.person_outline_rounded,
                    size: 17.sp,
                    color: AppColors.primary,
                  ),
                ),
                SizedBox(width: 2.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Installed For',
                        style: TextStyle(
                          fontSize: 8.5.sp,
                          fontFamily: AppFonts.regular,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      SizedBox(height: 0.2.h),
                      RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 9.5.sp,
                            fontFamily: AppFonts.medium,
                            color: AppColors.textPrimary,
                          ),
                          children: [
                            TextSpan(
                              text: clientName,
                              style: TextStyle(
                                fontFamily: AppFonts.bold,
                              ),
                            ),
                            if (clientPhone.isNotEmpty)
                              TextSpan(
                                text: ' ($clientPhone)',
                                style: TextStyle(
                                  fontSize: 8.sp,
                                  fontFamily: AppFonts.regular,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: onCallTap,
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 2.w,
                      vertical: 0.8.h,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFECFDF5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.call_outlined,
                          size: 12.sp,
                          color: const Color(0xFF059669),
                        ),
                        SizedBox(width: 1.w),
                        Text(
                          'Call',
                          style: TextStyle(
                            fontSize: 9.sp,
                            fontFamily: AppFonts.semiBold,
                            color: const Color(0xFF059669),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          else
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 2.5.w,
                    vertical: 0.9.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF7E6),
                    borderRadius: BorderRadius.circular(9),
                    border: Border.all(
                      color: const Color(0xFFFDE68A),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.inventory_2_outlined,
                        size: 14,
                        color: Color(0xFFB45309),
                      ),
                      SizedBox(width: 1.5.w),
                      Text(
                        'Unassigned Stock',
                        style: TextStyle(
                          fontSize: 9.sp,
                          fontFamily: AppFonts.medium,
                          color: const Color(0xFFB45309),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: onAssignTap,
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 2.5.w,
                      vertical: 0.9.h,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFF6FF),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: const Color(0xFFBFDBFE),
                      ),
                    ),
                    child: Text(
                      '+ Assign Client',
                      style: TextStyle(
                        fontSize: 9.sp,
                        fontFamily: AppFonts.medium,
                        color: const Color(0xFF2563EB),
                      ),
                    ),
                  ),
                ),
              ],
            ),

          SizedBox(height: 1.5.h),

          // MODEL / SERIAL / INSTALL DATE
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 1.h),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColors.borderLight,
                width: 0.8,
              ),
            ),
            child: Row(
              children: [
                _infoItem('MODEL NO.', modelNo),
                _verticalDivider(),
                _infoItem('SERIAL NO.', serialNo),
                _verticalDivider(),
                _infoItem('INSTALL DATE', installDate),
              ],
            ),
          ),

          SizedBox(height: 1.5.h),

          // PRICE / ACTIONS
          Row(
            children: [
              Expanded(
                child: Text(
                  'Price: $price',
                  style: TextStyle(
                    fontSize: 9.sp,
                    fontFamily: AppFonts.regular,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
              _actionButton(
                icon: Icons.edit_outlined,
                color: AppColors.primary,
                background: const Color(0xFFEFF6FF),
                onTap: onEditTap,
              ),
              SizedBox(width: 2.w),
              _actionButton(
                icon: Icons.delete_outline_rounded,
                color: AppColors.danger,
                background: const Color(0xFFFEF2F2),
                onTap: onDeleteTap,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _infoItem(String label, String value) {
    return Expanded(
      child: Column(
        children: [
          Text(
            label,
            maxLines: 1,
            style: TextStyle(
              fontSize: 7.5.sp,
              fontFamily: AppFonts.medium,
              color: AppColors.textSecondary,
            ),
          ),
          SizedBox(height: 0.5.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.w),
            child: Text(
              value,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 8.5.sp,
                fontFamily: AppFonts.medium,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _verticalDivider() {
    return Container(
      height: 3.5.h,
      width: 1,
      color: AppColors.divider,
    );
  }

  Widget _actionButton({
    required IconData icon,
    required Color color,
    required Color background,
    required VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(9),
      child: Container(
        width: 8.w,
        height: 8.w,
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(9),
        ),
        alignment: Alignment.center,
        child: Icon(
          icon,
          size: 17.sp,
          color: color,
        ),
      ),
    );
  }
}
