
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:raiser_amc/core/theme/app_colors.dart';
import 'package:raiser_amc/core/theme/app_fonts.dart';

class CustomAppBar extends StatelessWidget {
  final bool isMenu;
  final bool isBack;
  final bool isRightMenu;
  final bool showProfile;

  final String title;
  final String subtitle;

  final VoidCallback? onMenuTap;
  final VoidCallback? onBackTap;
  final VoidCallback? onRightMenuTap;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onProfileTap;

  const CustomAppBar({
    super.key,
    this.isMenu = false,
    this.isBack = false,
    this.isRightMenu = false,
    this.showProfile = false,
    this.title = 'Raiser AMC',
    this.subtitle = '',
    this.onMenuTap,
    this.onBackTap,
    this.onRightMenuTap,
    this.onNotificationTap,
    this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 8.5.h,
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.white,
            Color(0xFFF8FAFF),
            AppColors.primarySurface,
          ],
          stops: [0.0, 0.65, 1.0],
        ),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.white,
          width: 1.5,
        ),
        boxShadow: [
          // Main 3D Shadow
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.13),
            blurRadius: 18,
            spreadRadius: 1,
            offset: const Offset(0, 7),
          ),

          // Bottom Depth Shadow
          BoxShadow(
            color: AppColors.textPrimary.withValues(alpha: 0.07),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),

          // Top Highlight
          const BoxShadow(
            color: Color(0xFFFFFFFF),
            blurRadius: 5,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          // LEFT SIDE: MENU / BACK / LOGO

          if (isMenu)
            _iconButton(
              icon: Icons.menu_rounded,
              onTap: onMenuTap,
              background: AppColors.primary,
              iconColor: AppColors.white,
            )
          else if (isBack)
            _iconButton(
              icon: Icons.arrow_back_rounded,
              onTap: onBackTap ?? () => Navigator.pop(context),
              background: AppColors.primary,
              iconColor: AppColors.white,
            )
          else
            Container(
              height: 10.w,
              width: 10.w,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.primaryLight,
                    AppColors.primaryDark,
                  ],
                ),
                borderRadius: BorderRadius.circular(13),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.30),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(
                Icons.apartment_rounded,
                color: AppColors.white,
                size: 21.sp,
              ),
            ),

          SizedBox(width: 3.w),

          // TITLE AND SUBTITLE

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                    letterSpacing: 0.2,
                  ),
                ),

              ],
            ),
          ),



          if (isBack && isRightMenu)
            _iconButton(
              icon: Icons.menu_rounded,
              onTap: onRightMenuTap ?? onMenuTap,
              background: AppColors.primary,
              iconColor: AppColors.white,
            )
          else if (!isBack) ...[
            _iconButton(
              icon: Icons.notifications_none_rounded,
              onTap: onNotificationTap,
              background: AppColors.primary,
              iconColor: AppColors.white,
              showDot: true,
            ),

            if (showProfile) ...[
              SizedBox(width: 2.w),

              GestureDetector(
                onTap: onProfileTap,
                child: Container(
                  height: 9.5.w,
                  width: 9.5.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFEFF6FF),
                        Color(0xFFDCEAFE),
                      ],
                    ),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.primaryLight.withValues(
                        alpha: 0.35,
                      ),
                      width: 1.2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.13),
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                      const BoxShadow(
                        color: Colors.white,
                        blurRadius: 3,
                        offset: Offset(-1, -1),
                      ),
                    ],
                  ),
                  child: Text(
                    'G',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontFamily: AppFonts.bold,
                      color: AppColors.primaryDark,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ],
      ),
    );
  }

  // REUSABLE 3D ICON BUTTON

  Widget _iconButton({
    required IconData icon,
    VoidCallback? onTap,
    required Color background,
    required Color iconColor,
    bool showDot = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 9.5.w,
        width: 9.5.w,
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.primaryLight.withValues(alpha: 0.5),
            width: 1,
          ),
          boxShadow: [
            // Bottom Dark Shadow
            BoxShadow(
              color: AppColors.primaryDark.withValues(alpha: 0.35),
              blurRadius: 8,
              spreadRadius: 0.5,
              offset: const Offset(0, 5),
            ),

            // Soft Outer Shadow
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.20),
              blurRadius: 12,
              offset: const Offset(0, 3),
            ),

            // Top White Highlight
            BoxShadow(
              color: Colors.white.withValues(alpha: 0.35),
              blurRadius: 4,
              offset: const Offset(-1, -2),
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(
              icon,
              size: 21.sp,
              color: iconColor,
            ),

            if (showDot)
              Positioned(
                top: 1.2.w,
                right: 1.2.w,
                child: Container(
                  height: 7,
                  width: 7,
                  decoration: BoxDecoration(
                    color: AppColors.error,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.white,
                      width: 1,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
