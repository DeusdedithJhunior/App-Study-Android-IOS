// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

class DataUploader extends GetxController {
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }

  void uploadData() {
    print('texte carregamento');
  }
}
