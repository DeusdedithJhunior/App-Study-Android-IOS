import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:studyapp/models/question_paper_model.dart';
import 'package:studyapp/services/firebase_storage_services.dart';

import '../../firebase_ref/references.dart';

class QuestionPaperController extends GetxController {
  final allPaperImages = <String>[].obs;
  final allPaper = <QuestionPaperModel>[].obs;

  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers() async {
    // List<String> imgName = ['biology', 'chemistry', 'maths', 'physics-atom'];
    try {
      // carrega as question do cloud
      // data irá armazenar toda as coleções do claud
      QuerySnapshot<Map<String, dynamic>> data = await questionPaperRF.get();

      // paperList irá armazenar no formato de lista os dados vindos
      // de QuestionPaperModel.fromSnapshot
      final paperList = data.docs
          .map((paper) => QuestionPaperModel.fromSnapshot(paper))
          .toList();
      allPaper.assignAll(paperList);

      for (var paper in paperList) {
        final imgUrl =
            await Get.find<FirebaseStorageService>().getImage(paper.title);
        paper.imageUrl = imgUrl;
      }
      allPaper.assignAll(paperList);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
