import 'package:get/get.dart';
import 'package:studyapp/controllers/auth_controller.dart';
import 'package:studyapp/controllers/theme_controller.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(AuthController(), permanent: true);
  }
}
