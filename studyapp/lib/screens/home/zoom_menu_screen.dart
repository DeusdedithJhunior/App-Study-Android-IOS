import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studyapp/configs/themes/app_colors.dart';
import 'package:studyapp/configs/themes/ui_parameters.dart';
import '../../controllers/zoom_drawer_controller.dart';

class MyZoomMenuScreen extends GetView<MyZoomDrawerController> {
  const MyZoomMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    User? _user = FirebaseAuth.instance.currentUser;

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
              Padding(
                padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.3,
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(_user!.photoURL!),
                      radius: 50,
                    ),
                    const SizedBox(height: 10),
                    Obx(
                      () => controller.user.value == null
                          ? const SizedBox()
                          : Text(
                              controller.user.value!.displayName ?? '',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18,
                                  color: onSurfaceTextColor),
                            ),
                    ),
                    const Spacer(flex: 1),
                    _DrawerButton(
                      icon: Icons.web,
                      label: 'WebSite',
                      onPressed: () => controller.webSite(),
                    ),
                    _DrawerButton(
                      icon: Icons.email,
                      label: 'Email',
                      onPressed: () => controller.email(),
                    ),
                    const Spacer(flex: 4),
                    _DrawerButton(
                      icon: Icons.logout,
                      label: 'Sair',
                      onPressed: () => controller.signOut(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: unused_element
class _DrawerButton extends StatelessWidget {
  const _DrawerButton({
    required this.icon,
    required this.label,
    // ignore: unused_element
    this.onPressed,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 15,
      ),
      label: Text(label),
    );
  }
}
