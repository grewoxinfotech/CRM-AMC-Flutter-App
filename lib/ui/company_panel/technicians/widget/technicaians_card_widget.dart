
import 'package:flutter/material.dart';
import 'package:raiser_amc/core/theme/app_colors.dart';
import 'package:raiser_amc/core/theme/app_fonts.dart';
import 'package:sizer/sizer.dart';

class TechniciansCardWidget extends StatelessWidget {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String alternatePhone;
  final String status;
  final String location;
  final String area;

  final bool isVerified;
  final int totalVisits;
  final int completedVisits;
  final int pendingVisits;
  final int activeVisits;

  final VoidCallback? onMapTap;
  final VoidCallback? onViewTap;
  final VoidCallback? onBlockTap;
  final VoidCallback? onEditTap;
  final VoidCallback? onDeleteTap;

  const TechniciansCardWidget({
    super.key,
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.alternatePhone = '',
    required this.status,
    required this.location,
    this.area = '',
    this.isVerified = true,
    this.totalVisits = 0,
    this.completedVisits = 0,
    this.pendingVisits = 0,
    this.activeVisits = 0,
    this.onMapTap,
    this.onViewTap,
    this.onBlockTap,
    this.onEditTap,
    this.onDeleteTap,
  });

  static const Color primaryColor = Color(0xFF3568F5);
  static const Color textColor = Color(0xFF17233C);
  static const Color secondaryColor = Color(0xFF8493AE);
  static const Color borderColor = Color(0xFFE8EDF5);
  static const Color greenColor = Color(0xFF10A878);
  static const Color orangeColor = Color(0xFFF59E0B);
  static const Color redColor = Color(0xFFEF4444);

  Color get statusColor {
    switch (status.toLowerCase()) {
      case 'active':
        return greenColor;
      case 'inactive':
        return orangeColor;
      case 'blocked':
        return redColor;
      default:
        return secondaryColor;
    }
  }

  Color get statusBackground {
    switch (status.toLowerCase()) {
      case 'active':
        return const Color(0xFFECFDF5);
      case 'inactive':
        return const Color(0xFFFFF7ED);
      case 'blocked':
        return const Color(0xFFFEF2F2);
      default:
        return const Color(0xFFF1F5F9);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        bottom: 1.5.h,
        left: 1.w,
        right: 1.w,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: borderColor.withOpacity(0.8),
          width: 0.9,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF263B65).withOpacity(0.08),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.025),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // HEADER
          Padding(
            padding: EdgeInsets.fromLTRB(3.5.w, 1.8.h, 3.5.w, 1.5.h),
            child: Row(
              children: [
                Container(
                  height: 11.w,
                  width: 11.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient:  LinearGradient(
                      colors: [
                        AppColors.primary,
                        AppColors.secondary,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(13),
                    boxShadow: [
                      BoxShadow(
                        color: primaryColor.withOpacity(0.25),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    name.isNotEmpty ? name.trim()[0].toUpperCase() : '?',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontFamily: AppFonts.bold,
                      color: Colors.white,
                    ),
                  ),
                ),

                SizedBox(width: 3.w),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontFamily: AppFonts.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      SizedBox(height: 0.3.h),
                      Row(
                        children: [
                          Icon(
                            Icons.mail_outline_rounded,
                            size: 18.sp,
                            color: AppColors.primary,
                          ),
                          SizedBox(width: 1.w),
                          Expanded(
                            child: Text(
                              email,
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
                ),

                SizedBox(width: 1.w),

                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 2.5.w,
                    vertical: 0.6.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.successSurface,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppColors.successSurface.withOpacity(0.25),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                          color: AppColors.success,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 1.w),
                      Text(
                        status,
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
          ),


          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.5.w),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 2.5.w,
                    vertical: 0.65.h,
                  ),
                  decoration: BoxDecoration(
                    color: isVerified
                        ? const Color(0xFFECFDF5)
                        : const Color(0xFFFFF1F2),
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(
                      color: isVerified
                          ? AppColors.success.withOpacity(0.25)
                          : AppColors.danger.withOpacity(0.25),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        isVerified
                            ? Icons.verified_rounded
                            : Icons.warning_amber_rounded,
                        size: 15.sp,
                        color: isVerified ? AppColors.success : AppColors.danger,
                      ),
                      SizedBox(width: 1.w),
                      Text(
                        isVerified ? 'Verified Docs' : 'Non-Verified Docs',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontFamily: AppFonts.medium,
                          color: isVerified ? AppColors.success : AppColors.danger,
                        ),
                      ),
                    ],
                  ),
                ),

                 Spacer(),

                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 2.w,
                    vertical: 0.6.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F5F9),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.phone_outlined,
                        size: 18.sp,
                        color: AppColors.primary,
                      ),
                      SizedBox(width: 1.w),
                      Text(
                        phone,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: AppFonts.medium,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          if (alternatePhone.isNotEmpty)
            Padding(
              padding: EdgeInsets.only(
                left: 4.w,
                top: 0.6.h,
              ),
              child: Text(
                'Alt Contact: $alternatePhone',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: AppFonts.regular,
                  color: AppColors.textPrimary,
                ),
              ),
            ),

