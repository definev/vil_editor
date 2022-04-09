import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vil/native_methods.dart';

final vilEditorNativeMethodsProvider = Provider<VilEditorNativeMethods>(
  (ref) => VilEditorNativeMethods(),
);

class VilEditorNativeMethods implements NativeMethods {
  String _output = '';
  String _errorMessage = '';

  String get output => _output;
  String get errorMessage => _errorMessage;

  @override
  void error(dynamic value) {
    _errorMessage += value.toString();
  }

  @override
  void out(dynamic value) {
    _output += value.toString();
  }
}
