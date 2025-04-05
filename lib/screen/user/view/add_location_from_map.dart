
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:hosptail/screen/shared/widgets/customappbarapp.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

import '../../../controller/user/add_location_from_map_controller.dart';
import '../../../core/constant/color.dart';
import '../../shared/widgets/locationbottom.dart';



class Addlocationfrommap extends StatelessWidget {
  const Addlocationfrommap({super.key});

  @override
  Widget build(BuildContext context) {
    final  Addlocationfrommapcontroller controller = Get.put( Addlocationfrommapcontroller());

    return Scaffold(
      appBar:CustomAppBarApp(title:"إضافة عنوان") ,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.goToNextPage();
          print("العنوان المحدد: ${controller.currentLocation}");
        },
        child: Icon(Icons.arrow_forward_ios_outlined,color: Appcolor.white,),
      ),
      body: GetBuilder< Addlocationfrommapcontroller>(
        builder: (controller) => Column(
          children: [
            Expanded(
              child: FlutterMap(
                options: MapOptions(
                  center: controller.currentLocation,
                  zoom: 13.0,
                  onTap: (tapPosition, newLocation) {
                    controller.updateLocation(newLocation);
                  },
                ),
                children: [
                  TileLayer(
                    urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c'],
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        width: 80.0,
                        height: 80.0,
                        point: controller.currentLocation,
                        child: Icon(Icons.location_pin, color: Colors.red, size: 40),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            LocationButton(
              onPressed: () async {
                await controller.getCurrentLocation(); // The controller method for fetching location
              },
            )

            ,
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
