// classe de tela de login
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:studyapp/components/common/main_button.dart';
import 'package:studyapp/configs/themes/app_colors.dart';
import '../../controllers/auth_controller.dart';

class LoginScreen extends GetView<AuthController> {
  static const String routeName = '/loginScreen';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        alignment: Alignment.center,
        decoration: BoxDecoration(gradient: mainGraidient()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/app_splash_logo.png',
                width: 200, height: 200),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 60),
              child: Text(
                'Este é um aplicativo de estudo. Você pode usar como quiser. Você tem acesso total a todos os materiais deste curso.',
                style: TextStyle(
                    color: onSurfaceTextColor, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            MainButton(
              onTap: () {
                controller.singInWithGoogle();
              },
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    bottom: 0,
                    child: SvgPicture.asset('assets/icons/google.svg'),
                  ),
                  Center(
                    child: Text('Login com Google',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
