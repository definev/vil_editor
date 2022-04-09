import 'package:vil_editor/src/features/edit/controllers/edit_screen_controller.dart';

class MainState {
  MainState({
    this.currentIndex,
    this.currentEditController,
    required this.editControllers,
  });

  final int? currentIndex;
  final EditController? currentEditController;
  final List<EditController> editControllers;
}
