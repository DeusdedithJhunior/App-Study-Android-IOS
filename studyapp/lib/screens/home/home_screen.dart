import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studyapp/controllers/questions_papers/question_paper_controller.dart';

import 'question_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    QuestionPaperController _questionPaperController = Get.find();
    return Scaffold(
      body: Obx(
        () => ListView.separated(
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return QuestionCard(
              model: _questionPaperController.allPaper[index],
            );
          },
          itemCount: _questionPaperController.allPaper.length,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 20);
          },
        ),
      ),
    );
  }
}
