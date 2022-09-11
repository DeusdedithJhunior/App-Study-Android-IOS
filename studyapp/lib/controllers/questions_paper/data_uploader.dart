// ignore: depend_on_referenced_packages
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:convert';

import 'package:studyapp/models/question_paper_model.dart';

class DataUploader extends GetxController {
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }

  Future<void> uploadData() async {
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
  }
}
