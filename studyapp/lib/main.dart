// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_navigation/get_navigation.dart';
// import 'package:studyapp/screens/data_uploader_screen.dart';
// import 'firebase_options.dart';
// import 'firebase_options.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studyapp/bindings/initial_bindings.dart';
import 'package:studyapp/configs/themes/app_light_theme.dart';
import 'package:studyapp/routes/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  InitialBindings().dependencies();
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: LightTheme().buildLightTheme(),
      getPages: AppRoutes.routes(),
    );
  }
}

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   runApp(
//     GetMaterialApp(
//       home: DataUploaderScreen(),
//     ),
//   );
// }
