import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: const Color(0xFFF9F9F9),
                  title:  Column(
                    children: [
                      Row(
                        children: [
                          Text('search_in_detailed_data'.tr),
                          const Spacer(),
                          const Icon(Icons.cancel)
                        ],
                      ),
                      const Divider(color: Color(0xFFE9E9E9),),
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
      ),
    );
  }
}
