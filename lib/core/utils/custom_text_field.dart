import 'package:flutter/material.dart';
import 'package:raiser_amc/core/theme/app_colors.dart';
import 'package:raiser_amc/core/theme/app_fonts.dart';
import 'package:sizer/sizer.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String hintText;
  final IconData prefixIcon;
  final bool isPassword;
  final TextInputType inputType;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final bool isFilter;
  final VoidCallback? onFilterChange;
  final VoidCallback? onTap;
  final bool isReadOnly;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.hintText,
    required this.prefixIcon,
    required this.controller,
    this.isPassword = false,
    this.inputType = TextInputType.text,
    this.validator,
    this.onChanged,
    this.isFilter = false,
    this.onFilterChange,
    this.onTap,
    this.maxLength,
    this.isReadOnly = false,
    this.maxLines,
    this.minLines,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label.trim().isNotEmpty) ...[
          Text(
            widget.label,
            style: TextStyle(
              fontSize: 15.sp,
              fontFamily: AppFonts.bold,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 1.h),
        ],

        SizedBox(height: 1.h),

        TextFormField(
          controller: widget.controller,
          keyboardType: widget.inputType,
          obscureText: _obscureText,
          onChanged: widget.onChanged,
          validator: widget.validator,
          onTap: widget.onTap,
          readOnly: widget.isReadOnly,
          maxLength: widget.maxLength,
          maxLines: _obscureText ? 1 : (widget.maxLines ?? 1),
          minLines: _obscureText ? 1 : (widget.minLines ?? 1),

          style: TextStyle(
            fontSize: 14.sp,
            color: AppColors.textPrimary,
            fontFamily: AppFonts.regular,
          ),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(
              fontSize: 14.sp,
              color: AppColors.textSecondary,
              fontFamily: AppFonts.semiBold,
            ),


            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Icon(
                widget.prefixIcon,
                color: AppColors.primary,
                size: 20.sp,
              ),
            ),
            prefixIconConstraints: BoxConstraints(
              minWidth: 12.w,
            ),

            suffixIcon: widget.isPassword
                ? IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                size: 18.sp,
                color: AppColors.textPrimary,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            )
                : (widget.isFilter
                ? IconButton(
              icon: Icon(
                Icons.filter_list,
                size: 18.sp,
                color: AppColors.primary,
              ),
              onPressed: widget.onFilterChange,
            )
                : null),

            // ફિગ્મા જેવો ક્લીન વ્હાઇટ લુક આપવા માટે
            filled: true,
            fillColor: Colors.white,

            contentPadding: EdgeInsets.symmetric(
              horizontal: 4.w,
              vertical: 1.6.h,
            ),

            // બધી બોર્ડરને OutlineInputBorder થી પ્રોપર શેપ આપ્યો
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.primary, width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}