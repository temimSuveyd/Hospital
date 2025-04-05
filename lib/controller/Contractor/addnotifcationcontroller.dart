import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/model/notificationmodel.dart';

class AddNotificationController extends GetxController {
  final titleController = TextEditingController();
  final messageController = TextEditingController();
  final status = 'new'.obs; // الحالة الافتراضية

  final List<String> statusOptions = ['new', 'in_progress', 'completed'];

  // وظيفة لإضافة الإشعار
  void addNotification() {
    if (titleController.text.isEmpty || messageController.text.isEmpty) {
      Get.snackbar('Error', 'All fields are required'.tr,
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    final newNotification = NotificationModel(
      id: DateTime.now().millisecondsSinceEpoch,
      title: titleController.text,
      message: messageController.text,
      date: DateTime.now().toString().split(' ')[0],
      status: status.value,
      isRead: false,
    );

    // محاكاة الحفظ (يمكنك التعديل للحفظ في API أو قاعدة البيانات)
    print('Notification Added: ${newNotification.title}');

    Get.back();
    Get.snackbar('Success', 'Notification added successfully'.tr,
        snackPosition: SnackPosition.BOTTOM);
  }

  @override
  void onClose() {
    titleController.dispose();
    messageController.dispose();
    super.onClose();
  }
}
