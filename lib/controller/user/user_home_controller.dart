import 'package:get/get.dart';

class UserHomeController extends GetxController {
  var complaints = [].obs;

  void addComplaint() {
    Get.toNamed("/AddComplaintPage");
  }
}
