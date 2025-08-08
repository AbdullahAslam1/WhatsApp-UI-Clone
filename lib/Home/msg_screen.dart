import 'package:flutter/material.dart';
import 'package:whatsapp_ui_clone/Widgets/ui_helper.dart';

class MessageScreen extends StatefulWidget {
  final String name;
  final String profileImage; // asset path or http url
  final String? initialMessage;
  final String? msgTime; // example: "10:45 PM"

  const MessageScreen({
    Key? key,
    required this.name,
    required this.profileImage,
    this.initialMessage,
    this.msgTime,
  }) : super(key: key);

  @override
  State<MessageScreen> createState() => _ChatScreenState();
}

class Message {
  final String text;
  final bool isMe;
  final String time; // store as formatted string ("10:45 PM")

  Message({required this.text, required this.isMe, required this.time});
}

class _ChatScreenState extends State<MessageScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  List<Message> messages = [];

  @override
  void initState() {
    super.initState();

    // If an initial message is provided, add it as a received message with given time
    if (widget.initialMessage != null && widget.initialMessage!.isNotEmpty) {
      messages.add(
        Message(
          text: widget.initialMessage!,
          isMe: false,
          time: widget.msgTime ?? "",
        ),
      );
    }

    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
  }

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      messages.add(
        Message(text: text, isMe: true, time: _getCurrentTimeString()),
      );
      _controller.clear();
    });

    Future.delayed(const Duration(milliseconds: 100), _scrollToBottom);
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );
    }
  }

  String _getCurrentTimeString() {
    final now = DateTime.now();
    final h = now.hour % 12 == 0 ? 12 : now.hour % 12;
    final m = now.minute.toString().padLeft(2, '0');
    final ampm = now.hour >= 12 ? 'PM' : 'AM';
    return '$h:$m $ampm';
  }

  ImageProvider _getImageProvider(String path) {
    if (path.startsWith('http')) {
      return NetworkImage(path);
    } else {
      return AssetImage(path);
    }
  }

  Widget _buildBubble(Message msg) {
    const double radius = 12.0;
    return Align(
      alignment: msg.isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
            color: msg.isMe ? const Color(0xFFDCF8C6) : Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(radius),
              topRight: const Radius.circular(radius),
              bottomLeft: Radius.circular(msg.isMe ? radius : 0),
              bottomRight: Radius.circular(msg.isMe ? 0 : radius),
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 1,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(msg.text, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 6),
              Text(
                msg.time,
                style: TextStyle(fontSize: 10, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF075E54),
        titleSpacing: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: _getImageProvider(widget.profileImage),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UiHelper.CustomText(
                  text: widget.name,
                  height: 16,
                  weight: FontWeight.bold,
                  color: Colors.white,
                ),
                const SizedBox(height: 2),
                UiHelper.CustomText(
                  text: "Online",
                  height: 12,
                  color: Colors.white70,
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.videocam)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                reverse: true,
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 8,
                ),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final msg = messages[messages.length - 1 - index];
                  return _buildBubble(msg);
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              color: Colors.grey.shade100,
              child: Row(
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration(
                        hintText: "Type a message",
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onSubmitted: (_) => _sendMessage(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  CircleAvatar(
                    backgroundColor: const Color(0xFF075E54),
                    child: IconButton(
                      icon: const Icon(Icons.send, color: Colors.white),
                      onPressed: _sendMessage,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
