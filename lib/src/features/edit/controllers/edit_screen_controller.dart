import 'dart:async';

import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/themes/monokai.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vil/interpreter.dart';
import 'package:vil/vil.dart';
import 'package:vil_editor/src/utils/vil_editor_native_methods.dart';
import 'package:vil_editor/src/utils/vil_language.dart';
import 'package:vil_editor/src/utils/vil_native_function.dart';

final editControllerProvider = ChangeNotifierProvider<EditController>(
  (ref) => throw UnimplementedError(),
);

class EditController extends ChangeNotifier {
  EditController({
    String? initialName,
    String? initialCode,
  }) {
    if (initialName != null) name = initialName;
    if (initialCode != null) _codeController.text = initialCode;
  }

  String _name = 'untiled';
  String get name => _name;
  set name(String value) {
    _name = value;
    notifyListeners();
  }

  List<String> _errorLines = [];
  List<String> get errorLines => _errorLines;
  void _pushErrorLine(String line) {
    _errorLines = [..._errorLines, line];
    notifyListeners();
  }

  List<String> _outputLines = [];
  List<String> get outputLines => _outputLines;
  void _pushOutputLine(String line) {
    _outputLines = [..._outputLines, line];
    notifyListeners();
  }

  final CodeController _codeController = CodeController(
    language: vil,
    theme: monokaiTheme,
    text: '',
  );
  CodeController get codeController => _codeController;
  final FocusNode _focusNode = FocusNode();
  FocusNode get focusNode => _focusNode;

  void run() {
    _errorLines = [];
    _outputLines = [];
    notifyListeners();
    final _nativeMethods = VilEditorNativeMethods(
      onError: _pushErrorLine,
      onOutput: _pushOutputLine,
      onClear: () {
        _outputLines = [];
        notifyListeners();
      },
    );
    Vil.native = _nativeMethods;
    Vil.interpreter = Interpreter(
      globals: <String, dynamic>{'xóa_mh': VilClearScreen()},
    );
    Vil.hadError = false;
    Vil.hadRuntimeError = false;
    Timer.run(() => Vil.run(_codeController.text));
  }

  int _getOffsetFromCoordinates(int line, int column) {
    var offset = 0;
    final lines = _codeController.text.split('\n');
    for (var i = 0; i < line - 1; i++) {
      offset += lines[i].length;
    }
    return offset + column;
  }

  void goToCoordinates(BuildContext context, int line, int column) {
    final offset = _getOffsetFromCoordinates(line, column);
    _codeController.selection = TextSelection.fromPosition(
      TextPosition(offset: offset),
    );
    FocusScope.of(context).requestFocus(_focusNode);
  }
}
