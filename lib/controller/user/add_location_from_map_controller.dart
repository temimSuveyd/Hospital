
import 'package:get/get.dart';
import 'package:hosptail/core/constant/Approutes.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

class Addlocationfrommapcontroller extends GetxController {
  LatLng currentLocation = LatLng(30.0444, 31.2357); // الموقع الافتراضي (القاهرة)
  // حالة الطلب

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(milliseconds: 500), () {
      getCurrentLocation();
    }); // استدعاء الموقع عند بدء تشغيل الصفحة
  }

  Future<void> getCurrentLocation() async {
    try {

      // بدء التحميل
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        Get.snackbar("خطأ", "خدمات الموقع غير مفعلة");


        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          Get.snackbar("خطأ", "تم رفض إذن الوصول إلى الموقع");


          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        Get.snackbar("خطأ", "إذن الموقع مرفوض نهائيًا، يرجى تغييره من الإعدادات");

        return;
      }

      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      currentLocation = LatLng(position.latitude, position.longitude);


      update();
    } catch (e) {

      Get.snackbar("خطأ", "حدث خطأ أثناء جلب الموقع");
    }
  }

  void updateLocation(LatLng newLocation) {
    currentLocation = newLocation;
    update();
  }

  void goToNextPage() {
    Get.toNamed(Approutes.sighup, arguments: {
      'latitude': currentLocation.latitude,
      'longitude': currentLocation.longitude,
    });
  }
}
