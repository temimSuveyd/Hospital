import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hosptail/core/constant/Approutes.dart';

import 'package:hosptail/core/constant/appShareds.dart';
import 'package:hosptail/services/servieses.dart';

class Appmiddleware extends GetMiddleware {
  Services services = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    final shared = services.sharedPreferences;
    if (shared.getBool(Appshareds.rememberMe) == true) {
      String pageName = shared.getString(Appshareds.pageName)!;
      return RouteSettings(name: pageName);
    } else {
      return const RouteSettings(name: Approutes.onboarding);
    }
  }
}
