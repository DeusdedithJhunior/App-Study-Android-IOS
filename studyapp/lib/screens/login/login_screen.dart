// classe de tela de login
import 'package:flutter/material.dart';
import 'package:studyapp/configs/themes/app_colors.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/loginScreen';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: mainGraidient()),
      ),
    );
  }
}