          SizedBox(height: 1.5.h),

          // DIVIDER
          Container(
            height: 1,
            color: AppColors.divider,
          ),

          // LOCATION
          Padding(
            padding: EdgeInsets.fromLTRB(3.5.w, 1.5.h, 3.5.w, 1.h),
            child: Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: primaryColor,
                  size: 18.sp,
                ),
                SizedBox(width: 1.5.w),

                Expanded(
                  child: RichText(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: location,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: AppFonts.medium,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        if (area.isNotEmpty)
                          TextSpan(
                            text: '  • $area',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: AppFonts.regular,
                              color: AppColors.textSecondary,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),

                InkWell(
                  onTap: onMapTap,
                  borderRadius: BorderRadius.circular(5),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 1.w,
                      vertical: 0.5.h,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'View Map',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: AppFonts.medium,
                            color: AppColors.primary,
                          ),
                        ),
                        Icon(
                          Icons.chevron_right_rounded,
                          size: 18.sp,
                          color: AppColors.primary,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ASSIGNED VISITS
          Padding(
            padding: EdgeInsets.fromLTRB(3.5.w, 0, 3.5.w, 1.5.h),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(2.5.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: borderColor),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.025),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Assigned Visits',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontFamily: AppFonts.medium,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      Text(
                        'Total: $totalVisits visits',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontFamily: AppFonts.bold,
                          color: textColor,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 1.h),

                  Wrap(
                    spacing: 1.5.w,
                    runSpacing: 0.7.h,
                    children: [
                      _visitBadge(
                        Icons.check_circle,
                        '$completedVisits Done',
                        AppColors.success,
                        AppColors.successSurface,
                      ),
                      _visitBadge(
                        Icons.schedule_rounded,
                        '$pendingVisits Pending',
                        AppColors.warning,
                        AppColors.warningSurface,
                      ),
                      _visitBadge(
                        Icons.info_rounded,
                        '$activeVisits Active',
                        AppColors.primary,
                          AppColors.primarySurface,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // ACTIONS
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 3.5.w,
              vertical: 1.4.h,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFFAFBFD),
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(18),
              ),
              border: Border(
                top: BorderSide(color: borderColor),
              ),
            ),
            child: Row(
              children: [
                Text(
                  'Action Controls : ',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: AppFonts.medium,
                    color: secondaryColor,
                  ),
                ),

                 Spacer(),

                _actionButton(
                  icon: Icons.visibility_outlined,
                  color: AppColors.white,
                  backgroundColor: AppColors.primary,
                  borderColor: AppColors.primary,
                  onTap: onViewTap,
                ),

                SizedBox(width: 2.w,),

                _actionButton(
                  icon: Icons.block_rounded,
                  color: AppColors.white,
                  backgroundColor: AppColors.danger,
                  borderColor: AppColors.danger,
                  onTap: onBlockTap,
                ),

                SizedBox(width: 2.w,),

                _actionButton(
                  icon: Icons.edit_outlined,
                  color: AppColors.white,
                  backgroundColor: AppColors.primary,
                  borderColor: AppColors.primary,
                  onTap: onEditTap,
                ),
                SizedBox(width: 2.w,),
                _actionButton(
                  icon: Icons.delete_outline,
                  color: AppColors.white,
                  backgroundColor: AppColors.danger,
                  borderColor: AppColors.danger,
                  onTap: onDeleteTap,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _visitBadge(
      IconData icon,
      String text,
      Color color,
      Color background,
      ) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 2.w,
        vertical: 0.55.h,
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: color.withOpacity(0.2),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 18.sp,
            color: color,
          ),
          SizedBox(width: 1.w),
          Text(
            text,
            style: TextStyle(
              fontSize: 13.sp,
              fontFamily: AppFonts.semiBold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _actionButton({
    required IconData icon,
    required Color color,
    required Color backgroundColor,
    Color? borderColor,
    required VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 8.w,
        height: 8.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: borderColor ?? backgroundColor,
            width: 1,
          ),
        ),
        child: Icon(
          icon,
          size: 17.sp,
          color: color,
        ),
      ),
    );
  }
}
