import 'package:get/get.dart';

class AuthController extends GetxController {
  @override
  void onReady() {
    initAuth();
    super.onReady();
  }

  // metodo que vai iniciar "na tela de abertura" do app
  void initAuth() async {
    await Future.delayed(const Duration(seconds: 2));
    navigateToIntroduction();
  }

  // metodo que vai nagevar para pagina de introdução do app
  void navigateToIntroduction() {
    Get.offAllNamed('/appintroduction');
  }
}
