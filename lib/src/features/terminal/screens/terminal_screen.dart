import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercharged/supercharged.dart';
import 'package:vil_editor/resources/resources.dart';
import 'package:vil_editor/src/features/edit/controllers/edit_screen_controller.dart';

class TerminalScreen extends HookConsumerWidget {
  const TerminalScreen({Key? key}) : super(key: key);

  List<Widget> _formatError(
    BuildContext context,
    List<String> error,
    EditController controller,
  ) {
    final widgetList = <Widget>[];
    for (final text in error) {
      final errorType = text.allBetween('|', '|');
      final errorLocation = text.allBetween('[', ']');
      final errorMessage = text.allAfter(']:');
      final errorWidget = RichText(
        text: TextSpan(
          text: '|$errorType| ',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Theme.of(context).colorScheme.error),
          children: [
            TextSpan(
              text: ' [$errorLocation]',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            TextSpan(
              text: ':$errorMessage',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
          ],
        ),
      );
      widgetList.add(
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            shape: const RoundedRectangleBorder(),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 3),
              child: errorWidget,
            ),
          ),
          onPressed: () {
            final coor = errorLocation.split(', ');
            final line = int.parse(coor[0]);
            final column = int.parse(coor[1]);
            controller.goToCoordinates(context, line, column);
          },
        ),
      );
    }
    return widgetList;
  }

  List<Widget> _formatOutput(BuildContext context, List<String> output) {
    final widgetList = <Widget>[];
    for (final text in output) {
      final outputWidget = Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 3),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(text),
          ),
        ),
      );
      widgetList.add(outputWidget);
    }

    return widgetList;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showDetail = useState(false);
    final outputLines = ref.watch(
      editControllerProvider.select(
        (value) => value.outputLines,
      ),
    );
    final errorLines = ref.watch(
      editControllerProvider.select(
        (value) => value.errorLines,
      ),
    );

    final controller = ref.watch(editControllerProvider.notifier);

    return AnimatedContainer(
      duration: 300.milliseconds,
      height: 56 + (showDetail.value ? 300 : 0),
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
              child: ListView(
                padding: EdgeInsets.only(
                  top: errorLines.isEmpty ? 12 : 0,
                ),
                children: errorLines.isNotEmpty
                    ? _formatError(context, errorLines, controller)
                    : _formatOutput(context, outputLines),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
