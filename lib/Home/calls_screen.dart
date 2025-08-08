import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whatsapp_ui_clone/Widgets/ui_helper.dart';

class CallsScreen extends StatelessWidget {
  var callContent = [
    {
      "name": "Ahmad",
      "img": "assets/images/img-1.jpg",
      "calltime": "15 min ago",
    },
    {"name": "Qasim", "img": "assets/images/img-2.jpg", "calltime": "1 hr ago"},
    {
      "name": "Ayesha",
      "img": "assets/images/img-4.jpg",
      "calltime": "1 day ago",
    },
    {
      "name": "Uzair",
      "img": "assets/images/img-3.jpg",
      "calltime": "15 min ago",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 10),
          Row(
            children: [
              SizedBox(width: 20),
              UiHelper.CustomText(text: "Recent Calls", height: 16),
            ],
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey,
                thickness: 0.5,
                indent: 75,
                endIndent: 10,
              ),
              itemCount: callContent.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(
                      callContent[index]["img"].toString(),
                    ),
                  ),
                  title: UiHelper.CustomText(
                    text: callContent[index]["name"].toString(),
                    height: 16,
                    weight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  subtitle: UiHelper.CustomText(
                    text: callContent[index]["calltime"].toString(),
                    height: 12,
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.call, color: Color(0XFF00A884)),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
