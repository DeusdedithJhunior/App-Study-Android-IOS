import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:studyapp/models/question_paper_model.dart';

class QuestionCard extends StatelessWidget {
  final QuestionPaperModel model;

  const QuestionCard({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            CachedNetworkImage(
              imageUrl: model.imageUrl,
              placeholder: (context, url) => Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) =>
                  Image.asset('assets/images/app_splash_logo.png'),
            ),
          ],
        )
      ],
    );
  }
}
