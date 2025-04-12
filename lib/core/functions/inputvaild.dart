import 'package:get/get.dart';

String? inputValid(String type, int max, int min, String val) {
  // تحقق من أن القيمة ليست فارغة
  if (val.isEmpty) {
    return "This field cannot be empty".tr;
  }

  // التحقق من النوع
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "Invalid username".tr;
    }
  } else if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "Invalid email".tr;
    }
  } else if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "Invalid phone number".tr;
    }
  } else if (type == "password") {
    if (val.length < min) {
      return "$min" "Password must be at least characters".tr;
    }
    if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$').hasMatch(val)) {
      return "Password must contain letters and numbers".tr;
    }
  }

  // التحقق من الطول
  if (val.length > min) {
    return "$min" "Value cannot be greater than characters".tr;
  }
  if (val.length < max) {
    return "$min" "Value cannot be less than characters".tr;
  }

  return null; // إذا كانت كل الشروط مستوفاة
}
