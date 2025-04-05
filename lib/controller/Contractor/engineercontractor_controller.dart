import 'package:get/get.dart';
import 'package:hosptail/core/constant/Approutes.dart';

class EngineercontractorController extends GetxController {
  List<Map<String, String>> engineers = [
    {
      "name": "المهندس أحمد",
      "email": "ahmed@example.com",
      "image": "asset/images/avatar.png",
      "details": "مهندس كهرباء بخبرة 10 سنوات",
    },
    {
      "name": "المهندس محمد",
      "email": "mohamed@example.com",
      "image": "asset/images/avatar.png",
      "details": "مهندس مدني متخصص في الإنشاءات",
    },
  ];
  gotocomplaintpage(){
    Get.toNamed(Approutes.adminDepartmentComplaint);
  }
}
