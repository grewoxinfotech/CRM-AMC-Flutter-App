import 'dart:core';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raiser_amc/core/theme/app_colors.dart';
import 'package:raiser_amc/core/theme/app_fonts.dart';
import 'package:raiser_amc/core/utils/custom_app_bar.dart';
import 'package:raiser_amc/core/utils/custom_button.dart';
import 'package:raiser_amc/core/utils/custom_dialog.dart';
import 'package:raiser_amc/core/utils/custom_side_drawer.dart';
import 'package:raiser_amc/core/utils/custom_text_field.dart';
import 'package:raiser_amc/ui/company_panel/clients/view/client_deatils.dart';
import 'package:raiser_amc/ui/company_panel/clients/view/create_clients_screen.dart';
import 'package:raiser_amc/ui/company_panel/clients/view/upate_clients_screen.dart';
import 'package:raiser_amc/ui/company_panel/clients/widgets/client_card_widget.dart';
import 'package:sizer/sizer.dart';

class ClientScreen extends StatefulWidget {
  const ClientScreen({super.key});

  @override
  State<ClientScreen> createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController searchController = TextEditingController();
  int selectedFilterIndex = 0;


  final List<Map<String, dynamic>> clientsList = [
    {
      'name': 'Ramesh Patel',
      'companyName': 'Shree Ram Hospital & Trauma Centre',
      'status': 'Active',
      'isActive': true,
      'email': 'contact@shreeramhospital.com',
      'phone': '9825012345',
      'altPhone': '9825012346',
      'cityState': 'Rajkot, Gujarat',
      'address': 'Near Ring Road, Kalawad Road',
      'equipmentText': '1 Equipment: OT & Stretcher Bed Elevator (16P)',
      'amcText': '1 Active AMC',
      'clientId': '#CL-1042',
    },
    {
      'name': 'Pooja Sharma',
      'companyName': 'Apex Corporate Towers',
      'status': 'Active',
      'isActive': true,
      'email': 'admin@apextowers.in',
      'phone': '9879011223',
      'altPhone': '9879011224',
      'cityState': 'Ahmedabad, Gujarat',
      'address': 'SG Highway, Prahlad Nagar',
      'equipmentText': '3 Equipments: High-Speed Passenger Lifts',
      'amcText': '2 Active AMCs',
      'clientId': '#CL-1043',
    },
    {
      'name': 'Amit Shah',
      'companyName': 'Sunrise Residency',
      'status': 'Inactive',
      'isActive': false,
      'email': 'sunrise.soc@gmail.com',
      'phone': '9909944556',
      'altPhone': '',
      'cityState': 'Surat, Gujarat',
      'address': 'Vesu Main Road, Near VIP Plaza',
      'equipmentText': '2 Equipments: Residential Elevators (8P)',
      'amcText': '0 Active AMC',
      'clientId': '#CL-1044',
    },
  ];

  List<Map<String, dynamic>> get _filteredClients {
    if (selectedFilterIndex == 1) {
      return clientsList.where((c) => c['isActive'] == true).toList();
    } else if (selectedFilterIndex == 2) {
      return clientsList.where((c) => c['isActive'] == false).toList();
    }

    return clientsList;
  }

  @override
  Widget build(BuildContext context) {
    final filteredList = _filteredClients;
    return Scaffold(
      backgroundColor: AppColors.background,
      key: _scaffoldKey,
      drawer: CustomSideDrawer(activeMenuId: 'clients'),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: CustomButton(
        text: 'Add Client',
        icon: Icons.add_rounded,
        iconAtStart: true,
        width: 38.w,
        height: 5.6.h,
        fontSize: 14.5.sp,
        onPressed: () {
          Get.to(()=> CreateClientsScreen());
        },
      ),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 6.h),
              CustomAppBar(
                title: 'Clients',
                isBack: false,
                isRightMenu: true,
                isMenu: true,
                onMenuTap: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
              ).paddingSymmetric(horizontal: 4.w),
              CustomTextField(
                label: '',
                hintText: 'Enter client name...',
                prefixIcon: Icons.search,
                controller: searchController,
              ).paddingSymmetric(horizontal: 4.w),

              SizedBox(height: 2.h,),


              Container(
                width: double.infinity,
                padding: EdgeInsets.all(1.2.w),
                decoration: BoxDecoration(
                  color: AppColors.surfaceSecondary,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColors.border.withOpacity(0.6),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.white.withOpacity(0.9),
                      offset: const Offset(-2, -2),
                      blurRadius: 6,
                    ),
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.04),
                      offset: const Offset(0, 3),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final itemWidth = constraints.maxWidth / 3;

                    return Stack(
                      children: [
                        // Animated selected background
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOutCubic,
                          left: selectedFilterIndex * itemWidth,
                          top: 0,
                          bottom: 0,
                          width: itemWidth,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 0.4.w),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: AppColors.primary.withOpacity(0.10),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.white.withOpacity(0.95),
                                  offset: const Offset(-2, -2),
                                  blurRadius: 5,
                                ),
                                BoxShadow(
                                  color: AppColors.black.withOpacity(0.07),
                                  offset: const Offset(0, 3),
                                  blurRadius: 8,
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Filter options
                        Row(
                          children: List.generate(3, (i) {
                            final bool isSelected = selectedFilterIndex == i;

                            return Expanded(
                              child: GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () {
                                  if (selectedFilterIndex != i) {
                                    setState(() {
                                      selectedFilterIndex = i;
                                    });
                                  }
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(vertical: 1.3.h),
                                  child: AnimatedDefaultTextStyle(
                                    duration: const Duration(milliseconds: 250),
                                    curve: Curves.easeInOut,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontFamily: isSelected
                                          ? AppFonts.bold
                                          : AppFonts.medium,
                                      color: isSelected
                                          ? AppColors.primary
                                          : AppColors.textSecondary,
                                    ),
                                    child: Text(
                                      ['All', 'Active', 'Inactive'][i],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ],
                    );
                  },
                ),
              ).paddingSymmetric(horizontal: 4.w),

              SizedBox(height: 2.h,),

              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.fromLTRB(4.w, 0.5.h, 4.w, 4.h),
                  itemCount: filteredList.length,
                  separatorBuilder: (context, index) => SizedBox(height: 1.8.h),
                  itemBuilder: (context, index) {
                    final client = filteredList[index];
                    return ClientCardWidget(
                      name: client['name'],
                      companyName: client['companyName'],
                      status: client['status'],
                      isActive: client['isActive'],
                      email: client['email'],
                      phone: client['phone'],
                      altPhone: client['altPhone'],
                      cityState: client['cityState'],
                      address: client['address'],
                      equipmentText: client['equipmentText'],
                      amcText: client['amcText'],
                      clientId: client['clientId'],
                      onViewMapTap: () {},
                      onEditTap: () {
                        Get.to(()=>UpdateClientsScreen());
                      },
                      onCallTap: () {},
                      onDeleteTap: () {
                        showCustomDialog(
                          title: "Delete Client",
                          message: "Are you sure you want to delete this client?",
                          customIcon: Icons.delete_outline_rounded,
                          isSuccess: false,
                          yesButtonText: "Yes",
                          noButtonText: "No",
                          onYes: () {
                            // Delete API
                          },
                        );
                      },
                      onViewTap: () {
                        Get.to(()=> ClientDetails());
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: 5.h),

            ],
          ),
        ],
      ),
    );
  }
}
