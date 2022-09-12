// ignore: depend_on_referenced_packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:studyapp/firebase_ref/references.dart';
import 'dart:convert';

import 'package:studyapp/models/question_paper_model.dart';

class DataUploader extends GetxController {
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }

  Future<void> uploadData() async {
    final fireStore = FirebaseFirestore.instance;
    final manifestContent = await DefaultAssetBundle.of(Get.context!)
        .loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    //carregando arquivo json e monstrando o caminho
    final papersInAssets = manifestMap.keys
        .where((path) =>
            path.startsWith('assets/dummy_data/papers') &&
            path.contains('.json'))
        .toList();

    List<QuestionPaperModel> questionPapers = [];
    // laço (interação) para acessar o conteudo de cada json da pasta papers
    for (var paper in papersInAssets) {
      String stringPaperContent = await rootBundle.loadString(paper);
      questionPapers.add(
        QuestionPaperModel.fromJson(
          json.decode(stringPaperContent),
        ),
      );
    }
    // print('quantidade: ${questionPapers.length}'); testando no debug console
    var batch = fireStore.batch();

    //  escrevendo no banco de dados
    for (var paper in questionPapers) {
      batch.set(questionPaperRF.doc(paper.id), {
        "title": paper.title,
        "image_url": paper.imageUrl,
        "description": paper.description,
        "time-seconds": paper.timeSeconds,
        "question_count": paper.questions == null ? 0 : paper.questions!.length
      });

      for (var questions in paper.questions!) {
        final questionPath =
            questionRF(paperId: paper.id, questionId: questions.id);
        batch.set(questionPath, {
          "question": questions.question,
          "correct_answer": questions.correctAnswer
        });

        for (var answer in questions.answers) {
          batch.set(questionPath.collection('answers').doc(answer.identifier),
              {"identifier": answer.identifier, "answer": answer.answer});
        }
      }
    }
    await batch.commit();
  }
}
