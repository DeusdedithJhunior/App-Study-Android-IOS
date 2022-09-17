import 'package:get/get.dart';
import 'package:studyapp/controllers/auth_controller.dart';
import 'package:studyapp/controllers/theme_controller.dart';
import '../services/firebase_storage_services.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FirebaseStorageService());
    //Get.put(PapersDataUploader());
    Get.put(ThemeController());
    Get.put(AuthController(), permanent: true);
  }
}
