import 'package:computiq_academy_app/app/modules/theme/controllers/theme_controller.dart';
import 'package:get/get.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ThemeController(), fenix: true);
  }
}
