import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercharged/supercharged.dart';
import 'package:vil_editor/resources/resources.dart';
import 'package:vil_editor/src/features/edit/controllers/edit_screen_controller.dart';

class TerminalScreen extends HookConsumerWidget {
  const TerminalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showDetail = useState(false);
    final output = ref.watch(
      editControllerProvider.select(
        (value) => value.output,
      ),
    );
    final controller = ref.watch(editControllerProvider.notifier);

    return AnimatedContainer(
      duration: 300.milliseconds,
      height: 56 + (showDetail.value ? 100 : 0),
      width: double.maxFinite,
      curve: Curves.easeOut,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border(
          top: BorderSide(
            color: Theme.of(context).dividerColor,
          ),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 55,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Image.asset(VilIcons.icon),
                ),
                const VerticalDivider(width: 7, thickness: 1),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.all(8),
                          children: [
                            TextButton(
                              onPressed: () =>
                                  showDetail.value = !showDetail.value,
                              child: const Text('Console'),
                            ),
                          ],
                        ),
                      ),
                      if (showDetail.value)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: ElevatedButton(
                            onPressed: controller.run,
                            child: const Padding(
                              padding: EdgeInsets.all(8),
                              child: Text('Chạy'),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Theme.of(context).dividerColor,
                  ),
                ),
              ),
              child: Center(child: Text(output)),
            ),
          ),
        ],
      ),
    );
  }
}
