import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vil_editor/src/features/edit/controllers/edit_screen_controller.dart';
import 'package:vil_editor/src/features/edit/screens/edit_screen.dart';
import 'package:vil_editor/src/features/main/code_title.dart';
import 'package:vil_editor/src/features/main/main_controller.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainState = ref.watch(mainControllerProvider);

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 48,
            width: double.maxFinite,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Theme.of(context).dividerColor),
              ),
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                if (index == mainState.editControllers.length) {
                  return const AddEditPageButton();
                }

                return CodeTitle(
                  mainState.editControllers[index],
                  key: ValueKey('code_title_$index'),
                  index: index,
                );
              },
              itemCount: mainState.editControllers.length + 1,
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                if (mainState.currentEditController != null)
                  Positioned.fill(
                    child: ProviderScope(
                      overrides: [
                        editControllerProvider.overrideWithValue(
                          mainState.currentEditController!,
                        ),
                      ],
                      child: const EditScreen(),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
