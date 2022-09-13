import 'package:get/get.dart';
import 'package:studyapp/screens/introduction/introduction_screen.dart';
import '../screens/splash/splash_screen.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(name: '/', page: () => const SplashScreen()),
        GetPage(name: '/appintroduction', page: () => const IntroductionScreen())
      ];
}
