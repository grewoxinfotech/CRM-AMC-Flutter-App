import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:raiser_amc/core/theme/app_colors.dart';
import 'package:raiser_amc/core/theme/app_fonts.dart';
import 'package:raiser_amc/core/utils/custom_app_bar.dart';
import 'package:raiser_amc/core/utils/custom_button.dart';
import 'package:raiser_amc/core/utils/custom_dropdown.dart';
import 'package:raiser_amc/core/utils/custom_side_drawer.dart';
import 'package:raiser_amc/core/utils/custom_text_field.dart';
import 'package:sizer/sizer.dart';

class CreateUpdateService extends StatefulWidget {
  bool isEdit;

  CreateUpdateService({super.key, this.isEdit = false});

  @override
  State<CreateUpdateService> createState() => _CreateUpdateServiceState();
}

class _CreateUpdateServiceState extends State<CreateUpdateService> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _serviceNameController = TextEditingController();
  final TextEditingController _serviceRateController = TextEditingController();
  final TextEditingController _serviceScopeController = TextEditingController();

  String? _selectedCategory;

  final List<String> _categories = [
    'Preventive',
    'Breakdown',
    'Inspection',
    'Routine Maintenance',
    'Installation & Commissioning',
    'Calibration & Testing',
    'Overhauling & Repair',
    'Annual AMC Visit',
  ];

  final List<String> _quickCategories = [
    'Preventive',
    'Breakdown',
    'Inspection',
    'Routine Maintenance',
  ];

  @override
  void dispose() {
    _serviceNameController.dispose();
    _serviceRateController.dispose();
    _serviceScopeController.dispose();
    super.dispose();
  }

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
                title: widget.isEdit ? 'Update Service' : 'Create Service',
                isBack: true,
                isRightMenu: true,
                onMenuTap: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
              ).paddingSymmetric(horizontal: 4.w),

              SizedBox(height: 2.h),

              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                  child: Column(
                    children: [
                      _buildElevatedCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Header
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(2.w),
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Icon(
                                    Icons.inventory_2_outlined,
                                    color: AppColors.white,
                                    size: 20.sp,
                                  ),
                                ),
                                SizedBox(width: 2.8.w),
                                Expanded(
                                  child: Text(
                                    'SERVICE DETAILS',
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      fontFamily: AppFonts.bold,
                                      color: AppColors.textPrimary,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 1.4.h),
                            Divider(color: AppColors.divider, thickness: 1),
                            SizedBox(height: 1.6.h),

                            CustomTextField(
                              label: 'Service Name',
                              hintText:
                                  'e.g. Emergency Breakdown Visit / Preventive Inspection',
                              controller: _serviceNameController,
                              prefixIcon: Icons.miscellaneous_services_outlined,
                              validator: (val) {
                                if (val == null || val.trim().isEmpty) {
                                  return 'Please enter service name';
                                }
                                return null;
                              },
                            ),

                            SizedBox(height: 2.h),

                            CustomTextField(
                              label: 'Service Rate (₹)',
                              hintText: '0.00',
                              prefixIcon: Icons.currency_rupee_rounded,
                              inputType: const TextInputType.numberWithOptions(
                                decimal: true,
                              ),
                              controller: _serviceRateController,
                              validator: (val) {
                                if (val == null || val.trim().isEmpty) {
                                  return 'Please enter standard service rate';
                                }
                                return null;
                              },
                            ),

                            SizedBox(height: 2.h),

                            CustomDropdown<String>(
                              label: 'Category',
                              hintText: 'Select or type custom category...',
                              value: _selectedCategory,
                              items: _categories,
                              itemLabel: (item) => item,
                              isSearch: true,
                              searchHintText: 'Search category...',
                              onChanged: (val) {
                                setState(() {
                                  _selectedCategory = val;
                                });
                              },
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 2.h),

                      _buildElevatedCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(2.w),
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Icon(
                                    Icons.description_outlined,
                                    color: AppColors.white,
                                    size: 20.sp,
                                  ),
                                ),
                                SizedBox(width: 2.8.w),
                                Expanded(
                                  child: Text(
                                    'NOTES / TECHNICAL REMARKS',
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      fontFamily: AppFonts.bold,
                                      color: AppColors.textPrimary,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 1.4.h),
                            Divider(color: Colors.grey.shade200, thickness: 1),
                            SizedBox(height: 1.6.h),

                            // Service Scope & Instructions Label + Multiline Input
                            CustomTextField(
                              label: 'Service Scope & Instructions',
                              hintText:
                                  'Additional details, compatibility, maintenance scope...',
                              controller: _serviceScopeController,
                              prefixIcon: Icons.note_add,
                              minLines: 4,
                              maxLines: 6,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 3.h),
                      Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              text: "Cancel",
                              backgroundColor: AppColors.white,
                              isOutlined: true,
                              height: 6.h,
                              fontSize: 15.sp,
                              onPressed: () {},
                            ),
                          ),

                          SizedBox(width: 3.w,),

                          Expanded(
                            child: CustomButton(
                              text: "Create",
                              height: 6.h,
                              fontSize: 15.sp,
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 5.h),
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

  // 3D Elevated Card Container Helper
  Widget _buildElevatedCard({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(4.5.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200, width: 1),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F172A).withOpacity(0.08),
            offset: const Offset(0, 8),
            blurRadius: 24,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: const Color(0xFF0F172A).withOpacity(0.03),
            offset: const Offset(0, 2),
            blurRadius: 6,
            spreadRadius: 0,
          ),
        ],
      ),
      child: child,
    );
  }

  // Required (*) લેબલ બનાવવા માટેનું હેલ્પર
  Widget _buildRichLabel({required String title, bool isRequired = false}) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        text: title,
        style: TextStyle(
          fontSize: 13.5.sp,
          fontFamily: AppFonts.semiBold,
          color: AppColors.textPrimary,
        ),
        children: [
          if (isRequired)
            TextSpan(
              text: ' *',
              style: TextStyle(
                fontSize: 13.5.sp,
                fontFamily: AppFonts.bold,
                color: Colors.red,
              ),
            ),
        ],
      ),
    );
  }
}
