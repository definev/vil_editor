import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vil_editor/src/features/edit/controllers/edit_screen_controller.dart';

part 'main_state.freezed.dart';

@freezed
class MainState with _$MainState {
  const factory MainState({
    int? currentIndex,
    EditController? currentEditController,
    required List<EditController> editControllers,
  }) = _State;
}
