import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hosptail/core/class/statusreqest.dart';
import 'package:hosptail/core/constant/Approutes.dart';
import 'package:hosptail/core/constant/appShareds.dart';
import 'package:hosptail/core/constant/color.dart';
import 'package:hosptail/core/functions/get_access_token.dart';
import 'package:hosptail/core/functions/handling_signin_errors.dart';
import 'package:hosptail/data/dataScore/remote/user_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LoginController extends GetxController {
  togglePasswordVisibility();
  gotoforgetpassword();
  goToHomePage();
  toggleRememberMe();
  loadSavedCredentials();
  saveCredentials(String email, String password);
  getUserData();
  login();
  updateUserTokens();
  getToken();
  getAccessToken();
}

class LoginControllerImp extends LoginController {
  final employeeemailController = TextEditingController();
  final passwordController = TextEditingController();
  Statusreqest statusreqest = Statusreqest.success;
  FirebaseAuth credential = FirebaseAuth.instance;
  UserData _userData = UserData();
  Map<String, dynamic>? userData;

  String? userUid;
  var isPasswordVisible = false.obs; // حالة رؤية كلمة المرور
  var rememberMe = false.obs; // حالة "تذكرني"
  String? userRole;
  String? department;
  String? accessToken;
  String? userToken;

  /// تبديل رؤية كلمة المرور
  @override
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  /// تبديل حالة "تذكرني"
  @override
  void toggleRememberMe() {
    rememberMe.value = !rememberMe.value;
  }

  /// تحميل بيانات تسجيل الدخول إذا كانت محفوظة
  @override
  Future<void> loadSavedCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    employeeemailController.text = prefs.getString(Appshareds.email) ?? '';
    passwordController.text = prefs.getString(Appshareds.password) ?? '';
    rememberMe.value = prefs.getBool(Appshareds.rememberMe) ?? false;
  }

  /// حفظ بيانات تسجيل الدخول
  @override
  Future<void> saveCredentials(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(Appshareds.userUid, userUid!);
    await prefs.setString(Appshareds.role, userRole!);
    await prefs.setString(Appshareds.email, email);
    await prefs.setString(Appshareds.password, password);
    await prefs.setString(Appshareds.department, department!);
    if (rememberMe.value) {
      await prefs.setBool(Appshareds.rememberMe, true);
    } else {
      await prefs.setBool(Appshareds.rememberMe, false);
    }
  }

  /// تنفيذ عملية تسجيل الدخول
  @override
  Future<void> login() async {
    statusreqest = Statusreqest.loading;
    update();

    String email = employeeemailController.text.trim();
    String password = passwordController.text.trim();
    try {
// تسجيل الدخول مع Firebase
      await credential.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      userUid = credential.currentUser!.uid;
      await getUserData();
//حفظ بيانات تسجيل الدخول إذا تم تحديد"تذكرني
      await saveCredentials(email, password);
//update user access token for firebase notification
      updateUserTokens();
      goToHomePage();
     } on FirebaseAuthException catch (e) {
      statusreqest = Statusreqest.success;
      update();
      //تصحيح أخطاء Firebase
      return handling_sigin_errors(e);
    } catch (e) {
      statusreqest = Statusreqest.parsingError;
      update();
      Get.showSnackbar(GetSnackBar(
        title: "Error".tr,
        message: "Something went wrong".tr,
        duration: const Duration(seconds: 3),
        backgroundColor: Appcolor.primarycolor,
      ));
    }
  }

  @override
  void gotoforgetpassword() {
    Get.toNamed(Approutes.forgetpasword);
  }

  @override
  void goToHomePage() async {
    String pageName = "/${userRole}Homepage";
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(Appshareds.pageName, pageName);
    Get.toNamed(pageName);
  }

  @override
  getUserData() async {
    statusreqest = Statusreqest.loading;
    update();
    try {
      await _userData.getUserData(userUid!).then(
        (value) {
          userData = value!;
        },
      );
      userRole = userData!["role"];
      department = userData!["department"];
      statusreqest = Statusreqest.success;
      update();
    } catch (e) {
      statusreqest = Statusreqest.parsingError;
      update();
    }
  }

  @override
  updateUserTokens() async {
    statusreqest = Statusreqest.loading;
    update();
    try {
      _userData.updateTokensData(userRole!, userUid!, accessToken!, userToken!);
      statusreqest = Statusreqest.success;
      update();
    } catch (e) {
      statusreqest = Statusreqest.parsingError;
      update();
    }
  }

  @override
  getAccessToken() async {
    accessToken = await get_access_token();
  }

  @override
  getToken() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    await messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );
    userToken = await messaging.getToken();
    log(userToken!);
  }

  @override
  void onInit() {
    super.onInit();
    loadSavedCredentials();
    getToken();
    getAccessToken();
  }
}
