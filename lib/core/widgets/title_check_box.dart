import 'package:flutter/material.dart';
import 'package:reorderlist/core/theme/colors.dart';
import 'package:reorderlist/core/theme/styles.dart';
import 'package:reorderlist/core/widgets/spacer.dart';

class TitleCheckBox extends StatelessWidget {
  final String title;
  final TextStyle? style;
  final bool value;
  final Function(bool) onPress;
  const TitleCheckBox({
    required this.title,
    this.style,
    required this.value,
    required this.onPress,super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 2),
      child: Row(
        children: [
          SizedBox(
            width: 20,
            height:10 ,
            child: Checkbox(
                materialTapTargetSize: MaterialTapTargetSize.padded,
                value: value,
                hoverColor: Colors.transparent,
                fillColor: WidgetStateProperty.all<Color>(value
                    ? kPrimaryColor : whiteColor),
                checkColor: whiteColor,
                activeColor: whiteColor,
                side: const BorderSide(color: dividerColor),
                onChanged:(val){
                  onPress(val ?? false);
                },
              ),
          ),
          const WSpacer(10),

          Text(title,
              style: style ?? AppStyles.styleRegular12(context)),
        ],
      ),
    );
  }
}