import 'package:get/state_manager.dart';

class ScreenController extends GetxController {
  final RxInt _screenIndex = 0.obs;

  changeScreenIndex(int index) {
    _screenIndex.value = index;
  }

  int get screenIndex => _screenIndex.value;
}
