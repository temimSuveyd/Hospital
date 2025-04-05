import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hosptail/core/constant/Approutes.dart';

abstract class DepartmentsadminController extends GetxController {
//

  goToEngineers(String department);
  goToContactor(String department);
}

class DepartmentsadminControllerImp extends DepartmentsadminController {
  @override
  goToEngineers(String department) {
    Get.toNamed(Approutes.adminEngineers, arguments: {
      "department": department,
    });
  }

  @override
  goToContactor(String department) {
    Get.toNamed(Approutes.adminContractors, arguments: {
      "department": department,
    });
  }
}
