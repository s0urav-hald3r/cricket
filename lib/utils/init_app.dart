import 'package:cricket/controllers/data_controller.dart';
import 'package:get/get.dart';

import '../controllers/screen_controller.dart';

initApp() async {
  Get.lazyPut(() => ScreenController(), fenix: true);
  Get.lazyPut(() => DataController(), fenix: true);
}
