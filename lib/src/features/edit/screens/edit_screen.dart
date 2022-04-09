import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:highlight/highlight.dart';
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

CodeController useCodeFieldController({
  required Mode? language,
  required String? code,
  List<Object?>? keys,
}) {
  final controller = use(
    _CodeFieldControllerHook(
      language: language,
      code: code,
      keys: keys,
    ),
  );
  return controller;
}

class _CodeFieldControllerHook extends Hook<CodeController> {
  const _CodeFieldControllerHook({
    required this.language,
    required this.code,
    List<Object?>? keys,
  }) : super(keys: keys);

  final Mode? language;
  final String? code;

  @override
  HookState<CodeController, Hook<CodeController>> createState() =>
      _CodeFieldControllerHookState();
}

class _CodeFieldControllerHookState
    extends HookState<CodeController, _CodeFieldControllerHook> {
  late CodeController _controller;

  @override
  void initHook() {
    super.initHook();
    _controller = CodeController(
      language: hook.language,
      text: hook.code,
      theme: monokaiSublimeTheme,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  CodeController build(BuildContext context) => _controller;
}
