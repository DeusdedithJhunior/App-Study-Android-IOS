import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:studyapp/components/content_area.dart';
import 'package:studyapp/configs/themes/app_colors.dart';
import 'package:studyapp/configs/themes/app_icons.dart';
import 'package:studyapp/configs/themes/custom_text_styles.dart';
import 'package:studyapp/controllers/questions_papers/question_paper_controller.dart';
import 'package:studyapp/controllers/zoom_drawer_controller.dart';
import 'package:studyapp/screens/home/zoom_menu_screen.dart';
import '../../configs/themes/ui_parameters.dart';
import 'question_card.dart';

class HomeScreen extends GetView<MyZoomDrawerController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    QuestionPaperController _questionPaperController = Get.find();
    return Scaffold(
      body: GetBuilder<MyZoomDrawerController>(
        builder: (_) {
          return Container(
            decoration: BoxDecoration(gradient: mainGraidient()),
            child: ZoomDrawer(
              borderRadius: 50.0,
              controller: _.zoomDrawerController,
              showShadow: false,
              angle: 0.0,
              style: DrawerStyle.defaultStyle,
              // menuBackgroundColor: Colors.grey.withOpacity(0.1),
              slideWidth: MediaQuery.of(context).size.width * 0.8,
              menuScreen: const MyZoomMenuScreen(),
              mainScreen: Container(
                decoration: BoxDecoration(gradient: mainGraidient()),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(mobileScreenPadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // AppCircleButton(
                            //   onTap: controller.toogleDrawer,
                            //   child: const Icon(AppIcons.menuLeft),
                            // ),
                            IconButton(
                              onPressed: controller.toogleDrawer,
                              icon: const Icon(AppIcons.menuLeft),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                children: <Widget>[
                                  const Icon(AppIcons.greetingIcon),
                                  Text('Olá Estudante',
                                      style: detailText.copyWith(
                                          color: onSurfaceTextColor)),
                                ],
                              ),
                            ),
                            const Text(
                              'O que você quer aprender hoje?',
                              style: headerText,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: ContentArea(
                            addPadding: false,
                            child: Obx(
                              () => ListView.separated(
                                padding: UIParameters.mobileScreenPadding,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return QuestionCard(
                                    model: _questionPaperController
                                        .allPaper[index],
                                  );
                                },
                                itemCount:
                                    _questionPaperController.allPaper.length,
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const SizedBox(height: 20);
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
