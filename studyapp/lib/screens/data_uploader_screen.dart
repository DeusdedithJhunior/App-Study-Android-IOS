import 'package:flutter/material.dart';
import 'package:studyapp/controllers/questions_papers/data_uploader.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:studyapp/firebase_ref/loading_status.dart';

// ignore: must_be_immutable
class DataUploaderScreen extends StatelessWidget {
  DataUploaderScreen({super.key});

  DataUploader controller = Get.put(DataUploader());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() => Text(
            controller.loadingStatus.value == LoadingStatus.completed
                ? 'Uploading Completed'
                : 'Uploading')),
      ),
    );
  }
}
