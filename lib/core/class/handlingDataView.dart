import 'package:flutter/material.dart';
import 'package:hosptail/core/class/statusreqest.dart';
import 'package:hosptail/core/constant/Appimageasset.dart';
import 'package:lottie/lottie.dart';

class Handlingdataview extends StatelessWidget {
  const Handlingdataview(
      {super.key, required this.widget, required this.statusreqest});

  final Widget widget;
  final Statusreqest statusreqest;

  @override
  Widget build(BuildContext context) {
    if (statusreqest == Statusreqest.loading) {
      return Center(child: LottieBuilder.asset(AppImagesasset.loading,width: 150,height: 150,fit: BoxFit.cover,));
    } else if (statusreqest == Statusreqest.parsingError) {
       return Center(child: LottieBuilder.asset(AppImagesasset.error,width: 200,height: 200,fit: BoxFit.cover,));
    } else if (statusreqest == Statusreqest.success) {
      return widget;
    } else if(statusreqest == Statusreqest.noData) {
      return Center(child: LottieBuilder.asset(AppImagesasset.noData,width:  300, fit: BoxFit.cover,));
    }else {
      return SizedBox();
    }
  }
}
