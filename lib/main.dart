import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hosptail/firebase_options.dart';
import 'package:hosptail/routes.dart';

import 'package:hosptail/services/servieses.dart';

import 'Biniding/Biniding.dart';
import 'localization/changelocal.dart';
import 'localization/translation.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);

  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug,
    appleProvider: AppleProvider.debug,
  );
 // await Geolocator.requestPermission();
  await initailservieses();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Localcontroller controller  = Get.put(Localcontroller());
    return ScreenUtilInit(
        // designSize: const Size(375, 812), // Design size in Figma or Sketch (Width x Height)
        designSize: MediaQuery.of(context).size.width > 600
        ? const Size(834, 1194) // Adjust for tablets
        : const Size(393, 859), // Phone dimensions
    minTextAdapt: true,
    splitScreenMode: true,
    enableScaleWH: () => true,
    enableScaleText: () => true,

    // Use builder only if you need to use library outside ScreenUtilInit context
    builder: (context, child) {
    ScreenUtil.init(context);
    return GetMaterialApp(
      translations: MyTranslation(),
      locale: controller.language,
      title: 'Flutter Demo',
      theme:controller.appTheme,
      initialBinding: InitialBinding(),
      debugShowCheckedModeBanner: false,
        getPages: routes,
    );
});

  }}