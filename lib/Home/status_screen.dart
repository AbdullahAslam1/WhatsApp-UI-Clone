import 'package:flutter/material.dart';
import 'package:whatsapp_ui_clone/Widgets/ui_helper.dart';

class StatusScreen extends StatelessWidget {
  var status_content = [
    {
      "img": "assets/images/img-1.jpg",
      "name": "Abdullah",
      "statustime": "15 min ago",
    },
    {
      "img": "assets/images/img-3.jpg",
      "name": "Ahmad",
      "statustime": "1 day ago",
    },
    {"img": "assets/images/img-2.jpg", "name": "Ali", "statustime": "1 hr ago"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 10),
          Row(
            children: [
              SizedBox(width: 25),
              UiHelper.CustomText(
                text: "Status",
                height: 20,
                weight: FontWeight.bold,
              ),
            ],
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: ListTile(
              leading: Stack(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                      "https://t4.ftcdn.net/jpg/05/89/93/27/360_F_589932782_vQAEAZhHnq1QCGu5ikwrYaQD0Mmurm0N.jpg",
                    ),
                  ),

                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: Color(0XFF00A884),
                      child: Icon(Icons.add, color: Colors.white, size: 10),
                    ),
                  ),
                ],
              ),
              title: UiHelper.CustomText(text: "My Status", height: 20),
              subtitle: UiHelper.CustomText(
                text: "Tap to add status update",
                height: 14,
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UiHelper.CustomText(text: "Recent updates", height: 14),
                Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
          SizedBox(height: 15),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(
                      status_content[index]["img"].toString(),
                    ),
                  ),
                  title: UiHelper.CustomText(
                    text: status_content[index]["name"].toString(),
                    height: 16,
                    weight: FontWeight.bold,
                  ),
                  subtitle: UiHelper.CustomText(
                    text: status_content[index]["statustime"].toString(),
                    height: 14,
                  ),
                );
              },
              itemCount: status_content.length,
            ),
          ),
        ],
      ),
    );
  }
}
