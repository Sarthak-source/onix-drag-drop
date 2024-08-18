import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:reorderlist/core/responsive_cubite/responsive_cubit.dart';
import 'package:reorderlist/core/theme/colors.dart';
import 'package:reorderlist/core/theme/styles.dart';
import 'package:reorderlist/core/widgets/custom_drop_down_with_text_form.dart';
import 'package:reorderlist/core/widgets/flexible_wrap_widget.dart';
import 'package:reorderlist/core/widgets/flexible_wrap_with_width_widget.dart';

class DetailedSearchForm extends StatelessWidget {
  const DetailedSearchForm({super.key});

  @override
  Widget build(BuildContext context) {
    final width = context.read<ResponsiveCubit>().isDesktop(context)
        ? Get.width / 3.6
        : context.read<ResponsiveCubit>().isTablet(context)
            ? (Get.width / 3.75)+1
            : Get.width;

    final textWidth = context.read<ResponsiveCubit>().isTablet(context)
        ? (Get.width / 3.4)+10
        : 150.0;

    final itemWidth = [
      textWidth,
      width,
      width,
      textWidth,
      width,
      width,
      textWidth,
      width,
      width,
      textWidth,
      width,
      width,
      textWidth,
      width,
      width,
      textWidth,
      width,
      width
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        child: SingleChildScrollView(
          child: Column(
            children: [
              FlexibleWrapWidgetWithWidth(
                spacing: 10,
                itemWidths: itemWidth,
                children: [
                  titleText(context, 'from_main_group'.tr),
                  CustomDropDownWithTextForm(
                    hint: 'to_group_3'.tr,
                    list: const [],
                    onChanged: (value) {},
                  ),
                  CustomDropDownWithTextForm(
                    hint: 'from_sub_group'.tr,
                    list: const [],
                    onChanged: (value) {},
                  ),
                  titleText(context, 'to_sub_group'.tr),
                  CustomDropDownWithTextForm(
                    hint: 'from_sub_sub_group'.tr,
                    list: const [],
                    onChanged: (value) {},
                  ),
                  CustomDropDownWithTextForm(
                    hint: 'to_sub_sub_group'.tr,
                    list: const [],
                    onChanged: (value) {},
                  ),
                  titleText(
                    context,
                    'from_detailed_group'.tr,
                  ),
                  CustomDropDownWithTextForm(
                    hint: 'to_detailed_group'.tr,
                    list: const [],
                    onChanged: (value) {},
                  ),
                  CustomDropDownWithTextForm(
                    hint: 'from_item_type'.tr,
                    list: const [],
                    onChanged: (value) {},
                  ),
                  titleText(
                    context,
                    'to_item_type'.tr,
                  ),
                  CustomDropDownWithTextForm(
                    hint: 'from_item_structure'.tr,
                    list: const [],
                    onChanged: (value) {},
                  ),
                  CustomDropDownWithTextForm(
                    hint: 'to_item_structure'.tr,
                    list: const [],
                    onChanged: (value) {},
                  ),
                  titleText(
                    context,
                    'from_item_activity'.tr,
                  ),
                  CustomDropDownWithTextForm(
                    hint: 'to_item_activity'.tr,
                    list: const [],
                    onChanged: (value) {},
                  ),
                  CustomDropDownWithTextForm(
                    hint: 'from_item_number'.tr,
                    list: const [],
                    onChanged: (value) {},
                  ),
                  titleText(
                    context,
                    'to_item_number'.tr,
                  ),
                  CustomDropDownWithTextForm(
                    hint: 'from_warehouse'.tr,
                    list: const [],
                    onChanged: (value) {},
                  ),
                  CustomDropDownWithTextForm(
                    hint: 'to_warehouse'.tr,
                    list: const [],
                    onChanged: (value) {},
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(
                color: dividerColor,
              ),
              const SizedBox(height: 10),
              FlexibleWrapWidget(
                itemWidth: context.read<ResponsiveCubit>().getWidth(context,
                    ratioDesktop: 0.4,
                    ratioDesktopOpenSideMenu: 0.3,
                    ratioMobile: 0.4,
                    ratioTablet: 0.28),
                    spacing: 10,
                children: [
                  CustomDropDownWithTextForm(
                    hint: 'minimum_amount'.tr,
                    list: const [],
                  ),
                  CustomDropDownWithTextForm(
                    hint: 'discount_amount'.tr,
                    list: const [],
                  ),
                  CustomDropDownWithTextForm(
                    hint: 'maximum_amount'.tr,
                    list: const [],
                  ),
                  CustomDropDownWithTextForm(
                    hint: 'discount_type'.tr,
                    list: const [],
                  ),
                  CustomDropDownWithTextForm(
                    hint: 'maximum_number_to_get_this_offer'.tr,
                    list: const [],
                  ),
                  const CustomDropDownWithTextForm(
                    hint: 'Maximum Quantity for Offer',
                    list: [],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: kGrayIX, // Background color
                  borderRadius: BorderRadius.circular(6), // Border radius
                ),
                // Add child widgets here if needed
                child: FlexibleWrapWidget(
                  itemWidth: context.read<ResponsiveCubit>().getWidth(context,
                      ratioDesktop: 0.4,
                      ratioDesktopOpenSideMenu: 0.3,
                      ratioMobile: 0.4,
                      ratioTablet: 0.4),
                      
                  children: [
                    Expanded(
                      child: CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text('show_items_with_available_quantities'.tr,
                            style: AppStyles.styleLight12(context)),
                        value: false,
                        onChanged: (bool? value) {},
                      ),
                    ),
                    Expanded(
                      child: CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text(
                          'show_quota_items'.tr,
                          style: AppStyles.styleLight12(context),
                        ),
                        value: false,
                        onChanged: (bool? value) {},
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Spacer(),
                  _buildActionButton(
                    'execute'.tr,
                    Icons.save,
                    kSkyDarkColor,
                    () {},
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  _buildActionButton(
                    'delete_all'.tr,
                    Icons.delete,
                    const Color(0xFF819AA7),
                    () {
                      //cubit.clearSelectedItems();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding titleText(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Text(
        title,
        style: AppStyles.styleRegular14(context, color: descriptionColor),
      ),
    );
  }

  ElevatedButton _buildActionButton(
      String label, IconData icon, Color color, VoidCallback onPressed) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: Colors.white,
      ),
      label: Text(label,
          style: const TextStyle(color: Colors.white, fontSize: 11)),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
