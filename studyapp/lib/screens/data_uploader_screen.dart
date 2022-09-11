import 'package:flutter/material.dart';
import 'package:studyapp/controllers/questions_paper/data_uploader.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

// ignore: must_be_immutable
class DataUploaderScreen extends StatelessWidget {
  DataUploaderScreen({super.key});

  DataUploader controller = Get.put(DataUploader());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('text'),
      ),
    );
  }
}
