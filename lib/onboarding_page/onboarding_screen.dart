import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whatsapp_ui_clone/Login/login_screen.dart';
import 'package:whatsapp_ui_clone/Widgets/ui_helper.dart';

class OnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/boarding.png"),
            SizedBox(height: 20),
            UiHelper.CustomText(
              text: "Welcome to WhatsApp",
              height: 20,
              weight: FontWeight.normal,
              color: Color(0XFF000000),
            ),
            SizedBox(height: 10),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(fontSize: 14, color: Colors.black),
                children: [
                  TextSpan(text: "Read out "),
                  TextSpan(
                    text: "Privacy policy ",
                    style: TextStyle(color: Color(0XFF0C42CC)),
                  ),
                  TextSpan(text: "Tap ''Agree and Continue'' \n"),
                  TextSpan(text: "to accept the "),
                  TextSpan(
                    text: "Terms of Service",
                    style: TextStyle(color: Color(0XFF0C42CC)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: UiHelper.CustomButton(
        callback: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        },
        bottonName: "Agree and Continue",
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
