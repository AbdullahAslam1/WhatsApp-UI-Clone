import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whatsapp_ui_clone/OTP_screen/OTP_screen.dart';
import 'package:whatsapp_ui_clone/Widgets/ui_helper.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phone_controller = TextEditingController();
  String selected_country = "Pakistan";

  final List<String> countries = [
    'Afghanistan',
    'Argentina',
    'Australia',
    'Bangladesh',
    'Brazil',
    'Canada',
    'China',
    'Egypt',
    'France',
    'Germany',
    'India',
    'Indonesia',
    'Iran',
    'Iraq',
    'Italy',
    'Japan',
    'Malaysia',
    'Nepal',
    'Netherlands',
    'New Zealand',
    'Pakistan',
    'Qatar',
    'Russia',
    'Saudi Arabia',
    'South Africa',
    'South Korea',
    'Spain',
    'Sri Lanka',
    'Turkey',
    'UAE',
    'UK',
    'USA',
    'Vietnam',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            UiHelper.CustomText(
              text: "Enter your phone number",
              height: 20,
              weight: FontWeight.w700,
              color: Color(0XFF00A884),
            ),
            SizedBox(height: 40),
            UiHelper.CustomText(
              text: "WhatsApp will need to verify your phone",
              height: 16,
            ),
            UiHelper.CustomText(
              text: "number. Carrier charges may apply.",
              height: 16,
            ),
            UiHelper.CustomText(
              text: "What’s my number?",
              height: 16,
              color: Color(0XFF00A884),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(left: 60, right: 60),
              child: DropdownButtonFormField(
                items: countries.map((String country) {
                  return DropdownMenuItem(child: Text(country), value: country);
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selected_country = newValue!;
                  });
                },
                value: selected_country,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0XFF00A884)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0XFF00A884)),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 35,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "+92",
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0XFF00A884)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0XFF00A884)),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0XFF00A884)),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 200,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: phone_controller,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0XFF00A884)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: UiHelper.CustomButton(
        callback: () {
          login(phone_controller.text.toString());
        },
        bottonName: "Next",
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  login(String phoneNumber) {
    if (phoneNumber == "") {
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Enter your phone number"),
          backgroundColor: Color(0XFF00A884),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OTP_Screen(phone_number: phoneNumber),
        ),
      );
    }
  }
}
