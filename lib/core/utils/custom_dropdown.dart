import 'package:flutter/material.dart';
import 'package:raiser_amc/core/theme/app_colors.dart';
import 'package:raiser_amc/core/theme/app_fonts.dart';
import 'package:sizer/sizer.dart';

class CustomDropdown<T> extends StatefulWidget {
  final String label;
  final String hintText;
  final IconData? prefixIcon;

  final T? value;
  final List<T> items;

  final String Function(T item) itemLabel;
  final ValueChanged<T?>? onChanged;
  final String? Function(T?)? validator;

  final bool isEnabled;
  final bool isSearch;
  final String searchHintText;
  final ValueChanged<String>? onSearchChanged;

  const CustomDropdown({
    super.key,
    required this.label,
    required this.hintText,
    required this.items,
    required this.itemLabel,
    this.prefixIcon,
    this.value,
    this.onChanged,
    this.validator,
    this.isEnabled = true,
    this.isSearch = false,
    this.searchHintText = 'Search...',
    this.onSearchChanged,
  });

  @override
  State<CustomDropdown<T>> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  bool _isOpen = false;

  final TextEditingController _searchController = TextEditingController();
  late List<T> _filteredItems;

  @override
  void initState() {
    super.initState();
    _filteredItems = List<T>.from(widget.items);
  }

