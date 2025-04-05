import 'package:get/get.dart';

import '../../data/model/complaint_model.dart';

class ComplaintreplysController extends GetxController {
  List<ComplaintModel>? complaints ;



  String selectedReply = "No reply yet"; // رد افتراضي

  void updateReply(String reply) {
    selectedReply = reply;
    update(); // تحديث الواجهة
  }
}
