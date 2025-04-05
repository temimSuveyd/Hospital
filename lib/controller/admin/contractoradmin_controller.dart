import 'package:get/get.dart';
import 'package:hosptail/core/class/statusreqest.dart';
import 'package:hosptail/core/constant/Approutes.dart';
import 'package:hosptail/data/dataScore/remote/user_data.dart';

abstract class ContractoradminController extends GetxController {
  initData();
  getContactorData();
  goToContactorComplaint(String userId,String userType);
}

class ContractoradminControllerImp extends ContractoradminController {
  List contractorsList = [];

  String? department;
  UserData userData = UserData();
  Statusreqest statusreqest = Statusreqest.success;

  @override
  initData() {
    department = Get.arguments["department"];
  }

  @override
  getContactorData() {
    statusreqest = Statusreqest.loading;
    update();

    try {
      userData.getAllContactorsData(department!).then((value) {
        contractorsList = value.docs;
        if (contractorsList.isEmpty) {
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
    getContactorData();
    super.onInit();
  }

  @override
  goToContactorComplaint(String contractorId,String userType) {
    Get.toNamed(Approutes.adminDepartmentComplaint, arguments: {
      "id": contractorId,
      "userType" : userType,
    });
  }
}
