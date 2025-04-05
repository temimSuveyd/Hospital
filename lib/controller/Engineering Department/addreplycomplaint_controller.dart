import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hosptail/data/model/complaint_model.dart';

class AddreplycomplaintController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  RxString selectedCategory = ''.obs;
  RxString selectedLocation = ''.obs;
  final formKey = GlobalKey<FormState>();

  List<String> categories = ["Electrical Engineering", "Mechanic  Engineering", "Electronic Engineering","Civil Engineering"];
  List<String> locations = ["a", "b", "c", "d"];

  void submitComplaint() {
    Get.snackbar("Success", "Complaint Submitted Successfully",
        snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green, colorText: Colors.white);
  }

}

