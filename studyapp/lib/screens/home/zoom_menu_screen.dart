import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studyapp/configs/themes/app_colors.dart';
import 'package:studyapp/configs/themes/ui_parameters.dart';
import '../../controllers/zoom_drawer_controller.dart';

class MyZoomMenuScreen extends GetView<MyZoomDrawerController> {
  const MyZoomMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UIParameters.mobileScreenPadding,
      width: double.maxFinite,
      // decoration: BoxDecoration(gradient: mainGraidient()),
      child: Theme(
        data: ThemeData(
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: onSurfaceTextColor)),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 30,
                right: 0,
                child: BackButton(
                  color: Colors.white,
                  onPressed: () {
                    controller.toogleDrawer();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
