import 'package:flutter/material.dart';
import 'package:whatsapp_ui_clone/Home/calls_screen.dart';
import 'package:whatsapp_ui_clone/Home/camera_screen.dart';
import 'package:whatsapp_ui_clone/Home/chats_screen.dart';
import 'package:whatsapp_ui_clone/Home/status_screen.dart';
import 'package:whatsapp_ui_clone/Widgets/ui_helper.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.camera_alt)),
              Tab(text: "CHATS"),
              Tab(text: "STATUS"),
              Tab(text: "CALLS"),
            ],
            indicatorColor: Colors.white,
          ),
          toolbarHeight: 80,
          title: UiHelper.CustomText(
            text: "WhatsApp",
            height: 20,
            color: Colors.white,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: IconButton(
                onPressed: () {
                  // Handle search
                },
                icon: Image.asset("assets/images/Search.png"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: () {
                  // Handle more options
                  showMenu(
                    context: context,
                    position: RelativeRect.fromLTRB(1000, 80, 0, 0),
                    items: [
                      PopupMenuItem(child: Text("Settings")),
                      PopupMenuItem(child: Text("New Group")),
                      PopupMenuItem(child: Text("Logout")),
                    ],
                  );
                },
                icon: Icon(Icons.more_vert, color: Colors.white),
              ),
            ),
          ],
        ),
        body: TabBarView(
          children: [
            CameraScreen(),
            ChatsScreen(),
            StatusScreen(),
            CallsScreen(),
          ],
        ),
      ),
    );
  }
}