  @override
  void didUpdateWidget(covariant CustomDropdown<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.items != widget.items) {
      _filterList(_searchController.text);
    }
  }

  @override
  void dispose() {
    _removeOverlay(notifyState: false);
    _searchController.dispose();
    super.dispose();
  }

  void _filterList(String query) {
    final trimmed = query.trim().toLowerCase();
    if (trimmed.isEmpty) {
      _filteredItems = List<T>.from(widget.items);
    } else {
      _filteredItems = widget.items
          .where(
            (item) => widget.itemLabel(item).toLowerCase().contains(trimmed),
      )
          .toList();
    }
    _overlayEntry?.markNeedsBuild();
  }

  void _toggleDropdown(FormFieldState<T> fieldState) {
    if (!widget.isEnabled) return;
    if (_isOpen) {
      _removeOverlay();
    } else {
      _showOverlay(fieldState);
    }
  }

  void _removeOverlay({bool notifyState = true}) {
    _overlayEntry?.remove();
    _overlayEntry = null;
    _searchController.clear();
    _filteredItems = List<T>.from(widget.items);
    if (notifyState && mounted) {
      setState(() {
        _isOpen = false;
      });
    } else {
      _isOpen = false;
    }
  }

  void _showOverlay(FormFieldState<T> fieldState) {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final Size size = renderBox.size;
    final Offset offset = renderBox.localToGlobal(Offset.zero);

    final double screenHeight = MediaQuery.of(context).size.height;
    final double spaceBelow = screenHeight - offset.dy - size.height - 20;
    final double maxMenuHeight = spaceBelow < 22.h ? 22.h : 34.h;

    _filteredItems = List<T>.from(widget.items);

    _overlayEntry = OverlayEntry(
      builder: (overlayContext) {
        return Stack(
          children: [
            // બહાર ટેપ કરવાથી બંધ થાય તે માટે
            Positioned.fill(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => _removeOverlay(),
              ),
            ),

            // ડ્રોપડાઉન મેનુ બોક્સ
            CompositedTransformFollower(
              link: _layerLink,
              showWhenUnlinked: false,
              offset: Offset(0, size.height + 6),
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: size.width,
                  constraints: BoxConstraints(maxHeight: maxMenuHeight),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: AppColors.border,
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withOpacity(0.10),
                        offset: const Offset(0, 8),
                        blurRadius: 20,
                        spreadRadius: 1,
                      ),
                      BoxShadow(
                        color: AppColors.black.withOpacity(0.04),
                        offset: const Offset(0, 2),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // =====================================
                        // SEARCH INPUT (જો isSearch: true હોય તો)
                        // =====================================
                        if (widget.isSearch) ...[
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 3.w,
                              vertical: 0.4.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              border: Border(
                                bottom: BorderSide(
                                  color: AppColors.borderLight,
                                  width: 1,
                                ),
                              ),
                            ),
                            child: TextField(
                              controller: _searchController,
                              autofocus: false,
                              style: TextStyle(
                                fontSize: 13.5.sp,
                                fontFamily: AppFonts.regular,
                                color: AppColors.textPrimary,
                              ),
                              onChanged: (val) {
                                _filterList(val);
                                widget.onSearchChanged?.call(val);
                              },
                              decoration: InputDecoration(
                                hintText: widget.searchHintText,
                                hintStyle: TextStyle(
                                  fontSize: 13.5.sp,
                                  fontFamily: AppFonts.regular,
                                  color: AppColors.textMuted,
                                ),
                                prefixIcon: Icon(
                                  Icons.search_rounded,
                                  size: 18.sp,
                                  color: AppColors.iconMuted,
                                ),
                                prefixIconConstraints: BoxConstraints(
                                  minWidth: 9.w,
                                  minHeight: 36,
                                ),
                                suffixIcon: _searchController.text.isNotEmpty
                                    ? GestureDetector(
                                  onTap: () {
                                    _searchController.clear();
                                    _filterList('');
                                    widget.onSearchChanged?.call('');
                                  },
                                  child: Icon(
                                    Icons.close_rounded,
                                    size: 16.sp,
                                    color: AppColors.iconMuted,
                                  ),
                                )
                                    : null,
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 1.1.h,
                                ),
                              ),
                            ),
                          ),
                        ],

                        // =====================================
                        // ITEMS LIST
                        // =====================================
                        if (_filteredItems.isEmpty)
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.5.h),
                            child: Text(
                              'No results found',
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontFamily: AppFonts.regular,
                                color: AppColors.textMuted,
                              ),
                            ),
                          )
                        else
                          Flexible(
                            child: Scrollbar(
                              thumbVisibility: _filteredItems.length > 5,
                              radius: const Radius.circular(10),
                              child: ListView.builder(
                                padding: EdgeInsets.symmetric(vertical: 0.5.h),
                                shrinkWrap: true,
                                itemCount: _filteredItems.length,
                                itemBuilder: (context, index) {
                                  final item = _filteredItems[index];
                                  final bool isSelected = widget.value == item;

                                  return InkWell(
                                    onTap: () {
                                      fieldState.didChange(item);
                                      widget.onChanged?.call(item);
                                      _removeOverlay();
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 3.8.w,
                                        vertical: 1.3.h,
                                      ),
                                      color: isSelected
                                          ? AppColors.primarySurface
                                          : Colors.transparent,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              widget.itemLabel(item),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                fontFamily: isSelected
                                                    ? AppFonts.bold
                                                    : AppFonts.medium,
                                                color: isSelected
                                                    ? AppColors.primary
                                                    : AppColors.textPrimary,
                                              ),
                                            ),
                                          ),
                                          if (isSelected) ...[
                                            SizedBox(width: 2.w),
                                            Icon(
                                              Icons.check_rounded,
                                              size: 18.sp,
                                              color: AppColors.primary,
                                            ),
                                          ],
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );

    Overlay.of(context, rootOverlay: true).insert(_overlayEntry!);
    setState(() {
      _isOpen = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool hasPrefixIcon = widget.prefixIcon != null;

    return FormField<T>(
      initialValue: widget.value,
      validator: widget.validator,
      builder: (FormFieldState<T> fieldState) {
        final bool hasError = fieldState.hasError;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // =====================================================
            // LABEL
            // =====================================================
            if (widget.label.isNotEmpty) ...[
              Text(
                widget.label,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: AppFonts.semiBold,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: 0.9.h),
            ],

            // =====================================================
            // DROPDOWN FIELD BOX
            // =====================================================
            CompositedTransformTarget(
              link: _layerLink,
              child: GestureDetector(
                onTap: () => _toggleDropdown(fieldState),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  padding: EdgeInsets.symmetric(
                    horizontal: 3.5.w,
                    vertical: 1.45.h,
                  ),
                  decoration: BoxDecoration(
                    color: widget.isEnabled
                        ? AppColors.white
                        : AppColors.surfaceSecondary,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: hasError
                          ? AppColors.error
                          : _isOpen
                          ? AppColors.primary
                          : AppColors.border,
                      width: (_isOpen || hasError) ? 1.5 : 1,
                    ),
                    boxShadow: _isOpen
                        ? [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.12),
                        blurRadius: 8,
                        spreadRadius: 1,
                      ),
                    ]
                        : null,
                  ),
                  child: Row(
                    children: [
                      if (hasPrefixIcon) ...[
                        Icon(
                          widget.prefixIcon,
                          color: _isOpen
                              ? AppColors.primary
                              : AppColors.iconSecondary,
                          size: 19.sp,
                        ),
                        SizedBox(width: 2.5.w),
                      ],
                      Expanded(
                        child: Text(
                          widget.value != null
                              ? widget.itemLabel(widget.value as T)
                              : widget.hintText,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: widget.value != null
                                ? AppFonts.medium
                                : AppFonts.regular,
                            color: widget.value != null
                                ? AppColors.textPrimary
                                : AppColors.textSecondary,
                          ),
                        ),
                      ),
                      SizedBox(width: 1.5.w),
                      Icon(
                        _isOpen
                            ? Icons.keyboard_arrow_up_rounded
                            : Icons.keyboard_arrow_down_rounded,
                        size: 20.sp,
                        color: widget.isEnabled
                            ? (_isOpen
                            ? AppColors.primary
                            : AppColors.iconSecondary)
                            : AppColors.iconMuted,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // =====================================================
            // VALIDATION ERROR MESSAGE
            // =====================================================
            if (hasError) ...[
              SizedBox(height: 0.6.h),
              Padding(
                padding: EdgeInsets.only(left: 1.w),
                child: Text(
                  fieldState.errorText ?? '',
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: AppColors.error,
                    fontFamily: AppFonts.regular,
                  ),
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}