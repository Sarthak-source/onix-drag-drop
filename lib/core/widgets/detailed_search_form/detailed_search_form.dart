import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:reorderlist/core/responsive_cubite/responsive_cubit.dart';
import 'package:reorderlist/core/theme/colors.dart';
import 'package:reorderlist/core/theme/styles.dart';
import 'package:reorderlist/core/widgets/custom_drop_down_with_text_form.dart';
import 'package:reorderlist/core/widgets/flexible_wrap_widget.dart';
import 'package:reorderlist/core/widgets/flexible_wrap_with_width_widget.dart';
import 'package:reorderlist/core/widgets/title_check_box.dart';

import 'cubite/detailed_search_cubite.dart';
import 'cubite/detailed_search_state.dart';

class DetailedSearchForm extends StatelessWidget {
  const DetailedSearchForm({super.key});

  @override
  Widget build(BuildContext context) {
    final width = context.read<ResponsiveCubit>().isDesktop(context)
        ? Get.width / 3.6
        : context.read<ResponsiveCubit>().isTablet(context)
            ? (Get.width / 3.75) + 1
            : Get.width;

    final textWidth = context.read<ResponsiveCubit>().isTablet(context)
        ? (Get.width / 3.4) + 20
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

    return BlocBuilder<DetailedSearchCubit, DetailedSearchState>(
        builder: (context, state) {
      final cubit = context.read<DetailedSearchCubit>();

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
                      enableSearch: true,
                      list: [
                        "egypt_bank".tr,
                        "invoice_amount".tr,
                        "currency_unit".tr,
                      ],
                      selectedItem: cubit.getValue('to_group_3'),
                      onChanged: (value) {
                        cubit.updateSelectedValue('to_group_3', value);
                      },
                    ),
                    CustomDropDownWithTextForm(
                      hint: 'from_sub_group'.tr,
                      enableSearch: true,
                      list: [
                        "egypt_bank".tr,
                        "invoice_amount".tr,
                        "currency_unit".tr,
                      ],
                      selectedItem: cubit.getValue('from_sub_group'),
                      onChanged: (value) {
                        cubit.updateSelectedValue('from_sub_group', value);
                      },
                    ),
                    titleText(context, 'to_sub_group'.tr),
                    CustomDropDownWithTextForm(
                      hint: 'from_sub_sub_group'.tr,
                      enableSearch: true,
                      list: [
                        "egypt_bank".tr,
                        "invoice_amount".tr,
                        "currency_unit".tr,
                      ],
                      selectedItem: cubit.getValue('from_sub_sub_group'),
                      onChanged: (value) {
                        cubit.updateSelectedValue('from_sub_sub_group', value);
                      },
                    ),
                    CustomDropDownWithTextForm(
                      hint: 'to_sub_sub_group'.tr,
                      enableSearch: true,
                      list: [
                        "egypt_bank".tr,
                        "invoice_amount".tr,
                        "currency_unit".tr,
                      ],
                      selectedItem: cubit.getValue('to_sub_sub_group'),
                      onChanged: (value) {
                        cubit.updateSelectedValue('to_sub_sub_group', value);
                      },
                    ),
                    titleText(
                      context,
                      'from_detailed_group'.tr,
                    ),
                    CustomDropDownWithTextForm(
                      hint: 'to_detailed_group'.tr,
                      enableSearch: true,
                      list: [
                        "egypt_bank".tr,
                        "invoice_amount".tr,
                        "currency_unit".tr,
                      ],
                      selectedItem: cubit.getValue('to_detailed_group'),
                      onChanged: (value) {
                        cubit.updateSelectedValue('to_detailed_group', value);
                      },
                    ),
                    CustomDropDownWithTextForm(
                      hint: 'from_item_type'.tr,
                      enableSearch: true,
                      list: [
                        "egypt_bank".tr,
                        "invoice_amount".tr,
                        "currency_unit".tr,
                      ],
                      selectedItem: cubit.getValue('from_item_type'),
                      onChanged: (value) {
                        cubit.updateSelectedValue('from_item_type', value);
                      },
                    ),
                    titleText(
                      context,
                      'to_item_type'.tr,
                    ),
                    CustomDropDownWithTextForm(
                      hint: 'from_item_structure'.tr,
                      enableSearch: true,
                      list: [
                        "egypt_bank".tr,
                        "invoice_amount".tr,
                        "currency_unit".tr,
                      ],
                      selectedItem: cubit.getValue('from_item_structure'),
                      onChanged: (value) {
                        cubit.updateSelectedValue('from_item_structure', value);
                      },
                    ),
                    CustomDropDownWithTextForm(
                      hint: 'to_item_structure'.tr,
                      enableSearch: true,
                      list: [
                        "egypt_bank".tr,
                        "invoice_amount".tr,
                        "currency_unit".tr,
                      ],
                      selectedItem: cubit.getValue('to_item_structure'),
                      onChanged: (value) {
                        cubit.updateSelectedValue('to_item_structure', value);
                      },
                    ),
                    titleText(
                      context,
                      'from_item_activity'.tr,
                    ),
                    CustomDropDownWithTextForm(
                      hint: 'to_item_activity'.tr,
                      enableSearch: true,
                      list: [
                        "egypt_bank".tr,
                        "invoice_amount".tr,
                        "currency_unit".tr,
                      ],
                      selectedItem: cubit.getValue('to_item_activity'),
                      onChanged: (value) {
                        cubit.updateSelectedValue('to_item_activity', value);
                      },
                    ),
                    CustomDropDownWithTextForm(
                      hint: 'from_item_number'.tr,
                      enableSearch: true,
                      list: [
                        "egypt_bank".tr,
                        "invoice_amount".tr,
                        "currency_unit".tr,
                      ],
                      selectedItem: cubit.getValue('from_item_number'),
                      onChanged: (value) {
                        cubit.updateSelectedValue('from_item_number', value);
                      },
                    ),
                    titleText(
                      context,
                      'to_item_number'.tr,
                    ),
                    CustomDropDownWithTextForm(
                      hint: 'from_warehouse'.tr,
                      enableSearch: true,
                      list: [
                        "egypt_bank".tr,
                        "invoice_amount".tr,
                        "currency_unit".tr,
                      ],
                      selectedItem: cubit.getValue('from_warehouse'),
                      onChanged: (value) {
                        cubit.updateSelectedValue('from_warehouse', value);
                      },
                    ),
                    CustomDropDownWithTextForm(
                      hint: 'to_warehouse'.tr,
                      enableSearch: true,
                      list: [
                        "egypt_bank".tr,
                        "invoice_amount".tr,
                        "currency_unit".tr,
                      ],
                      selectedItem: cubit.getValue('to_warehouse'),
                      onChanged: (value) {
                        cubit.updateSelectedValue('to_warehouse', value);
                      },
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
                      enableSearch: true,
                      list: [
                        "egypt_bank".tr,
                        "invoice_amount".tr,
                        "currency_unit".tr,
                      ],
                      selectedItem: cubit.getValue('minimum_amount'),
                      onChanged: (value) {
                        cubit.updateSelectedValue('minimum_amount', value);
                      },
                    ),
                    CustomDropDownWithTextForm(
                      hint: 'discount_amount'.tr,
                      enableSearch: true,
                      list: [
                        "egypt_bank".tr,
                        "invoice_amount".tr,
                        "currency_unit".tr,
                      ],
                      selectedItem: cubit.getValue('discount_amount'),
                      onChanged: (value) {
                        cubit.updateSelectedValue('discount_amount', value);
                      },
                    ),
                    CustomDropDownWithTextForm(
                      hint: 'maximum_amount'.tr,
                      enableSearch: true,
                      list: [
                        "egypt_bank".tr,
                        "invoice_amount".tr,
                        "currency_unit".tr,
                      ],
                      selectedItem: cubit.getValue('maximum_amount'),
                      onChanged: (value) {
                        cubit.updateSelectedValue('maximum_amount', value);
                      },
                    ),
                    CustomDropDownWithTextForm(
                      hint: 'discount_type'.tr,
                      enableSearch: true,
                      list: [
                        "egypt_bank".tr,
                        "invoice_amount".tr,
                        "currency_unit".tr,
                      ],
                      selectedItem: cubit.getValue('discount_type'),
                      onChanged: (value) {
                        cubit.updateSelectedValue('discount_type', value);
                      },
                    ),
                    CustomDropDownWithTextForm(
                      hint: 'maximum_number_to_get_this_offer'.tr,
                      enableSearch: true,
                      list: [
                        "egypt_bank".tr,
                        "invoice_amount".tr,
                        "currency_unit".tr,
                      ],
                      selectedItem:
                          cubit.getValue('maximum_number_to_get_this_offer'),
                      onChanged: (value) {
                        cubit.updateSelectedValue(
                            'maximum_number_to_get_this_offer', value);
                      },
                    ),
                    CustomDropDownWithTextForm(
                      hint: 'maximum_quantity_for_offer'.tr,
                      enableSearch: true,
                      list: [
                        "egypt_bank".tr,
                        "invoice_amount".tr,
                        "currency_unit".tr,
                      ],
                      selectedItem:
                          cubit.getValue('maximum_quantity_for_offer'),
                      onChanged: (value) {
                        cubit.updateSelectedValue(
                            'maximum_quantity_for_offer', value);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: kGrayIX, // Background color
                    borderRadius: BorderRadius.circular(6), // Border radius
                  ),
                  // Add child widgets here if needed
                  child: Center(
                    child: FlexibleWrapWidget(
                      itemWidth: context.read<ResponsiveCubit>().getWidth(context,
                          ratioDesktop: 0.4,
                          ratioDesktopOpenSideMenu: 0.3,
                          ratioMobile: 0.4,
                          ratioTablet: 0.4),
                      children: [
                        TitleCheckBox(
                          title: 'show_items_with_available_quantities'.tr,
                          value: false,
                          onPress: (value) {},
                        ),
                        TitleCheckBox(
                          title: 'show_quota_items'.tr,
                          value: true,
                          onPress: (value) {},
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment:
                      (context.read<ResponsiveCubit>().isMobile(context) ||
                              context.read<ResponsiveCubit>().isTablet(context))
                          ? MainAxisAlignment.spaceBetween
                          : MainAxisAlignment.center,
                  children: [
                    context.read<ResponsiveCubit>().isMobile(context) ||
                            context.read<ResponsiveCubit>().isTablet(context)
                        ? const SizedBox.shrink()
                        : const Spacer(),
                    _buildActionButton(
                        'execute'.tr, Icons.save, kSkyDarkColor, () {},
                        fullWidth: (context
                                .read<ResponsiveCubit>()
                                .isMobile(context) ||
                            context.read<ResponsiveCubit>().isTablet(context))),
                    const SizedBox(
                      width: 10,
                    ),
                    _buildActionButton(
                      'delete_all'.tr,
                      Icons.delete,
                      fullWidth: (context
                              .read<ResponsiveCubit>()
                              .isMobile(context) ||
                          context.read<ResponsiveCubit>().isTablet(context)),
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
    });
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

  Widget _buildActionButton(
      String label, IconData icon, Color color, VoidCallback onPressed,
      {bool fullWidth = false}) {
    final button = ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: Colors.white,
      ),
      label: Text(
        label,
        style: const TextStyle(color: Colors.white, fontSize: 11),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    return fullWidth
        ? Expanded(child: button) // Use Expanded for full width in a Row
        : button;
  }
}
