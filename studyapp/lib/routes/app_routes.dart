import 'package:get/get.dart';
import 'package:studyapp/controllers/questions_papers/question_paper_controller.dart';
import 'package:studyapp/screens/home/home_screen.dart';
import 'package:studyapp/screens/introduction/introduction_screen.dart';
import '../screens/splash/splash_screen.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(
          name: '/',
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: '/appintroduction',
          page: () => const IntroductionScreen(),
        ),
        GetPage(
            name: '/home',
            page: () => const HomeScreen(),
            binding: BindingsBuilder(() {
              Get.put(QuestionPaperController());
            })),
      ];
}
