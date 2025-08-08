import 'package:flutter/material.dart';
import 'package:whatsapp_ui_clone/Widgets/ui_helper.dart';

class ContactScreen extends StatelessWidget {
  var contactContent = [
    {"img": "assets/images/img-1.jpg", "name": "Ahmad", "status": "Busy"},
    {"img": "assets/images/img-4.jpg", "name": "Ayesha", "status": "Cool"},
    {"img": "assets/images/img-3.jpg", "name": "Qasim", "status": "Cool"},
    {"img": "assets/images/img-2.jpg", "name": "Uzair", "status": "Busy"},
    {"img": "assets/images/img-1.jpg", "name": "Abdullah", "status": "Cool"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        title: UiHelper.CustomText(
          text: "Select Contact",
          height: 16,
          color: Colors.white,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_sharp)),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          ListTile(
            leading: CircleAvatar(
              radius: 20,
              backgroundColor: Color(0XFF00A884),
              child: Image(
                image: AssetImage("assets/images/group.png"),
                height: 17,
                color: Colors.white,
              ),
            ),
            title: UiHelper.CustomText(
              text: "New Group",
              height: 16,
              weight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),

          ListTile(
            leading: CircleAvatar(
              radius: 20,
              backgroundColor: Color(0XFF00A884),
              child: Image(
                image: AssetImage("assets/images/add-contact.png"),
                height: 17,
                color: Colors.white,
              ),
            ),
            title: UiHelper.CustomText(
              text: "New Contact",
              height: 16,
              weight: FontWeight.bold,
              color: Colors.black,
            ),
            trailing: Icon(Icons.qr_code, color: Colors.black),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                      contactContent[index]["img"].toString(),
                    ),
                  ),
                  title: UiHelper.CustomText(
                    text: contactContent[index]["name"].toString(),
                    height: 16,
                    weight: FontWeight.bold,
                    color: Color(0XFF000000),
                  ),
                  subtitle: UiHelper.CustomText(
                    text: contactContent[index]["status"].toString(),
                    height: 14,
                  ),
                );
              },
              itemCount: contactContent.length,
            ),
          ),
        ],
      ),
    );
  }
}
