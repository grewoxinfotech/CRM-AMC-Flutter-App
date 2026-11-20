import 'package:flutter/material.dart';
import 'package:raiser_amc/core/theme/app_colors.dart';
import 'package:raiser_amc/core/theme/app_fonts.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool showArrow;
  final bool isOutlined;
  final double? width;
  final double height;
  final Color? backgroundColor;
  final Gradient? gradient;
  final Color? textColor;
  final double fontSize;
  final IconData? icon;
  final Color? iconColor;
  final double? iconSize;
  final bool iconAtStart;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.showArrow = false,
    this.isOutlined = false,
    this.width,
    this.height = 56,
    this.backgroundColor,
    this.gradient,
    this.textColor,
    this.fontSize = 16,
    this.icon,
    this.iconColor,
    this.iconSize,
    this.iconAtStart = false,
  });

  @override
  Widget build(BuildContext context) {
    final BorderRadius borderRadius = BorderRadius.circular(14);

    // ઈમેજ મુજબનો એકદમ બ્રાઇટ અને પ્રોપર Blue-to-Indigo Gradient[cite: 15]
    final Gradient exactButtonGradient = const LinearGradient(
      colors: [
        Color(0xFF1D74F5),
        Color(0xFF3667F0),
        Color(0xFF5856EC),
      ],
      stops: [0.0, 0.5, 1.0],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );

    final Color contentColor = isOutlined
        ? AppColors.primary
        : (textColor ?? AppColors.white);

    return Container(
      width: width ?? double.infinity,
      height: height,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: isOutlined ? AppColors.white : backgroundColor,
        gradient: (!isOutlined && backgroundColor == null)
            ? (gradient ?? exactButtonGradient)
            : null,
        border: isOutlined
            ? Border.all(color: AppColors.primary, width: 1.5)
            : Border.all(
          color: AppColors.white.withOpacity(0.18),
          width: 1,
        ),
        // boxShadow: isOutlined
        //     ? null
        //     : [
        //   BoxShadow(
        //     color: const Color(0xFF2563EB).withOpacity(0.32),
        //     offset: const Offset(0, 6),
        //     blurRadius: 14,
        //     spreadRadius: 0,
        //   ),
        //   BoxShadow(
        //     color: const Color(0xFF5856EC).withOpacity(0.20),
        //     offset: const Offset(2, 4),
        //     blurRadius: 10,
        //   ),
        // ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: borderRadius,
          splashColor: AppColors.white.withOpacity(0.2),
          highlightColor: AppColors.white.withOpacity(0.1),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null && iconAtStart) ...[
                  Icon(
                    icon,
                    size: iconSize ?? 18.sp,
                    color: iconColor ?? contentColor,
                  ),
                  const SizedBox(width: 8),
                ],

                Text(
                  text,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontFamily: AppFonts.bold,
                    color: contentColor,
                    letterSpacing: 0.3,
                  ),
                ),

                if (icon != null && !iconAtStart) ...[
                  const SizedBox(width: 8),
                  Icon(
                    icon,
                    size: iconSize ?? 18.sp,
                    color: iconColor ?? contentColor,
                  ),
                ] else if (showArrow) ...[
                  const SizedBox(width: 8),
                  Icon(
                    Icons.arrow_forward,
                    size: 18.sp,
                    color: contentColor,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}