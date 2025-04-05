import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constant/color.dart';
import 'customactionbuttom.dart';

class Customrowicon extends StatelessWidget {
  final void Function() onPressedBilling;
  final void Function() onPressedOpen;
  final void Function() onPressedDelete;
  final IconData iconBilling;
  final IconData iconopen;
  final IconData iconDelete;
  const Customrowicon({
    super.key,
    required this.onPressedBilling,
    required this.onPressedOpen,
    required this.onPressedDelete,
    required this.iconBilling,
    required this.iconopen,
    required this.iconDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ActionButtonWidget(
          icon: iconBilling,
          label: 'Billing',
          color: Colors.blue,
          onPressed: onPressedBilling,
        ),
        ActionButtonWidget(
          icon: iconopen,
          label: 'Open',
          color: Colors.green,
          onPressed: onPressedOpen,
        ),
        ActionButtonWidget(
          icon: iconDelete,
          label: 'Delete',
          color: Colors.red,
          onPressed: onPressedDelete,
        ),
      ],
    );
  }
}
