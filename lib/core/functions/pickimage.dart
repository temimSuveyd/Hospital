import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

/// 📷 التقاط صورة من الكاميرا
Future<File?> uploadImageFromCamera() async {
  try {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 90);
    if (file != null) {
      return File(file.path);
    }
  } catch (e) {
    Get.showSnackbar(GetSnackBar(
      title: "Worng!".tr,
      message: "Error while selecting the image".tr,
    ));
  }
  return null;
}

/// 🖼️ اختيار صورة من المعرض
Future<File?> uploadImageFromGallery({bool isSvg = true}) async {
  try {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions:
          isSvg ? ["svg", "SVG"] : ["png", "PNG", "jpg", "jpeg", "gif"],
    );

    if (result != null && result.files.single.path != null) {
      return File(result.files.single.path!);
    }
  } catch (e) {
    Get.showSnackbar(GetSnackBar(
      title: "Worng!".tr,
      message: "Error while selecting the image".tr,
    ));
  }
  return null;
}
