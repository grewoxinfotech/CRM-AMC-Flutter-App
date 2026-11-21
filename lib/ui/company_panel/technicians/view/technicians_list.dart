import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raiser_amc/core/theme/app_colors.dart';
import 'package:raiser_amc/core/theme/app_fonts.dart';
import 'package:raiser_amc/core/utils/custom_app_bar.dart';
import 'package:raiser_amc/core/utils/custom_dialog.dart';
import 'package:raiser_amc/core/utils/custom_side_drawer.dart';
import 'package:raiser_amc/core/utils/custom_text_field.dart';
import 'package:raiser_amc/ui/company_panel/technicians/widget/technicaians_card_widget.dart';
import 'package:sizer/sizer.dart';

class TechniciansList extends StatefulWidget {
  const TechniciansList({super.key});

  @override
  State<TechniciansList> createState() => _TechniciansListState();
}

class _TechniciansListState extends State<TechniciansList> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey _filterKey = GlobalKey();
  final TextEditingController searchController = TextEditingController();

  String _selectedTechnicianStatus = 'All';

  final List<String> _technicianStatusList = [
    'All',
    'Active',
    'Inactive',
    'Blocked',
  ];

  final List<Map<String, dynamic>> technicians = [
    {
      'name': 'Haresh Vaghela',
      'initials': 'HV',
      'email': 'haresh.tech@grewox.com',
      'phone': '9909011223',
      'alternateContact': '9909011224',
      'documentStatus': 'Non-Verified Docs',
      'status': 'Active',
      'location': 'Gandhinagar, Gujarat',
      'area': 'Sector 21',
      'done': 0,
      'pending': 1,
      'active': 1,
    },
    {
      'name': 'Mahesh Makwana',
      'initials': 'MM',
      'email': 'mahesh.tech@grewox.com',
      'phone': '9876543210',
      'alternateContact': '9876543211',
      'documentStatus': 'Verified Docs',
      'status': 'Active',
      'location': 'Ahmedabad, Gujarat',
      'area': 'Satellite',
      'done': 2,
      'pending': 1,
      'active': 0,
    },
    {
      'name': 'Rajesh Patel',
      'initials': 'RP',
      'email': 'rajesh.tech@grewox.com',
      'phone': '9898989898',
      'alternateContact': '9898989899',
      'documentStatus': 'Verified Docs',
      'status': 'Inactive',
      'location': 'Surat, Gujarat',
      'area': 'Adajan',
      'done': 3,
      'pending': 0,
      'active': 0,
    },
  ];

  List<Map<String, dynamic>> get filteredTechnicians {
    final String query = searchController.text.trim().toLowerCase();

    return technicians.where((technician) {
      final bool matchesStatus =
          _selectedTechnicianStatus == 'All' ||
          technician['status'] == _selectedTechnicianStatus;

      final bool matchesSearch =
          technician['name'].toString().toLowerCase().contains(query) ||
          technician['email'].toString().toLowerCase().contains(query) ||
          technician['phone'].toString().contains(query);

      return matchesStatus && matchesSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final data = filteredTechnicians;
    return Scaffold(
      backgroundColor: AppColors.background,
      key: _scaffoldKey,
      drawer: CustomSideDrawer(activeMenuId: 'technicians'),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 6.h),
              CustomAppBar(
                title: 'Technicians',
                isMenu: true,
                onMenuTap: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
              ).paddingSymmetric(horizontal: 4.w),

              SizedBox(height: 2.h),

              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      label: "",
                      hintText: 'Search Technicians....',
                      prefixIcon: Icons.search,
                      controller: searchController,
                      onChanged: (val) {
                        setState(() {});
                      },
                    ),
                  ),

                  SizedBox(width: 3.w),

                  Container(
                    key: _filterKey,
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
                        ),
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: _showTechnicianFilterPopup,
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
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: 3.h),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [

                              Expanded(
                                child: _buildHorizontalStatCard(
                                  count: '2',
                                  countColor: AppColors.textPrimary,
                                  label: 'Field\nTechnicians',
                                  icon: Icons.settings_outlined,
                                  iconColor: AppColors.primary,
                                  iconBgColor: AppColors.primarySurface,
                                ),
                              ),

                              SizedBox(width: 3.5.w),


                              Expanded(
                                child: _buildHorizontalStatCard(
                                  count: '1',
                                  countColor: AppColors.success,
                                  label: 'Services Done',
                                  icon: Icons.check_circle_outline_rounded,
                                  iconColor: AppColors.success,
                                  iconBgColor: AppColors.successSurface,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 2.h),

                          Row(
                            children: [

                              Expanded(
                                child: _buildHorizontalStatCard(
                                  count: '3',
                                  countColor: AppColors.warning,
                                  label: 'Services\nPending',
                                  icon: Icons.access_time_rounded,
                                  iconColor: AppColors.warning,
                                  iconBgColor: AppColors.warningSurface,
                                ),
                              ),

                              SizedBox(width: 3.5.w),

                              Expanded(
                                child: _buildHorizontalStatCard(
                                  count: '1',
                                  countColor: AppColors.secondary,
                                  label: 'Active In-\nProgress',
                                  icon: Icons.bolt_rounded,
                                  iconColor: AppColors.secondary,
                                  iconBgColor: AppColors.secondarySurface,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ).paddingSymmetric(horizontal: 4.w),

                      SizedBox(height: 2.h),

                      data.isEmpty
                          ? Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 4.h),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.people_outline_rounded,
                                      size: 40.sp,
                                      color: Colors.grey.shade400,
                                    ),
                                    SizedBox(height: 1.h),
                                    Text(
                                      'No technicians found',
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        fontFamily: AppFonts.medium,
                                        color: AppColors.textSecondary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.symmetric(
                                horizontal: 4.w,
                                vertical: 1.h,
                              ),
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                final technician = data[index];

                                return TechniciansCardWidget(
                                  id: index + 1,
                                  name: technician['name'] ?? '',
                                  email: technician['email'] ?? '',
                                  phone: technician['phone'] ?? '',
                                  alternatePhone:
                                      technician['alternateContact'] ?? '',
                                  status: technician['status'] ?? 'Inactive',
                                  location: technician['location'] ?? '',
                                  area: technician['area'] ?? '',
                                  isVerified:
                                      technician['documentStatus'] ==
                                          'Verified Docs',
                                  totalVisits: (technician['done'] ?? 0) +
                                      (technician['pending'] ?? 0) +
                                      (technician['active'] ?? 0),
                                  completedVisits: technician['done'] ?? 0,
                                  pendingVisits: technician['pending'] ?? 0,
                                  activeVisits: technician['active'] ?? 0,
                                  onMapTap: () {},
                                  onViewTap: () {},
                                  onBlockTap: () {
                                    showCustomDialog(
                                      title: "Block Technician",
                                      message:
                                          "Are you sure you want to block this technician? They will no longer be able to access their account.",
                                      customIcon: Icons.block_rounded,
                                      isSuccess: false,
                                      yesButtonText: "Yes, Block",
                                      noButtonText: "Cancel",
                                      onYes: () {
                                        // Block API
                                      },
                                    );
                                  },
                                  onEditTap: () {},
                                  onDeleteTap: () {
                                    showCustomDialog(
                                      title: "Delete Technicians",
                                      message:
                                          "Are you sure you want to delete this Technicians?",
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

  void _showTechnicianFilterPopup() async {
    final RenderBox button =
        _filterKey.currentContext!.findRenderObject() as RenderBox;

    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;

    final Offset position = button.localToGlobal(
      Offset.zero,
      ancestor: overlay,
    );

    final selected = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        position.dx - 130,
        position.dy + button.size.height + 6,
        overlay.size.width - position.dx - button.size.width,
        0,
      ),
      elevation: 8,
      color: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      items: _technicianStatusList.map((status) {
        final bool isSelected = _selectedTechnicianStatus == status;

        return PopupMenuItem<String>(
          value: status,
          height: 44,
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.primary.withOpacity(0.10)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    status,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: isSelected ? AppFonts.bold : AppFonts.medium,
                      color: isSelected
                          ? AppColors.primary
                          : AppColors.textPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );

    if (selected != null) {
      setState(() {
        _selectedTechnicianStatus = selected;
      });
    }
  }

  Widget _buildHorizontalStatCard({
    required String count,
    required Color countColor,
    required String label,
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 11.8.h,
        padding: EdgeInsets.symmetric(horizontal: 3.5.w, vertical: 1.3.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: AppColors.white.withOpacity(0.9),
            width: 1.2,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.white.withOpacity(0.9),
              offset: const Offset(-3, -3),
              blurRadius: 8,
              spreadRadius: 1,
            ),
            BoxShadow(
              color: AppColors.black.withOpacity(0.10),
              offset: const Offset(3, 5),
              blurRadius: 12,
              spreadRadius: 0,
            ),
            BoxShadow(
              color: AppColors.black.withOpacity(0.035),
              offset: const Offset(0, 2),
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 38,
                  height: 38,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: iconBgColor,
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Icon(icon, color: iconColor, size: 18.sp),
                ),
                SizedBox(width: 2.w),
                Flexible(
                  child: Text(
                    count,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 19.sp,
                      fontFamily: AppFonts.bold,
                      color: countColor,
                      height: 1.05,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              label,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14.sp,
                fontFamily: AppFonts.semiBold,
                color: AppColors.textSecondary,
                height: 1.15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
