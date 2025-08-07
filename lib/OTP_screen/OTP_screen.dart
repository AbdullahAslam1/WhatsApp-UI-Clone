import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whatsapp_ui_clone/Widgets/ui_helper.dart';
import 'package:whatsapp_ui_clone/profile/profile_screen.dart';

// ignore: must_be_immutable
class OTP_Screen extends StatelessWidget {
  String phone_number;
  OTP_Screen({required this.phone_number});

  TextEditingController otp1_controller = TextEditingController();
  TextEditingController otp2_controller = TextEditingController();
  TextEditingController otp3_controller = TextEditingController();
  TextEditingController otp4_controller = TextEditingController();
  TextEditingController otp5_controller = TextEditingController();
  TextEditingController otp6_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 80),
            UiHelper.CustomText(
              text: "Verifying your number",
              height: 16,
              color: Color(0XFF00A884),
              weight: FontWeight.w800,
            ),
            SizedBox(height: 40),
            UiHelper.CustomText(
              text: "You've tried to register +92-${phone_number}",
              height: 14,
            ),
            // SizedBox(height: 10),
            UiHelper.CustomText(
              text: "recently. Wait before requesting an sms or a call.",
              height: 14,
            ),
            // SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UiHelper.CustomText(text: "with your code. ", height: 14),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: UiHelper.CustomText(
                    text: "Wrong number?",
                    height: 14,
                    color: Color(0XFF00A884),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UiHelper.custom_container(otp1_controller),
                SizedBox(width: 10),
                UiHelper.custom_container(otp2_controller),
                SizedBox(width: 10),
                UiHelper.custom_container(otp3_controller),
                SizedBox(width: 10),
                UiHelper.custom_container(otp4_controller),
                SizedBox(width: 10),
                UiHelper.custom_container(otp5_controller),
                SizedBox(width: 10),
                UiHelper.custom_container(otp6_controller),
              ],
            ),
            SizedBox(height: 30),
            UiHelper.CustomText(
              text: "Didn't recieve code?",
              height: 14,
              color: Color(0XFF00A884),
            ),
          ],
        ),
      ),
      floatingActionButton: UiHelper.CustomButton(
        callback: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfileScreen()),
          );
        },
        bottonName: "Next",
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
