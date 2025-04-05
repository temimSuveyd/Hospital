import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogoutDialog extends StatelessWidget {
  final VoidCallback onConfirm;

  const LogoutDialog({Key? key, required this.onConfirm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Logout".tr),
      content: Text("Are you sure you want to logout?".tr),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: Text("Cancel".tr),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
          onPressed: () {
            onConfirm();
            Get.back();
          },
          child: Text("Logout".tr, style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
