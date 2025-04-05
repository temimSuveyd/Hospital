import 'package:get/get.dart';
import 'package:hosptail/core/class/statusreqest.dart';
import 'package:hosptail/core/constant/Approutes.dart';
import 'package:hosptail/data/dataScore/remote/user_data.dart';

abstract class EngineerController extends GetxController {
  initData();
  getEngineersData();
  goToEngineerComplaint(String userId,String userType);
}

class EngineerControllerImp extends EngineerController {
  List engineersList = [];

  String? department;
  UserData userData = UserData();
  Statusreqest statusreqest = Statusreqest.success;

  @override
  initData() {
    department = Get.arguments["department"];
  }

  @override
  getEngineersData() {
    statusreqest = Statusreqest.loading;
    update();

    try {
      userData.getAllEngineersData(department!).then((value) {
        engineersList = value.docs;
        if (engineersList.isEmpty) {
          statusreqest = Statusreqest.noData;
          update();
        } else {
          statusreqest = Statusreqest.success;
          update();
        }
      });
    } catch (e) {
      statusreqest = Statusreqest.parsingError;
      update();
    }
  }

  @override
  void onInit() {
    initData();
    getEngineersData();
    super.onInit();
  }

  @override
  goToEngineerComplaint(String engineerId,String userType) {
    Get.toNamed(Approutes.adminDepartmentComplaint, arguments: {
      "id": engineerId,
      "userType":userType,
    });
  }
}
