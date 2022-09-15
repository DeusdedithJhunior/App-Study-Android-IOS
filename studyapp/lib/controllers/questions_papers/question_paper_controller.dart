import 'package:get/get.dart';
import 'package:studyapp/services/firebase_storage_services.dart';

class QuestionPaperController extends GetxController {
  final allPaperImages = <String>[].obs;

  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers() async {
    List<String> imgName = [
      'biology',
      'chemistry',
      'maths',
      'physics-atom',
      'physics-block'
    ];
    try {
      for (var img in imgName) {
        final imgUrl = await Get.find<FirebaseStorageService>().getImage(img);
        allPaperImages.add(imgUrl!);
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
