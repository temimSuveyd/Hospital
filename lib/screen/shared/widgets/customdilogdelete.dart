import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteAccountDialog extends StatelessWidget {
  final VoidCallback onConfirm;

  const DeleteAccountDialog({Key? key, required this.onConfirm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Delete Account".tr),
      content: Text("Are you sure you want to delete your account?".tr),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: Text("Cancel".tr),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          onPressed: () {
            onConfirm();
            Get.back();
          },
          child: Text("Yes, Delete".tr, style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
