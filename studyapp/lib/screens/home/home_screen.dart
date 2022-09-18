import 'package:cached_network_image/cached_network_image.dart';
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
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
              child: SizedBox(
                height: 200,
                width: 200,
                child: CachedNetworkImage(
                  imageUrl: _questionPaperController.allPaper[index].imageUrl,
                  placeholder: (context, url) => Container(
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) =>
                      Image.asset('assets/images/app_splash_logo.png'),
                ),
              ),
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
