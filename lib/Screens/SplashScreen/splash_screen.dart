import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whatsapp_ui_clone/Widgets/ui_helper.dart';
import 'package:whatsapp_ui_clone/onboarding_page/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnBoardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/whatsapp-1.png"),
            SizedBox(height: 10),
            UiHelper.CustomText(
              text: "Whatsapp",
              height: 18,
              weight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
