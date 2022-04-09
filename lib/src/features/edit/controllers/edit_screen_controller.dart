import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/themes/monokai.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vil/vil.dart';
import 'package:vil_editor/src/utils/vil_editor_native_methods.dart';
import 'package:vil_editor/src/utils/vil_language.dart';

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

  final CodeController _codeController = CodeController(
    language: vil,
    theme: monokaiTheme,
    text: '',
  );
  CodeController get codeController => _codeController;

  String run() {
    final _nativeMethods = VilEditorNativeMethods();
    Vil.native = _nativeMethods;
    Vil.run(_codeController.rawText);
    if (_nativeMethods.errorMessage.isNotEmpty) {
      throw VilException(_nativeMethods.errorMessage);
    }
    return _nativeMethods.output;
  }
}

class VilException implements Exception {
  const VilException(this.message);

  final String message;
}
