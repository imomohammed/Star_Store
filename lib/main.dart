import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:star/src/Controller/Auth/login_controller.dart';
import 'package:star/src/Utils/app_references.dart';
import 'package:star/src/Utils/localizations/Translation.dart';
import 'package:star/src/Utils/routes.dart';
import 'package:star/src/View/Splash/splash.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await initialServices();
  // Get.put(CategoriesController());

 // Initialize the controller before running the app
  Get.put(LoginControllerImp());

  await AppPreferences.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Star Store',
     // initialBinding: InitialBindings(),
      home:
     // HomeScreen(),
      Splash(),
      getPages: AppRoute.routes,
    );
  }
}

