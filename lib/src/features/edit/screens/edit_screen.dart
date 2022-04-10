import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vil_editor/src/features/edit/controllers/edit_screen_controller.dart';

class EditScreen extends ConsumerWidget {
  const EditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(editControllerProvider);

    return CodeField(
      controller: controller.codeController,
      expands: true,
      lineNumberStyle: LineNumberStyle(
        textStyle: Theme.of(context).textTheme.caption!.copyWith(fontSize: 1),
        margin: 4,
        width: 70,
      ),
      lineNumberBuilder: (index, style) => TextSpan(
        text: '$index',
        style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 12),
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const NetworkImage(
            'https://ik.imagekit.io/ikmedia/backlit.jpg',
          ),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Theme.of(context).colorScheme.surface.withOpacity(0.4),
            BlendMode.srcATop,
          ),
        ),
      ),
    );
  }
}
