import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studyapp/controllers/questions_papers/question_paper_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    QuestionPaperController _questionPaperController = Get.find();
    return Scaffold(
      body: Obx(
        () => ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
                child: SizedBox(
                    height: 200,
                    width: 200,
                    child: FadeInImage(
                        placeholder: const AssetImage(
                            'assets/images/app_splash_logo.png'),
                        image: NetworkImage(
                            _questionPaperController.allPaperImages[index]))));
          },
          itemCount: _questionPaperController.allPaperImages.length,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 20);
          },
        ),
      ),
    );
  }
}
