import 'dart:developer';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hosptail/core/class/statusreqest.dart';
import 'package:hosptail/core/constant/Approutes.dart';
import 'package:hosptail/core/constant/appShareds.dart';
import 'package:hosptail/core/functions/get_access_token.dart';
import 'package:hosptail/core/functions/handling_login_errors.dart';
import 'package:hosptail/data/dataScore/remote/user_data.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SignupController extends GetxController {
  togglePasswordVisibility();
  chooseImage();
  addUserData();
  goToOTPPage();
  verifyPhoneNumber();
  saveUserRoleShared();
  getToken();
  getAccessToken();
  selectDepartment();
  selectRoler();
}

class SignupControllerImp extends SignupController {
  var profileImage = Rx<File?>(null);
  var isPasswordVisible = false.obs;
  String? userUid;
  String? userVerificationId;
  String? userToken;
  String? userAccessToken;
  String? userImage;
  UserCredential? userCredential;
  // الحقول الخاصة بالمستخدم
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final locationController = TextEditingController();
  Statusreqest statusreqest = Statusreqest.success;
  // user data calss
  UserData userData = UserData();
  var selectedDepartment = "".obs;
  var selectedRole = "".obs;
  Rx<File?> file = Rx<File?>(null);
  final image_picker = ImagePicker();
  bool image_isLoading = false;
  // تغيير رؤية كلمة المرور
  @override
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // اختيار صورة الملف الشخصي
  @override
  Future<void> chooseImage() async {
    image_isLoading = true;
    update();
    final picedImage = await image_picker.pickMedia();
    if (picedImage != null) {
      File file = File(picedImage.path);
      String fileName = picedImage.name;
      Reference storageRef =
          FirebaseStorage.instance.ref().child('files/$fileName');
      await storageRef.putFile(file);
      String downloadUrl = await storageRef.getDownloadURL();
      userImage = downloadUrl.toString();
      log(userImage!);
      image_isLoading = true;
      update();
    } else {
      Get.showSnackbar(GetSnackBar(
        title: "has error",
      ));
    }
  }

  // تنفيذ التسجيل
  void signUp() async {
    await getToken();
    await getAccessToken();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    statusreqest = Statusreqest.loading;
    update();

    if (selectedDepartment.isNotEmpty && selectedRole.isNotEmpty) {
      try {
// إنشاء حساب مستخدم مع Firebase Auth
        userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
//أضف معلومات المستخدم إلى قاعدة بيانات Firebase
        addUserData();
// إرسال الرمز إلى رقم الهاتف
        verifyPhoneNumber();
        //الذهاب إلى صفحة OTP
        goToOTPPage();
// أضف دور المستخدم إلى قاعدة البيانات المحلية
        saveUserRoleShared();

        statusreqest = Statusreqest.success;
        update();
        Get.toNamed(Approutes.oTPVerificationPage);
        update();
      } on FirebaseAuthException catch (e) {
        statusreqest = Statusreqest.success;
        update();
// تنظيم أخطاء Firebase
        return handling_login_errors(e);
      } catch (e) {
        Get.showSnackbar(GetSnackBar(
          message: "خطأ",
          title: e.toString(),
        ));
        statusreqest = Statusreqest.parsingError;
        update();
      }
    } else {
      Get.showSnackbar(GetSnackBar(
        message: "plese select your role and depertment",
      ));
    }
  }

  gotomap() {
    Get.toNamed(Approutes.addlocationfrommap);
  }

  // add user data to firebase after sign up
  @override
  addUserData() {
    userUid = userCredential!.user!.uid;
    String email = emailController.text.trim();
    String userName = usernameController.text.trim();
    String phoneNumber = phoneNumberController.text.trim();
    String location = locationController.text.trim();
    selectDepartment();
    selectRoler();
    String department = selectedDepartment.value;
    String role = selectedRole.value;
    try {
      userData.addUserData(
          userUid!,
          userName,
          email,
          role,
          department,
          phoneNumber,
          location,
          userToken!,
          userAccessToken!,
          userImage ??
              "https://th.bing.com/th/id/OIP.eMLmzmhAqRMxUZad3zXE5QHaHa?rs=1&pid=ImgDetMain&adlt=strict");
    } catch (e) {
      log(e.toString());
      statusreqest = Statusreqest.parsingError;
      update();
    }
  }

  @override
  goToOTPPage() {
    String phoneNumber = phoneNumberController.text.trim();

    Get.toNamed(Approutes.oTPVerificationPage, arguments: {
      "phoneNumber": phoneNumber,
      "verificationId": userVerificationId,
    });
  }

  @override
  verifyPhoneNumber() async {
    String phoneNumber = phoneNumberController.text.trim();
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {},
      verificationFailed: (FirebaseAuthException e) {
        Get.showSnackbar(GetSnackBar(message: e.message.toString()));
      },
      codeSent: (String verificationId, int? resendToken) {
        userVerificationId = verificationId;
        log(userVerificationId!);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      timeout: const Duration(seconds: 60),
    );
  }

// save user role with shared preferences
  @override
  saveUserRoleShared() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(Appshareds.role);
    await prefs.remove(Appshareds.userUid);
    await prefs.setString(Appshareds.role, selectedRole.value);
    await prefs.setString(Appshareds.department, selectedDepartment.value);
  }

  @override
  getToken() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    userToken = await messaging.getToken();
  }

  @override
  getAccessToken() async {
    userAccessToken = await get_access_token();
  }

  @override
  selectDepartment() {
    String department = selectedDepartment.value;

    final List department_tr = [
      "Electrical Engineering".tr,
      "Mechanic Engineering".tr,
      "Electronic Engineering (Low voltage)".tr,
      "Civil Engineering".tr,
    ];

    final Map department_en = {
      "Electrical Engineering".tr: "Electrical Engineering",
      "Mechanic Engineering".tr: "Mechanic Engineering",
      "Electronic Engineering (Low voltage)".tr:
          "Electronic Engineering (Low voltage)",
      "Civil Engineering".tr: "Civil Engineering",
    };

    for (var _department in department_tr) {
      if (department == _department) {
        selectedDepartment.value = department_en[_department];
      }
    }
  }

  @override
  selectRoler() {
    String role = selectedRole.value;

    final List role_tr = [
      "User".tr,
      "Engineer".tr,
      "Contractor".tr,
      "Admin".tr
    ];

    final Map role_en = {
      "User".tr: "User",
      "Engineer".tr: "Engineer",
      "Contractor".tr: "Contractor",
      "Admin".tr: "Admin"
    };

    for (var _role in role_tr) {
      if (role == _role) {
        selectedRole.value = role_en[_role];
      }
    }
  }
}
