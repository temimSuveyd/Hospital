import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hosptail/core/class/statusreqest.dart';
import 'package:hosptail/core/constant/Appimageasset.dart';
import 'package:hosptail/core/constant/Approutes.dart';
import 'package:hosptail/core/constant/color.dart';
import 'package:hosptail/core/functions/handling_forgetPassword_errors.dart';
import 'package:lottie/lottie.dart';

abstract class ForgetpasswordController extends GetxController {
  sendLink();
  goToSigin();
}
class ForgetpasswordControllerImp extends ForgetpasswordController {
  final emailController = TextEditingController();
  Statusreqest statusreqest = Statusreqest.success;

  @override

  //إرسال رابط لتغيير كلمة المرور
  @override
  sendLink() async {
    String email = emailController.text.trim();

    statusreqest = Statusreqest.loading;
    update();
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: email,
      );


goToSigin();
      Get.defaultDialog(
        actions: [
          LottieBuilder.asset(AppImagesasset.send_email),
        ],
        title: "تم الانتهاء من العملية بنجاح",
        middleText: "تم ارسال رابط تغيير كلمة المرور الى بريدك الالكتروني",
        backgroundColor: Appcolor.white,
      );

      statusreqest = Statusreqest.success;
      update();
    } on FirebaseAuthException catch (e) {
      statusreqest = Statusreqest.success;
      update();
      //تصحيح أخطاء تجديد كلمة المرور
      return handlingetPassword_errors(e);
    } catch (e) {
      statusreqest = Statusreqest.parsingError;
      update();
    }
  }

  @override
  goToSigin() {
    Get.toNamed(Approutes.login);
  }
}
