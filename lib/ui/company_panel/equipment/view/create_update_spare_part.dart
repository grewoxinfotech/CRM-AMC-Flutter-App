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

class CreateUpdateSparePart extends StatefulWidget {
  bool isEdit;

  CreateUpdateSparePart({super.key, this.isEdit = false});

  @override
  State<CreateUpdateSparePart> createState() => _CreateUpdateSparePartState();
}

class _CreateUpdateSparePartState extends State<CreateUpdateSparePart> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _partNameController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _sellingPriceController = TextEditingController();
  final TextEditingController _partModelController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  String? _selectedCategory;

  final List<String> _categories = [
    'HVAC',
    'Electrical',
    'Electronics',
    'UPS/Power Backup',
    'DG/Generator',
    'CCTV & Surveillance',
    'Access Control & Biometrics',
    'Fire Safety',
    'IT & Networking',
    'Water Purifier/RO',
    'Lift & Elevator',
    'Industrial Machinery',
    'Kitchen Equipment',
    'Solar & Renewable',
    'Medical Equipment',
    'Appliances',
    'Plumbing & Pumps',
    'HVAC / Air Conditioning',
  ];

  @override
  void dispose() {
    _partNameController.dispose();
    _brandController.dispose();
    _sellingPriceController.dispose();
    _partModelController.dispose();
    _notesController.dispose();
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
                title: widget.isEdit ? 'Edit Spare Part' : 'Create Spare Part',
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
                                    'SPARE PART INFORMATION',
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

                            SizedBox(height: 1.5.h),
                            Divider(color: AppColors.divider, thickness: 1),
                            SizedBox(height: 1.5.h),

                            CustomTextField(
                              label: 'Part Name',
                              hintText:
                                  'e.g. Door Sensor 12V / 45uF Capacitor / S...',
                              prefixIcon: Icons.precision_manufacturing,
                              controller: _partNameController,
                              validator: (val) {
                                if (val == null || val.trim().isEmpty) {
                                  return 'Please enter part name';
                                }
                                return null;
                              },
                            ),

                            SizedBox(height: 2.h),

                            CustomTextField(
                              label: 'Brand / Make',
                              hintText:
                                  'e.g. Daikin, Voltas, Schindler, Kent, Otis',
                              prefixIcon: Icons.sell_outlined,
                              controller: _brandController,
                            ),

                            SizedBox(height: 2.h),


                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomTextField(
                                        label: 'Selling Price',
                                        hintText: '0.00',
                                        prefixIcon:
                                            Icons.currency_rupee_rounded,
                                        inputType:
                                            const TextInputType.numberWithOptions(
                                              decimal: true,
                                            ),
                                        controller: _sellingPriceController,
                                        validator: (val) {
                                          if (val == null ||
                                              val.trim().isEmpty) {
                                            return 'Required';
                                          }
                                          return null;
                                        },
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(width: 3.2.w),


                                Expanded(
                                  flex: 1,
                                  child: CustomDropdown<String>(
                                    label: 'Category',
                                    hintText: 'Select or type...',
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
                                ),
                              ],
                            ),

                            SizedBox(height: 2.h),

                            CustomTextField(
                              label: 'Part / Model Number',
                              hintText: 'e.g. FTKF50TV16U / SN-DS-120',
                              controller: _partModelController,
                              prefixIcon: Icons.numbers,
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 2.2.h),

                      _buildElevatedCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Header (Amber/Orange Document Icon સાથે)
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(2.w),
                                  decoration: BoxDecoration(
                                    color:  AppColors.primary,
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
                            SizedBox(height: 1.h),

                            CustomTextField(
                              label: '',
                              hintText:
                                  'Additional details, compatibility,\nmaintenance scope...',
                              controller: _notesController,
                              prefixIcon: Icons.note_add,
                              minLines: 4,
                              maxLines: 6,
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 3.h,),

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
