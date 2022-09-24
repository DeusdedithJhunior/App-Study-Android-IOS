import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:studyapp/controllers/auth_controller.dart';
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
    // List<String> imgName = ['Biology', 'Chemistry', 'Maths', 'Physics'];
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
        paper.imageUrl = imgUrl!;
      }
      allPaper.assignAll(paperList);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  void navigateToQuestions(
      {required QuestionPaperModel paper, bool tryAgain = false}) {
    // ignore: no_leading_underscores_for_local_identifiers
    AuthController _authController = Get.find();
    if (_authController.isLoggedIn()) {
      if (tryAgain) {
        Get.back();
        // Get.offNamed();
      } else {
        // Get.toNamed();
      }
    } else {
      
      // ignore: unnecessary_string_interpolations, avoid_print
      print('${paper.title}');
      _authController.showLoginAlertDialogue();
    }
  }
}
