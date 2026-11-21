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
    this.onMapTap,
    this.onCallTap,
    this.onEditTap,
    this.onDeleteTap,
    this.onAssignTap,
  });

  static const Color primaryColor = Color(0xFF3568F5);
  static const Color textColor = Color(0xFF17233C);
  static const Color secondaryColor = Color(0xFF8493AE);
  static const Color borderColor = Color(0xFFE8EDF5);
  static const Color lightBlue = Color(0xFFEEF4FF);
  static const Color lightGrey = Color(0xFFF7F9FC);
  static const Color greenColor = Color(0xFF10A878);
  static const Color redColor = Color(0xFFEF4444);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 1.5.h),
      padding: EdgeInsets.all(3.5.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: borderColor.withOpacity(0.7), width: 0.8),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF263B65).withOpacity(0.10),
            blurRadius: 18,
            spreadRadius: 0,
            offset: const Offset(0, 7),
          ),
          BoxShadow(
            color: const Color(0xFF263B65).withOpacity(0.04),
            blurRadius: 5,
            spreadRadius: 0,
            offset: const Offset(0, 2),
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
                height: 12.w,
                width: 12.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFFDCE8FF)),
                ),
                child: Icon(
                  Icons.precision_manufacturing_outlined,
                  color: AppColors.white,
                  size: 22.sp,
                ),
              ),

              SizedBox(width: 3.w),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 2.w,
                      runSpacing: 0.5.h,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 2.w,
                            vertical: 0.4.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            brand.toUpperCase(),
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: AppFonts.bold,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                        Text(
                          category,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: AppFonts.regular,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 0.5.h),

                    Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 15.sp,
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
                  horizontal: 2.2.w,
                  vertical: 0.6.h,
                ),
                decoration: BoxDecoration(
                  color: lightBlue,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Text(
                  typeBadge,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: AppFonts.medium,
                    color: primaryColor,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 1.8.h),

          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.2.h),
            decoration: BoxDecoration(
              color: AppColors.border,
              borderRadius: BorderRadius.circular(9),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: AppColors.primary,
                  size: 18.sp,
                ),

                SizedBox(width: 1.5.w),

                Expanded(
                  child: Text(
                    location,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.sp,
                      height: 1.3,
                      fontFamily: AppFonts.regular,
                      color: textColor,
                    ),
                  ),
                ),

                SizedBox(width: 1.w),

                Container(
                  height: 8.w,
                  width: 8.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: InkWell(
                    onTap: onMapTap,
                    borderRadius: BorderRadius.circular(8),
                    child: Icon(
                      Icons.location_on,
                      size: 18.sp,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 1.5.h),

          if (isAssigned)
            Row(
              children: [
                Container(
                  height: 10.w,
                  width: 10.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.30),
                        blurRadius: 10,
                        spreadRadius: 1,
                        offset: const Offset(0, 4),
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.10),
                        blurRadius: 5,
                        spreadRadius: 0,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.person_outline_rounded,
                    color: AppColors.white,
                    size: 18.sp,
                  ),
                ),

                SizedBox(width: 2.5.w),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Installed For',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: AppFonts.regular,
                          color: AppColors.textSecondary,
                        ),
                      ),

                      SizedBox(height: 0.2.h),

                      RichText(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontFamily: AppFonts.medium,
                            color: AppColors.textPrimary,
                          ),
                          children: [
                            TextSpan(
                              text: clientName,
                              style: TextStyle(fontFamily: AppFonts.bold),
                            ),
                            if (clientPhone.isNotEmpty)
                              TextSpan(
                                text: ' ($clientPhone)',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: AppFonts.regular,
                                  color: AppColors.textSecondary,
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
                      horizontal: 2.5.w,
                      vertical: 0.9.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.call_outlined,
                          size: 18.sp,
                          color: AppColors.white,
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
                  height: 10.w,
                  width: 10.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.30),
                        blurRadius: 10,
                        spreadRadius: 1,
                        offset: const Offset(0, 4),
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.10),
                        blurRadius: 5,
                        spreadRadius: 0,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.inventory_2_outlined,
                    size: 18.sp,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(width: 2.w),
                Text(
                  'Unassigned Stock',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontFamily: AppFonts.medium,
                    color: AppColors.textPrimary,
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: onAssignTap,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 3.w,
                      vertical: 1.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.25),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Text(
                      '+ Assign Client',
                      style: TextStyle(
                        fontSize: 12.5.sp,
                        fontFamily: AppFonts.semiBold,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),

          SizedBox(height: 1.5.h),

          // DIVIDER
          Container(
            height: 1,
            width: double.infinity,
            color: AppColors.divider,
          ),

          SizedBox(height: 1.5.h),

          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 2.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: lightGrey.withOpacity(0.8), width: 0.8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(child: _infoItem('MODEL NO.', modelNo)),
                _verticalDivider(),
                Expanded(child: _infoItem('SERIAL NO.', serialNo)),
                _verticalDivider(),
                Expanded(child: _infoItem('INSTALL DATE', installDate)),
              ],
            ),
          ),

          SizedBox(height: 1.5.h),

          // PRICE / ACTIONS
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'PRICE',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: AppFonts.medium,
                        color: AppColors.textSecondary,
                        letterSpacing: 0.8,
                      ),
                    ),
                    SizedBox(height: 0.4.h),
                    Text(
                      '$price',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: AppFonts.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),

              _actionButton(
                icon: Icons.edit_outlined,
                color: AppColors.white,
                background: AppColors.primary,
                onTap: onEditTap,
              ),

              SizedBox(width: 2.5.w),

              _actionButton(
                icon: Icons.delete_outline_rounded,
                color: AppColors.white,
                background: AppColors.danger,
                onTap: onDeleteTap,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _infoItem(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          maxLines: 1,
          style: TextStyle(
            fontSize: 12.5.sp,
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
              fontSize: 13.5.sp,
              fontFamily: AppFonts.medium,
              color: AppColors.textPrimary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _verticalDivider() {
    return Container(height: 3.5.h, width: 1, color: borderColor);
  }

  Widget _actionButton({
    required IconData icon,
    required Color color,
    required Color background,
    required VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: 8.w,
        width: 9.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: color, size: 18.sp),
      ),
    );
  }
}
