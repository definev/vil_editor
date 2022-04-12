import 'package:vil/interpreter.dart';
import 'package:vil/vil.dart';
import 'package:vil/vil_callable.dart';
import 'package:vil_editor/src/utils/vil_editor_native_methods.dart';

class VilClearScreen extends VilCallable {
  @override
  int get argsSize => 0;

  @override
  void call(Interpreter interpreter, List arguments) {
    (Vil.native as VilEditorNativeMethods).clear();
  }
}
