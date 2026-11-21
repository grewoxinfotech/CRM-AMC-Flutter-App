import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raiser_amc/core/theme/app_colors.dart';
import 'package:raiser_amc/core/theme/app_fonts.dart';
import 'package:raiser_amc/core/utils/custom_app_bar.dart';
import 'package:raiser_amc/core/utils/custom_button.dart';
import 'package:raiser_amc/core/utils/custom_dialog.dart';
import 'package:raiser_amc/core/utils/custom_dropdown.dart';
import 'package:raiser_amc/core/utils/custom_side_drawer.dart';
import 'package:raiser_amc/core/utils/custom_text_field.dart';
import 'package:raiser_amc/ui/company_panel/equipment/view/create_update_equipmnet.dart';
import 'package:raiser_amc/ui/company_panel/equipment/view/create_update_service.dart';
import 'package:raiser_amc/ui/company_panel/equipment/view/create_update_spare_part.dart';
import 'package:raiser_amc/ui/company_panel/equipment/widgets/equipment_card_widget.dart';
import 'package:raiser_amc/ui/company_panel/equipment/widgets/equipment_type_bottom_sheet.dart';
import 'package:sizer/sizer.dart';

class EquipmentList extends StatefulWidget {
  const EquipmentList({super.key});

  @override
  State<EquipmentList> createState() => _EquipmentListState();
}

