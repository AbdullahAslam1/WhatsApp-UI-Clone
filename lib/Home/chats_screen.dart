import 'package:flutter/material.dart';
import 'package:whatsapp_ui_clone/Widgets/ui_helper.dart';

class ChatsScreen extends StatelessWidget {
  var arrContent = [
    {
      "images": "assets/images/img-1.jpg",
      "name": "Ahmad",
      "lastmsg": "Hey! Are we still on for tonight?",
      "time": "10:45 PM",
      "msg": "2",
    },
    {
      "images": "assets/images/img-2.jpg",
      "name": "Ali",
      "lastmsg": "I'll send the files by morning.",
      "time": "8:22 AM",
      "msg": "4",
    },
    {
      "images": "assets/images/img-3.jpg",
      "name": "Qasim",
      "lastmsg": "That meme was hilarious 😂",
      "time": "3:18 PM",
      "msg": "1",
    },
    {
      "images": "assets/images/img-4.jpg",
      "name": "Abdullah",
      "lastmsg": "Let me know once you reach.",
      "time": "6:05 PM",
      "msg": "1",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 10), // Added vertical padding
        itemCount: arrContent.length,
        separatorBuilder: (context, index) => Divider(
          thickness: 0.5,
          indent: 75, // WhatsApp style divider indentation
          endIndent: 10,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 8,
            ), // Horizontal + vertical padding
            child: ListTile(
              contentPadding:
                  EdgeInsets.zero, // Remove internal ListTile padding
              leading: CircleAvatar(
                radius: 26,
                backgroundImage: AssetImage(
                  arrContent[index]["images"].toString(),
                ),
              ),
              title: UiHelper.CustomText(
                text: arrContent[index]["name"].toString(),
                height: 14,
                weight: FontWeight.bold,
                color: Colors.black,
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: UiHelper.CustomText(
                  text: arrContent[index]["lastmsg"].toString(),
                  height: 13,
                  color: Color(0XFF889095),
                ),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UiHelper.CustomText(
                    text: arrContent[index]["time"].toString(),
                    height: 11,
                    color: Color(0XFF026500),
                    weight: FontWeight.bold,
                  ),
                  SizedBox(height: 6),
                  CircleAvatar(
                    radius: 11,
                    backgroundColor: Color(0XFF026500),
                    child: UiHelper.CustomText(
                      text: arrContent[index]["msg"].toString(),
                      height: 10,
                      weight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: CircleAvatar(
        radius: 30,
        backgroundColor: Color(0XFF00A884),
        child: Image.asset("assets/images/mode_comment_black_24dp 1.png"),
      ),
    );
  }
}
