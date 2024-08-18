import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reorderlist/core/theme/colors.dart';
import 'package:reorderlist/core/theme/styles.dart';

class CustomDropDownButton extends StatelessWidget {
  const CustomDropDownButton({
    super.key,
    this.height,
    this.width,
    required this.label,
    this.selectedValue,
    this.bgColor,
    this.isRequired = false,
    this.borderColor,
  });

  final double? width;
  final double? height;
  final String label;
  final bool isRequired;
  final Color? borderColor;
  final Color? bgColor;
  final String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      constraints: BoxConstraints(minHeight: height ?? 48, maxHeight: 60),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
                child: selectedValue == null
                    ? RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: label,
                              spellOut: true,
                              style: AppStyles.styleLight12(
                                context,
                                color: Colors.grey,
                              ),
                            ),
                            TextSpan(
                              text: isRequired ? ' *' : " ",
                              spellOut: true,
                              style: AppStyles.styleLight12(
                                context,
                                color: Colors.red,
                              ),
                            )
                          ],
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      )
                    : Text(
                        selectedValue ?? "",
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.styleLight12(context),
                      )),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: const Icon(
              CupertinoIcons.chevron_down,
              size: 10,
              color: kTextFiledColor,
            ),
          )
        ],
      ),
    );
  }
}
