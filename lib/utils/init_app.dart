import 'package:get/get.dart';

import '../controllers/screen_controller.dart';

initApp() async {
  Get.lazyPut(() => ScreenController(), fenix: true);
}
