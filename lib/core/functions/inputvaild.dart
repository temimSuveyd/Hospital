import 'package:get/get.dart';

String? inputValid(String type, int max, int min, String val) {
  // تحقق من أن القيمة ليست فارغة
  if (val.isEmpty) {
    return "هذا الحقل لا يمكن أن يكون فارغًا";
  }

  // التحقق من النوع
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "اسم المستخدم غير صالح";
    }
  } else if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "البريد الإلكتروني غير صالح";
    }
  } else if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "رقم الهاتف غير صالح";
    }
  } else if (type == "password") {
    if (val.length < min) {
      return "كلمة المرور يجب أن تكون على الأقل $min حرفًا";
    }
    if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$').hasMatch(val)) {
      return "كلمة المرور يجب أن تحتوي على أحرف وأرقام";
    }
  }

  // التحقق من الطول
  if (val.length < min) {
    return "القيمة لا يمكن أن تكون أقل من $min حرفًا";
  }
  if (val.length > max) {
    return "القيمة لا يمكن أن تكون أكبر من $max حرفًا";
  }

  return null; // إذا كانت كل الشروط مستوفاة
}
