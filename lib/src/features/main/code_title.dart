import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercharged/supercharged.dart';
import 'package:vil_editor/src/features/edit/controllers/edit_screen_controller.dart';
import 'package:vil_editor/src/features/main/main_controller.dart';

class CodeTitle extends HookConsumerWidget {
  const CodeTitle(
    this.controller, {
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;
  final EditController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainController = ref.watch(mainControllerProvider.notifier);
    final isCurrenTab = ref.watch(
      mainControllerProvider.select((value) => value.currentIndex == index),
    );
    final isHover = useState(false);

    return MouseRegion(
      onExit: (_) => isHover.value = false,
      onEnter: (_) => isHover.value = true,
      child: GestureDetector(
        onTap: () => mainController.setCurrentTab(index),
        child: AnimatedContainer(
          duration: 300.milliseconds,
          curve: Curves.ease,
          height: 48,
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(color: Theme.of(context).dividerColor),
            ),
            color: (isHover.value || isCurrenTab)
                ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
                : Colors.transparent,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                SizedBox(
                  height: 20,
                  child: Image.network(
                    'https://user-images.githubusercontent.com/62325868/138510986-cdfb34b2-12c4-4b83-947c-32735c6a7478.png',
                  ),
                ),
                const Gap(8),
                Center(
                  child: Text(
                    '${controller.name}.vil',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                const Gap(8),
                InkWell(
                  onTap: () => mainController.closeEditTab(index),
                  borderRadius: BorderRadius.circular(2),
                  child: AnimatedContainer(
                    duration: 300.milliseconds,
                    curve: Curves.ease,
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: (isHover.value || isCurrenTab)
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.primary,
                    ),
                    alignment: Alignment.center,
                    clipBehavior: Clip.antiAlias,
                    child: Icon(
                      Icons.close,
                      color: (isHover.value || isCurrenTab)
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.onPrimary,
                      size: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AddEditPageButton extends ConsumerWidget {
  const AddEditPageButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainController = ref.watch(mainControllerProvider.notifier);

    return InkWell(
      onTap: mainController.newEditTab,
      child: Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(color: Theme.of(context).dividerColor),
          ),
        ),
        child: const Center(child: Icon(Icons.add)),
      ),
    );
  }
}
