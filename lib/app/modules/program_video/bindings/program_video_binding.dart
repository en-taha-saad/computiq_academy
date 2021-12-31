import 'package:get/get.dart';

import '../controllers/program_video_controller.dart';

class ProgramVideoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProgramVideoController>(
      () => ProgramVideoController(),
    );
  }
}
