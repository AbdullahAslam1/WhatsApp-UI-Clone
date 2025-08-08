import 'package:flutter/material.dart';
import 'camera_screen.dart'; // Import the camera screen
import 'chats_screen.dart';
import 'status_screen.dart';
import 'calls_screen.dart';
import 'package:whatsapp_ui_clone/Widgets/ui_helper.dart'; // Assuming this is your UiHelper

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 1);

    _tabController.addListener(() {
      if (_tabController.index == 0 && _tabController.indexIsChanging) {
        // Camera tab clicked → open CameraScreen
        _tabController.index = 1; // Stay on Chats after returning
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const CameraScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
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
                  items: const [
                    PopupMenuItem(child: Text("Settings")),
                    PopupMenuItem(child: Text("New Group")),
                    PopupMenuItem(child: Text("Logout")),
                  ],
                );
              },
              icon: const Icon(Icons.more_vert, color: Colors.white),
            ),
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          SizedBox.shrink(), // Empty for Camera Tab (handled manually)
          ChatsScreen(),
          StatusScreen(),
          CallsScreen(),
        ],
      ),
    );
  }
}
