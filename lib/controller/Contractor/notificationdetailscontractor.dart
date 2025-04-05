import 'package:get/get.dart';
import '../../data/model/notificationmodel.dart';

class NotificationDetailsController extends GetxController {
   NotificationModel? notification;

  @override
  void onInit() {
    super.onInit();
    // استلام الإشعار من Get.arguments
   notification=Get.arguments["notification"];
  }

  // دالة لإرسال الرد
  void sendReply(String message) {
    if (message.isEmpty) {
      Get.snackbar("خطأ", "الرد فارغ");
      return;
    }
    // تنفيذ عملية الرد (مثل الاتصال بـ API أو تحديث البيانات)
    print("إرسال الرد: $message");
    Get.snackbar("نجاح", "تم إرسال الرد بنجاح");
  }
}
