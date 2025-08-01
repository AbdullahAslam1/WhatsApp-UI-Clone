import 'package:flutter/material.dart';

class UiHelper {
  static CustomButton({
    required VoidCallback callback,
    required String bottonName,
  }) {
    return SizedBox(
      height: 35,
      width: 350,

      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(40),
          ),
        ),
        child: Text(
          bottonName,
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
      ),
    );
  }

  static CustomText({
    required String text,
    required double height,
    Color? color,
    FontWeight? weight,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: height,
        color: color ?? Color(0XFF5E5E5E),
        fontWeight: weight,
      ),
    );
  }
}
