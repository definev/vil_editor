import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vil_editor/src/features/edit/controllers/edit_screen_controller.dart';
import 'package:vil_editor/src/features/edit/screens/edit_screen.dart';
import 'package:vil_editor/src/features/introduction/introduction_screen.dart';
import 'package:vil_editor/src/features/main/code_title.dart';
import 'package:vil_editor/src/features/main/controllers/main_controller.dart';
import 'package:vil_editor/src/features/terminal/screens/terminal_screen.dart';

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
            child: Row(
              children: [
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => CodeTitle(
                      mainState.editControllers[index],
                      key: ValueKey('code_title_$index'),
                      index: index,
                    ),
                    itemCount: mainState.editControllers.length,
                  ),
                ),
                const AddEditPageButton(),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                if (mainState.currentEditController != null) ...[
                  Positioned.fill(
                    child: ProviderScope(
                      overrides: [
                        editControllerProvider.overrideWithValue(
                          mainState.currentEditController!,
                        ),
                      ],
                      child: EditScreen(
                        key: ValueKey('edit_screen_${mainState.currentIndex}'),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ProviderScope(
                      overrides: [
                        editControllerProvider.overrideWithValue(
                          mainState.currentEditController!,
                        ),
                      ],
                      child: const TerminalScreen(),
                    ),
                  ),
                ] else
                  const Positioned.fill(child: IntroductionScreen()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