class _EquipmentListState extends State<EquipmentList> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController searchController = TextEditingController();

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

  final List<Map<String, dynamic>> equipmentList = [
    {
      'id': 1,
      'brand': 'Daikin',
      'category': 'HVAC',
      'typeBadge': 'Asset / Machine',
      'title': 'Split Air Conditioner 1.5 Ton',
      'location': 'Ahmedabad, Gujarat',
      'isAssigned': true,
      'clientName': 'ABC Industries',
      'clientPhone': '+91 9876543210',
      'modelNo': 'FTKL50',
      'serialNo': 'DK2025001',
      'installDate': '12 Jan 2025',
      'price': '₹45,000',
    },
    {
      'id': 2,
      'brand': 'Samsung',
      'category': 'Electronics',
      'typeBadge': 'Asset / Machine',
      'title': 'Commercial Display Monitor',
      'location': 'Surat, Gujarat',
      'isAssigned': false,
      'clientName': '',
      'clientPhone': '',
      'modelNo': 'SMG240',
      'serialNo': 'SM2025002',
      'installDate': '15 Feb 2025',
      'price': '₹32,000',
    },
    {
      'id': 3,
      'brand': 'Luminous',
      'category': 'UPS/Power Backup',
      'typeBadge': 'Asset / Machine',
      'title': 'Online UPS 5 KVA',
      'location': 'Vadodara, Gujarat',
      'isAssigned': true,
      'clientName': 'XYZ Solutions',
      'clientPhone': '+91 9876543211',
      'modelNo': 'UPS5000',
      'serialNo': 'LM2025003',
      'installDate': '20 Mar 2025',
      'price': '₹65,000',
    },
    {
      'id': 4,
      'brand': 'Havells',
      'category': 'Electrical',
      'typeBadge': 'Spare Part',
      'title': 'Industrial Electrical Panel',
      'location': 'Rajkot, Gujarat',
      'isAssigned': false,
      'clientName': '',
      'clientPhone': '',
      'modelNo': 'HEP100',
      'serialNo': 'HV2025004',
      'installDate': '05 Apr 2025',
      'price': '₹18,500',
    },
    {
      'id': 5,
      'brand': 'Crompton',
      'category': 'DG/Generator',
      'typeBadge': 'Asset / Machine',
      'title': 'Diesel Generator 10 KVA',
      'location': 'Ahmedabad, Gujarat',
      'isAssigned': true,
      'clientName': 'PQR Enterprises',
      'clientPhone': '+91 9876543212',
      'modelNo': 'DG1000',
      'serialNo': 'CR2025005',
      'installDate': '10 May 2025',
      'price': '₹95,000',
    },
    {
      'id': 6,
      'brand': 'CP Plus',
      'category': 'CCTV & Surveillance',
      'typeBadge': 'Service / Labor',
      'title': 'CCTV Camera Installation',
      'location': 'Surat, Gujarat',
      'isAssigned': false,
      'clientName': '',
      'clientPhone': '',
      'modelNo': 'CP-CAM',
      'serialNo': 'CP2025006',
      'installDate': '18 Jun 2025',
      'price': '₹12,000',
    },
  ];

  List<Map<String, dynamic>> get filteredEquipment {
    return equipmentList.where((item) {
      final search = searchController.text.toLowerCase();

      final matchesSearch =
          item['title'].toString().toLowerCase().contains(search) ||
          item['brand'].toString().toLowerCase().contains(search) ||
          item['category'].toString().toLowerCase().contains(search) ||
          item['serialNo'].toString().toLowerCase().contains(search) ||
          item['modelNo'].toString().toLowerCase().contains(search) ||
          item['clientName'].toString().toLowerCase().contains(search);

      final matchesType =
          selectedType == 'All Types' || item['typeBadge'] == selectedType;

      final matchesCategory =
          selectedCategory == 'All Categories' ||
          item['category'] == selectedCategory;

      return matchesSearch && matchesType && matchesCategory;
    }).toList();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final equipment = filteredEquipment;

    return Scaffold(
      backgroundColor: AppColors.background,
      key: _scaffoldKey,
      drawer: CustomSideDrawer(activeMenuId: 'equipment'),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: CustomButton(
        text: 'Add Equipment',
        icon: Icons.add_rounded,
        iconAtStart: true,
        width: 45.w,
        height: 5.6.h,
        fontSize: 14.5.sp,
        onPressed: () {
          EquipmentTypeBottomSheet.show(
            context: context,
            onEquipmentTap: () {
              Get.to(() => CreateUpdateEquipmnet());
            },
            onSparePartTap: () {
              Get.to(() => CreateUpdateSparePart());
            },
            onServiceTap: () {
              Get.to(() => CreateUpdateService(isEdit: false,));
            },
          );
        },
      ),
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
                      border: Border.all(color: Colors.grey.shade300, width: 1),
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

              Expanded(
                child: equipment.isEmpty
                    ? Center(
                        child: Text(
                          'No Equipment Found',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontFamily: AppFonts.medium,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      )
                    : ListView.builder(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4.w,
                          vertical: 1.h,
                        ),
                        itemCount: equipment.length,
                        itemBuilder: (context, index) {
                          final item = equipment[index];

                          return EquipmentCardWidget(
                            id: item['id'],
                            brand: item['brand'],
                            category: item['category'],
                            typeBadge: item['typeBadge'],
                            title: item['title'],
                            location: item['location'],
                            isAssigned: item['isAssigned'],
                            clientName: item['clientName'],
                            clientPhone: item['clientPhone'],
                            modelNo: item['modelNo'],
                            serialNo: item['serialNo'],
                            installDate: item['installDate'],
                            price: item['price'],
                            onMapTap: () {
                              Get.snackbar(
                                'Map',
                                'Map functionality will be connected later.',
                              );
                            },
                            onCallTap: () {
                              Get.snackbar(
                                'Call',
                                'Call functionality will be connected later.',
                              );
                            },
                            onAssignTap: () {
                              Get.snackbar(
                                'Assign',
                                'Assign functionality will be connected later.',
                              );
                            },
                            onEditTap: () {
                              EquipmentTypeBottomSheet.show(
                                context: context,
                                onEquipmentTap: () {
                                  Get.to(() => CreateUpdateEquipmnet(isEdit: true,));
                                },
                                onSparePartTap: () {
                                  Get.to(() => CreateUpdateSparePart(isEdit: true,));
                                },
                                onServiceTap: () {
                                  Get.to(() => CreateUpdateService(isEdit: true,));
                                },
                              );
                            },
                            onDeleteTap: () {
                              showCustomDialog(
                                title: "Delete Equipment",
                                message:
                                    "Are you sure you want to delete this equipment?",
                                customIcon: Icons.delete_outline_rounded,
                                isSuccess: false,
                                yesButtonText: "Yes",
                                noButtonText: "No",
                                onYes: () {
                                  // Delete API
                                },
                              );
                            },
                          );
                        },
                      ),
              ),
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
