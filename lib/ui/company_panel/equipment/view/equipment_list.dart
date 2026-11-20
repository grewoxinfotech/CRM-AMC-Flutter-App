import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raiser_amc/core/theme/app_colors.dart';
import 'package:raiser_amc/core/theme/app_fonts.dart';
import 'package:raiser_amc/core/utils/custom_app_bar.dart';
import 'package:raiser_amc/core/utils/custom_button.dart';
import 'package:raiser_amc/core/utils/custom_dropdown.dart';
import 'package:raiser_amc/core/utils/custom_side_drawer.dart';
import 'package:raiser_amc/core/utils/custom_text_field.dart';
import 'package:sizer/sizer.dart';

class EquipmentList extends StatefulWidget {
  const EquipmentList({super.key});

  @override
  State<EquipmentList> createState() => _EquipmentListState();
}

class _EquipmentListState extends State<EquipmentList> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      key: _scaffoldKey,
      drawer: CustomSideDrawer(activeMenuId: 'equipment'),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 6.h),
              CustomAppBar(
                title: 'Equipment',
                isMenu: true,
                onMenuTap: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
              ).paddingSymmetric(horizontal: 4.w),
              SizedBox(height: 2.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Search TextField
                  Expanded(
                    child: CustomTextField(
                      label: "",
                      hintText: "Search Equipment....",
                      prefixIcon: Icons.search,
                      controller: searchController,
                      onChanged: (value) {
                        // Search Logic
                      },
                    ),
                  ),

                  SizedBox(width: 3.w),

                  // Filter Button
                  Container(
                    height: 5.5.h,
                    width: 5.5.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.grey.shade300,
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withOpacity(0.10),
                          offset: const Offset(2, 3),
                          blurRadius: 8,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () {
                          _showFilterDialog();
                        },
                        child: Center(
                          child: Icon(
                            Icons.filter_list_rounded,
                            color: AppColors.white,
                            size: 23.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ).paddingSymmetric(horizontal: 4.w),

              SizedBox(height: 2.h),
            ],
          ),
        ],
      ),
    );
  }

  void _showFilterDialog() {
    String selectedType = 'All Types';
    String selectedCategory = 'All Categories';

    final List<String> typeList = [
      'All Types',
      'Asset / Machine',
      'Spare Part',
      'Service / Labor',
    ];

    final List<String> categoryList = [
      'All Categories',
      'HVAC',
      'Electrical',
      'Electronics',
      'UPS/Power Backup',
      'DG/Generator',
      'CCTV & Surveillance',
    ];

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return Dialog(
              backgroundColor: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              insetPadding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Padding(
                padding: EdgeInsets.all(4.5.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Filter Products',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: AppFonts.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Icon(
                            Icons.close_rounded,
                            size: 20.sp,
                            color: AppColors.iconSecondary,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),

                    // Type (isSearch: false) & Category (isSearch: true)
                    Row(
                      children: [
                        Expanded(
                          child: CustomDropdown<String>(
                            label: 'Type',
                            hintText: 'All Types',
                            value: selectedType,
                            items: typeList,
                            itemLabel: (item) => item,
                            isSearch: false,
                            onChanged: (val) {
                              setDialogState(() {
                                selectedType = val!;
                              });
                            },
                          ),
                        ),
                        SizedBox(width: 3.w),
                        Expanded(
                          child: CustomDropdown<String>(
                            label: 'Category',
                            hintText: 'All Categories',
                            value: selectedCategory,
                            items: categoryList,
                            itemLabel: (item) => item,
                            isSearch: true,
                            onSearchChanged: (query) {
                              // તમારું કસ્ટમ સર્ચ લોજિક
                            },
                            onChanged: (val) {
                              setDialogState(() {
                                selectedCategory = val!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 2.5.h),

                    // Apply & Reset Buttons
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            text: 'Reset',
                            height: 5.2.h,
                            fontSize: 14.sp,
                            isOutlined: true,
                            onPressed: () {
                              setDialogState(() {
                                selectedType = 'All Types';
                                selectedCategory = 'All Categories';
                              });
                            },
                          ),
                        ),
                        SizedBox(width: 3.w),
                        Expanded(
                          child: CustomButton(
                            text: 'Apply Filter',
                            height: 5.2.h,
                            fontSize: 14.sp,
                            onPressed: () {
                              Navigator.pop(context);
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
        );
      },
    );
  }
}
