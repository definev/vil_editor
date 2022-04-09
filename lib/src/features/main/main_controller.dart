import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vil_editor/src/features/edit/controllers/edit_screen_controller.dart';
import 'package:vil_editor/src/features/main/main_state.dart';

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
                initialCode:
                    'tạo xin_chào = "Xin chào Trung Quốc!!!";\nin xin_chào;',
                initialName: 'ni_hao',
              ),
              EditController(
                initialCode: 'tạo xin_chào = "Xin chào Indo!!!";\nin xin_chào;',
                initialName: 'ngentot',
              ),
              EditController(
                initialCode:
                    'tạo xin_chào = "Xin chào Japan!!!";\nin xin_chào;',
                initialName: 'nani',
              ),
            ],
          ),
        );

  void newEditTab() {
    state = MainState(
      editControllers: state.editControllers..add(EditController()),
      currentIndex: state.currentIndex,
    );
  }

  void closeEditTab(int index) {
    if (index > state.editControllers.length - 1) return;
    if (index == state.currentIndex) {
      state = MainState(
        editControllers: state.editControllers..removeAt(index),
      );
      return;
    }
    state = MainState(
      editControllers: state.editControllers..removeAt(index),
      currentIndex: state.currentIndex,
    );
  }

  void setCurrentTab(int index) {
    state = MainState(
      editControllers: state.editControllers,
      currentIndex: index,
      currentEditController: state.editControllers[index],
    );
  }
}
