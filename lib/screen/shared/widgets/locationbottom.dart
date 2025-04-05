
import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class LocationButton extends StatelessWidget {
  final Future<void> Function() onPressed;

  const LocationButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        ElevatedButton.icon(
          onPressed: onPressed, // Handles the onPressed action passed from outside
          icon: Icon(
            Icons.my_location,
            size: 28, // Increased icon size
            color: Colors.white, // Icon color
          ),
          label: Text(
            "استخدم موقعي الحالي",
            style: TextStyle(
              fontSize: 16, // Font size adjustment
              fontWeight: FontWeight.w600, // Font weight
              color: Colors.white, // Text color
            ),
          ),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: Appcolor.primarycolor, // Text and icon color when the button is pressed
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 24), // Padding around the button
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30), // Rounded corners
            ),
            elevation: 5, // Elevation for shadow effect
            shadowColor: Colors.blue.withOpacity(0.3), // Shadow color for elevation
          ),
        ),
      ],
    );
  }
}
