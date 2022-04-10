import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vil_editor/src/features/edit/controllers/edit_screen_controller.dart';
import 'package:vil_editor/src/features/main/controllers/main_state.dart';

final mainControllerProvider = StateNotifierProvider<MainController, MainState>(
  (ref) => MainController(),
);

class MainController extends StateNotifier<MainState> {
  MainController()
      : super(
          MainState(
            editControllers: [
              EditController(
                initialCode:
                    'tạo xin_chào = "Xin chào Việt Nam!!";\nin xin_chào;',
                initialName: 'xin_chao',
              ),
              EditController(
                initialCode: '''
lớp Xe {
    còi() {
        in "Pip pip!!!";
    }
}

tạo oto = Xe();
oto.còi();
''',
                initialName: 'oto',
              ),
            ],
          ),
        );

  void newEditTab([String? name]) {
    state = state.copyWith(
      editControllers: [
        ...state.editControllers,
        EditController(initialName: name),
      ],
    );
    state = state.copyWith(
      currentIndex: state.editControllers.length - 1,
      currentEditController: state.editControllers.last,
    );
  }

  int _newIndex(int index, List<EditController> editControllers) {
    if (index == 0) return 0;
    if (index == editControllers.length) return editControllers.length - 1;
    return index;
  }

  void closeEditTab(int index) {
    if (index > state.editControllers.length - 1) return;
    if (index == state.currentIndex) {
      final newEditControllers = state.editControllers..removeAt(index);
      if (newEditControllers.isEmpty) {
        state = const MainState(editControllers: []);
        return;
      }
      final newCurrentIndex = _newIndex(index, newEditControllers);
      state = MainState(
        editControllers: newEditControllers,
        currentIndex: newCurrentIndex,
        currentEditController: newEditControllers[newCurrentIndex],
      );
      return;
    }
    state = state.copyWith(
      editControllers: state.editControllers..removeAt(index),
    );
  }

  void setCurrentTab(int index) {
    state = state.copyWith(
      currentIndex: index,
      currentEditController: state.editControllers[index],
    );
  }
}
