import 'package:flutter/foundation.dart';
import 'package:vil/native_methods.dart';

class VilEditorNativeMethods implements NativeMethods {
  VilEditorNativeMethods({
    required this.onError,
    required this.onOutput,
    required this.onClear,
  });

  String _output = '';
  String _errorMessage = '';

  String get output => _output;
  String get errorMessage => _errorMessage;

  final ValueChanged<String> onError;
  final ValueChanged<String> onOutput;
  final VoidCallback onClear;

  @override
  void error(dynamic value) {
    if (_errorMessage.isEmpty) {
      _errorMessage = '$value';
    } else {
      _errorMessage += '\n$value';
    }
    onError('$value');
  }

  @override
  void out(dynamic value) {
    final text = value.toString().replaceAll(r'\n', '\n');
    _output += text;
    onOutput('$value');
  }

  void clear() {
    _output = '';
    _errorMessage = '';
    onClear();
  }
}
