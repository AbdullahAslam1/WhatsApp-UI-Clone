import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp_ui_clone/Home/home_screen.dart';
import 'package:whatsapp_ui_clone/Widgets/ui_helper.dart';
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController name_controller = TextEditingController();

  File? picked_image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 60),
            UiHelper.CustomText(
              text: "Profile info",
              height: 16,
              weight: FontWeight.bold,
              color: Color(0XFF00A884),
            ),
            SizedBox(height: 20),
            UiHelper.CustomText(
              text: "Please provide your name and an optional",
              height: 14,
            ),
            UiHelper.CustomText(text: "profile photo", height: 14),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                _openBottom(context);
              },
              child: picked_image == null
                  ? CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.grey.shade300,
                      child: Image.asset(
                        "assets/images/photo-camera 1.png",
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    )
                  : CircleAvatar(
                      radius: 80,
                      backgroundImage: FileImage(picked_image!),
                    ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  child: TextField(
                    keyboardType: TextInputType.none,
                    controller: name_controller,
                    decoration: InputDecoration(
                      hintText: "Enter your profile name",
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0XFF00A884)),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0XFF00A884)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0XFF00A884)),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ImageIcon(AssetImage("assets/images/happy-face 1.png")),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: UiHelper.CustomButton(
        callback: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
            (route) => false,
          );
        },
        bottonName: "Next",
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  _openBottom(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: 200,
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Choose one for profile picture",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      _pickImage(ImageSource.camera);
                    },
                    icon: Icon(Icons.camera_alt, size: 60, color: Colors.grey),
                  ),
                  IconButton(
                    onPressed: () {
                      _pickImage(ImageSource.gallery);
                    },
                    icon: Icon(Icons.image, size: 60, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  _pickImage(ImageSource image_source) async {
    try {
      final photo = await ImagePicker().pickImage(source: image_source);
      if (photo == null) return;
      final temp_image = File(photo.path);
      Navigator.pop(context);
      setState(() {
        picked_image = temp_image;
      });
    } catch (ex) {
      return ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(ex.toString())));
    }
  }
}
