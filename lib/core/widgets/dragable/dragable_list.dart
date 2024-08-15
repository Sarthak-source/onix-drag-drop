import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'cubite/dragable_cubite.dart';
import 'cubite/dragable_state.dart';
import 'models/drag_model.dart';

class DragDropListViews extends StatelessWidget {
  const DragDropListViews({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DragDropCubit(),
      child: BlocBuilder<DragDropCubit, DragDropState>(
        builder: (context, state) {
          final cubit = context.read<DragDropCubit>();

          return Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    _buildListPanel(
                      title: 'available_data'.tr,
                      list: state.availableItems,
                      context: context,
                      listColor: Colors.white,
                      isAccept: true, subTitle: 'add_all'.tr,
                    ),
                    const VerticalDivider(
                      color: Color(0xFFE9E9E9),
                      thickness: 2,
                      width: 20,
                    ),
                    _buildListPanel(
                      title: 'selected_data'.tr,
                      list: state.selectedItems,
                      context: context,
                      listColor: Colors.white,
                      isAccept: false, subTitle: 'delete_all'.tr,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Spacer(),
                    Row(
                      children: [
                        _buildActionButton(
                          'execute'.tr,
                          Icons.save,
                          const Color(0xFF0C69C0),
                          () {
                            // Handle save action
                          },
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        _buildActionButton(
                          'delete_all'.tr,
                          Icons.delete,
                          const Color(0xFF819AA7),
                          () {
                            cubit.clearSelectedItems();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget commonListTile(
    CustomDragTargetDetails item,
    int index,
    bool isAccept,
    BuildContext context,
  ) {
    return ListTile(
      key: ValueKey(item.id), // Unique key for ListTile
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFEBF8FF),
              borderRadius: BorderRadius.circular(6.0),
            ),
            child: Text(
              (index + 1).toString(),
            ),
          ),
          const SizedBox(width: 5),
          Expanded(child: Text(item.data)),
        ],
      ),
      leading: isAccept ? null : const Icon(Icons.menu),
      trailing: Icon(isAccept ? Icons.add : Icons.delete),
      onTap: () {
        final cubit = context.read<DragDropCubit>();
        if (isAccept) {
          cubit.moveItemToSelected(item);
        } else {
          cubit.moveItemToAvailable(item);
        }
      },
    );
  }

  Expanded _buildListPanel({
    required String title,
    required String subTitle,
    required List<CustomDragTargetDetails> list,
    required Color listColor,
    required bool isAccept,
    required BuildContext context,
  }) {
    return Expanded(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: const TextStyle(fontSize: 16)),
                TextButton(
                  onPressed: () {
                    final cubit = context.read<DragDropCubit>();
                    if (isAccept) {
                      cubit.moveAllToSelected();
                    } else {
                      cubit.moveAllToAvailable();
                    }
                  },
                  child:  Text(subTitle,
                      style: const TextStyle(color: Color(0xFF0C69C0))),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: listColor,
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: const Color(0xFFE9E9E9),
                  width: 2.0,
                ),
              ),
              child: DragTarget<String>(
                onAcceptWithDetails: (details) {
                  final item = context
                      .read<DragDropCubit>()
                      .indexMemory()
                      .values
                      .firstWhere(
                        (item) => item.data == details.data,
                        orElse: () => CustomDragTargetDetails(
                            id: '', data: '', offset: Offset.zero),
                      );
                  if (isAccept) {
                    context.read<DragDropCubit>().moveItemToAvailable(item);
                  } else {
                    context.read<DragDropCubit>().moveItemToSelected(item);
                  }
                },
                builder: (context, candidateData, rejectedData) {
                  return ReorderableListView.builder(
                    buildDefaultDragHandles: false,
                    onReorder: (int oldIndex, int newIndex) {
                      if (isAccept) {
                        context
                            .read<DragDropCubit>()
                            .reorderAvailableItems(oldIndex, newIndex);
                      } else {
                        context
                            .read<DragDropCubit>()
                            .reorderSelectedItems(oldIndex, newIndex);
                      }
                    },
                    padding: const EdgeInsets.all(8.0),
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      final item = list[index];
                      return Draggable<String>(
                        key: ValueKey(item.id),
                        data: item.data,
                        feedback: Material(
                          child: SizedBox(
                            width: 200,
                            child: ListTile(
                              title: Row(
                                children: [
                                  Text((index + 1).toString()),
                                  Text(item.data),
                                ],
                              ),
                              tileColor: Colors.blueAccent.withOpacity(0.5),
                            ),
                          ),
                        ),
                        childWhenDragging: Container(),
                        child: Column(
                          children: [
                            isAccept
                                ? commonListTile(item, index, isAccept, context)
                                : ReorderableDragStartListener(
                                    key: Key('$index'),
                                    index: index,
                                    child: commonListTile(
                                        item, index, isAccept, context)),
                            const Divider(height: 1.0),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
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
      label: Text(label, style: const TextStyle(color: Colors.white)),
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




