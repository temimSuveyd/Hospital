import 'package:get/get.dart';
import 'package:hosptail/core/constant/Approutes.dart';
import '../../data/model/notificationmodel.dart';


class NotificationContractorController extends GetxController {
  var notifications = <NotificationModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchNotifications();
  }

  // Simulate fetching notifications from an API
  void fetchNotifications() {
    notifications.assignAll([
      NotificationModel(
        id: 1,
        title: "new_maintenance_request".tr,
        message: "maintenance_request_sent".tr,
        date: "2023-11-20",
        status: "New".tr, // New status
        isRead: false,
      ),
      NotificationModel(
        id: 2,
        title: "maintenance_appointment_confirmation".tr,
        message: "appointment_confirmed".tr,
        date: "2023-11-18",
        status: "in_progress".tr, // In-progress status
        isRead: true,
      ),
      NotificationModel(
        id: 3,
        title: "maintenance_completed".tr,
        message: "maintenance_success".tr,
        date: "2023-11-15",
        status: "completed".tr, // Completed status
        isRead: true,
      ),
    ]);
  }
  /////////////////
  //////////////////
gotoaddnotification(){
    Get.toNamed(Approutes.contractorAddNotification);
}
//////////////////
  // Mark a notification as read
  void markAsRead(int id) {
    final index = notifications.indexWhere((n) => n.id == id);
    if (index != -1) {
      notifications[index].isRead = true;
      notifications.refresh();
    }
  }
  goToNotificationDetails(NotificationModel notification) {
    notification.isRead = true;
    notifications.refresh();
    Get.toNamed(Approutes.contractorNotificationDetails, arguments: {"notification":notification});
  }
  // Clear all notifications
  void clearNotifications() {
    notifications.clear();
  }

  // Get unread notifications count
  int get unreadCount => notifications.where((n) => !n.isRead).length;
}
