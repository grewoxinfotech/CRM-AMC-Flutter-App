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

class CreateUpdateEquipmnet extends StatefulWidget {
  bool isEdit;

  CreateUpdateEquipmnet({super.key, this.isEdit = false});

  @override
  State<CreateUpdateEquipmnet> createState() => _CreateUpdateEquipmnetState();
}

class _CreateUpdateEquipmnetState extends State<CreateUpdateEquipmnet> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _equipmentNameController =
      TextEditingController();
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _modelNumberController = TextEditingController();
  final TextEditingController _capacityController = TextEditingController();
  final TextEditingController _serialNumberController = TextEditingController();

  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _mapLinkController = TextEditingController();
  final TextEditingController _installDateController = TextEditingController();
  final TextEditingController _warrantyDateController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  String? _selectedCategory = 'Electrical';
  String? _selectedClient = 'None / General Stock Asset (Unassigned)';

  final List<String> _clientsList = [
    'None / General Stock Asset (Unassigned)',
    'Ramesh Patel (9825012345) - Rajkot',
    'Jignesh Shah (9879054321) - Ahmedabad',
  ];

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

  Future<void> _pickDate(TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: Colors.white,
              onSurface: AppColors.textPrimary,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        controller.text =
            '${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}';
      });
    }
  }

  @override
  void dispose() {
    _equipmentNameController.dispose();
    _brandController.dispose();
    _priceController.dispose();
    _modelNumberController.dispose();
    _capacityController.dispose();
    _serialNumberController.dispose();
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
                title: widget.isEdit ? 'Edit Equipment' : 'Create Equipment',
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
                      Container(
                        padding: EdgeInsets.all(4.5.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.grey.shade200,
                            width: 1,
                          ),
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(2.2.w),
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
                                SizedBox(width: 3.w),
                                Expanded(
                                  child: Text(
                                    'EQUIPMENT / MACHINE DETAILS',
                                    style: TextStyle(
                                      fontSize: 14.5.sp,
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
                              label: 'Equipment Name',
                              hintText:
                                  'e.g. OT & Stretcher Bed Elevator / Daikin VRV AC Plant',
                              controller: _equipmentNameController,
                              validator: (val) {
                                if (val == null || val.trim().isEmpty) {
                                  return 'Please enter equipment name';
                                }
                                return null;
                              },
                              prefixIcon: Icons.precision_manufacturing_rounded,
                            ),

                            SizedBox(height: 2.2.h),

                            CustomTextField(
                              label: 'Brand / Make',
                              hintText:
                                  'e.g. Daikin, Voltas, Schindler, Kent, Otis',
                              prefixIcon: Icons.sell_outlined,
                              controller: _brandController,
                            ),

                            SizedBox(height: 2.2.h),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: CustomDropdown<String>(
                                    label: 'Category',
                                    hintText: 'Select category',
                                    value: _selectedCategory,
                                    items: _categories,
                                    itemLabel: (item) => item,
                                    isSearch: true,
                                    searchHintText:
                                        'Select or type custom category...',
                                    onChanged: (val) {
                                      setState(() {
                                        _selectedCategory = val;
                                      });
                                    },
                                  ),
                                ),

                                SizedBox(width: 3.w),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomTextField(
                                        label: 'Price (₹)',
                                        hintText: '0.00',
                                        prefixIcon:
                                            Icons.currency_rupee_rounded,
                                        inputType:
                                            const TextInputType.numberWithOptions(
                                              decimal: true,
                                            ),
                                        controller: _priceController,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 2.2.h),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Left: Model Number
                                Expanded(
                                  child: CustomTextField(
                                    label: 'Model Number',
                                    hintText: 'e.g. FTKF50TV',
                                    controller: _modelNumberController,
                                    prefixIcon: Icons.numbers_rounded,
                                  ),
                                ),

                                SizedBox(width: 3.5.w),

                                // Right: Capacity / Specs
                                Expanded(
                                  child: CustomTextField(
                                    label: 'Capacity / Specs',
                                    hintText: 'e.g. 1.5 Ton / 250KVA',
                                    controller: _capacityController,
                                    prefixIcon: Icons.speed_rounded,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 2.2.h),

                            // ==========================================
                            // 5. SERIAL NUMBER (QR / Barcode Icon સાથે)
                            // ==========================================
                            CustomTextField(
                              label: 'Serial Number',
                              hintText: 'e.g. SN-SCH-2024-8841',
                              prefixIcon: Icons.qr_code_2_rounded,
                              controller: _serialNumberController,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 2.h),

                      Container(
                        padding: EdgeInsets.all(4.5.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.grey.shade200,
                            width: 1,
                          ),
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // ==========================================
                            // SECTION HEADER + SUBTITLE
                            // ==========================================
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(2.2.w),
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Icon(
                                    Icons.location_on_outlined,
                                    color: AppColors.white,
                                    size: 20.sp,
                                  ),
                                ),
                                SizedBox(width: 3.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Installation & Client Site Details (Optional)',
                                        style: TextStyle(
                                          fontSize: 14.5.sp,
                                          fontFamily: AppFonts.bold,
                                          color: AppColors.textPrimary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 1.5.h),
                            Divider(color: Colors.grey.shade200, thickness: 1),
                            SizedBox(height: 1.8.h),

                            CustomDropdown<String>(
                              label: 'Installed At / Client (Customer)',
                              hintText:
                                  'None / General Stock Asset (Unassigned)',
                              prefixIcon: Icons.apartment_rounded,
                              value: _selectedClient,
                              items: _clientsList,
                              itemLabel: (item) => item,
                              isSearch: true,
                              searchHintText:
                                  'Search client name, phone or city...',
                              onChanged: (val) {
                                setState(() {
                                  _selectedClient = val;
                                });
                              },
                            ),

                            SizedBox(height: 2.h),

                            CustomTextField(
                              label: 'Location / Room / Floor',
                              hintText:
                                  'e.g. Main Terrace - North Wing / Flat 301 / OT Floor',
                              prefixIcon: Icons.place_outlined,
                              controller: _locationController,
                            ),

                            SizedBox(height: 2.h),

                            CustomTextField(
                              label: 'Google Map Location Link',
                              hintText:
                                  'e.g. https://maps.app.goo.gl/... or https://maps.google.com/?q=...',
                              prefixIcon: Icons.language_rounded,
                              inputType: TextInputType.url,
                              controller: _mapLinkController,
                            ),

                            SizedBox(height: 2.h),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Left: Installation Date
                                Expanded(
                                  child: CustomTextField(
                                    label: 'Installation Date',
                                    hintText: 'Select date',
                                    prefixIcon: Icons.calendar_today_outlined,
                                    controller: _installDateController,
                                    isReadOnly: true,
                                    onTap: () =>
                                        _pickDate(_installDateController),
                                  ),
                                ),

                                SizedBox(width: 3.w),

                                Expanded(
                                  child: CustomTextField(
                                    label: 'Expiry Date',
                                    hintText: 'Select date',
                                    prefixIcon: Icons.verified_user_outlined,
                                    controller: _warrantyDateController,
                                    isReadOnly: true,
                                    onTap: () =>
                                        _pickDate(_warrantyDateController),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 2.h),

                            CustomTextField(
                              label: 'Notes / Technical Remarks',
                              hintText:
                                  'Additional details, compatibility, maintenance scope...',
                              controller: _notesController,
                              prefixIcon: Icons.note_add,
                              minLines: 3,
                              maxLines: 5,
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
}
