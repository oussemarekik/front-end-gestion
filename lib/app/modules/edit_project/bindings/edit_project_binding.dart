import 'package:get/get.dart';

import '../controllers/edit_project_controller.dart';

class EditProjectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProjectController>(
      () => EditProjectController(),
    );
  }
}
