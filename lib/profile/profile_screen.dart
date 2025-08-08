import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp_ui_clone/Home/home_screen.dart';
import 'package:whatsapp_ui_clone/Widgets/ui_helper.dart';
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with WidgetsBindingObserver {
  TextEditingController name_controller = TextEditingController();
  File? picked_image;
  bool _keyboardVisible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    name_controller.dispose();
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
    if (mounted) {
      setState(() {
        _keyboardVisible = bottomInset > 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // Changed to false for better control
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 100,
          ),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 40),
                UiHelper.CustomText(
                  text: "Profile info",
                  height: 16,
                  weight: FontWeight.bold,
                  color: const Color(0XFF00A884),
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    UiHelper.CustomText(
                      text: "Please provide your name and an optional",
                      height: 14,
                    ),
                    UiHelper.CustomText(text: "profile photo", height: 14),
                  ],
                ),
                const SizedBox(height: 28),
                GestureDetector(
                  onTap: () => _openBottom(context),
                  child: picked_image == null
                      ? CircleAvatar(
                          radius: 70,
                          backgroundColor: Colors.grey.shade300,
                          child: Image.asset(
                            "assets/images/photo-camera 1.png",
                            height: 40,
                            fit: BoxFit.cover,
                          ),
                        )
                      : CircleAvatar(
                          radius: 70,
                          backgroundImage: FileImage(picked_image!),
                        ),
                ),
                const SizedBox(height: 19),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextField(
                    controller: name_controller,
                    decoration: InputDecoration(
                      hintText: "Enter your profile name",
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0XFF00A884)),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0XFF00A884)),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0XFF00A884)),
                      ),
                      suffixIcon: IconButton(
                        icon: Image.asset("assets/images/happy-face 1.png"),
                        onPressed: () {},
                      ),
                    ),
                    onTap: () {
                      // Immediate hide without animation
                      if (!_keyboardVisible) {
                        setState(() => _keyboardVisible = true);
                      }
                    },
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: _keyboardVisible
          ? null
          : UiHelper.CustomButton(
              callback: () {
                if (name_controller.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please enter your name"),
                      backgroundColor: Color(0XFF00A884),
                    ),
                  );
                  return;
                }
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

  void _openBottom(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Choose profile picture",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      IconButton(
                        onPressed: () => _pickImage(ImageSource.camera),
                        icon: const Icon(Icons.camera_alt, size: 40),
                      ),
                      const Text("Camera"),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () => _pickImage(ImageSource.gallery),
                        icon: const Icon(Icons.photo_library, size: 40),
                      ),
                      const Text("Gallery"),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final photo = await ImagePicker().pickImage(source: source);
      if (photo == null) return;
      final tempImage = File(photo.path);
      if (!mounted) return;
      Navigator.pop(context);
      setState(() => picked_image = tempImage);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to pick image: ${e.toString()}")),
      );
    }
  }
}
