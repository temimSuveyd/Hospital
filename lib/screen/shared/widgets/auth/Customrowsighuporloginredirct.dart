import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hosptail/localization/changelocal.dart';

import '../../../../core/constant/color.dart';

class Customrowsighuporloginredirct extends StatelessWidget {
  final String textone;
  final String texttwo;
  final        void Function()? ontap;
  const Customrowsighuporloginredirct({super.key, required this.textone, required this.texttwo, this.ontap});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Localcontroller>( builder: (controller) =>Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(" $textone ", style: TextStyle(
          color:controller.isDarkMode?Colors.white: Colors.black,
          fontWeight: FontWeight.bold,
          fontFamily: "cairo"
        ),),
        GestureDetector(
          onTap:ontap,
          child: Text(
            " $texttwo",
            style: TextStyle(
              color:  Appcolor.secondcolor,
              fontWeight: FontWeight.bold,
                fontFamily: "cairo"
            ),
          ),
        ),
      ],
    ));
  }
}
