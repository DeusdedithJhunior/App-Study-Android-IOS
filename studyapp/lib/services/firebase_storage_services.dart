import '../../firebase_ref/references.dart';
import 'package:get/get.dart';

// classe que vai "pegar" as imagens diretamente do DB
class FirebaseStorageService extends GetxService {
  Future<String?> getImage(String? imgName) async { 
    if (imgName == null) {
      return null;
    }
    try {
      var urlRef = firebaseStorage
          .child('question_paper_imagens')
          .child('${imgName.toLowerCase()}.png');

      var imgUrl = await urlRef.getDownloadURL();

      return imgUrl;
    } catch (e) {
      // ignore: avoid_print
      print(e);
      return null;
    }
  }
}
