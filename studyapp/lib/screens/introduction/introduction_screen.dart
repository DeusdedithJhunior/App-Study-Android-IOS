import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/app_circle_button.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(Icons.star, size: 65, color: Colors.amber),
              const SizedBox(height: 40),
              const Text(
                  'Este é um aplicativo de estudo. Você pode usá-lo como quiser. Se você entender como isso funciona, poderá escalá-lo.'),
              const SizedBox(height: 40),
              AppCircleButton(
                onTap: () {},
                child: const Icon(
                  Icons.arrow_forward,
                  size: 35,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
