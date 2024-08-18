import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reorderlist/core/theme/colors.dart';
import 'package:reorderlist/core/theme/styles.dart';
import 'package:reorderlist/core/widgets/detailed_search_form/detailed_search_form.dart';
import 'package:reorderlist/core/widgets/dragable/dragable_list.dart';
import 'package:reorderlist/core/widgets/localizations.dart';

class ButtonScreen extends StatefulWidget {
  const ButtonScreen({super.key});

  @override
  State<ButtonScreen> createState() => _ButtonScreenState();
}

class _ButtonScreenState extends State<ButtonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button Screen'),
        actions: const [LanguageMenu()],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: const Color(0xFFF9F9F9),
                      title: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'search_in_detailed_data'.tr,
                                maxLines: 2,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                              ),
                              const Spacer(),
                              const Icon(Icons.cancel)
                            ],
                          ),
                          const Divider(
                            color: dividerColor,
                          ),
                        ],
                      ),
                      content: SizedBox(
                        width: double.maxFinite,
                        height: Get.height, // Adjust the height as needed
                        child: const DragDropListViews(),
                      ),
                    );
                  },
                );
              },
              child: const Text('Show Dialog'),
            ),
            const SizedBox(
              width: 10,
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: const Color(0xFFF9F9F9),
                      title: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'search_in_detailed_data'.tr,
                                maxLines: 2,
                                style: AppStyles.styleBold20(context),
                              ),
                              const Spacer(),
                              const Icon(Icons.cancel)
                            ],
                          ),
                          const Divider(color: dividerColor),
                        ],
                      ),
                      content: SizedBox(
                        width: double.maxFinite,
                        height: Get.height, // Adjust the height as needed
                        child: const DetailedSearchForm(),
                      ),
                    );
                  },
                );
              },
              child: const Text('show dialog two'),
            )
          ],
        ),
      ),
    );
  }
}
