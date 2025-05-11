import 'package:chat_app/models/chat_message_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatInput extends StatefulWidget {
  void Function(ChatMessageEntity message) onSendMessage;

  ChatInput({super.key, required this.onSendMessage});

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  bool isSendEenabled = false;

  final chatMessageController = TextEditingController();

  void onSendButtonPressed() async {
    print("Message sent: ${chatMessageController.text}");
    ChatMessageEntity newMessage = ChatMessageEntity(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: chatMessageController.text,
      createdAt: DateTime.now(),
      author: Author(username: "User"),
      imageUrl: null,
    );
    try {
      await FirebaseFirestore.instance
          .collection("messages")
          .add(newMessage.toJson());
      widget.onSendMessage(newMessage);
      chatMessageController.clear();
    } catch (e) {
      print("Error sending message: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
            color: Colors.white,
          ),
          Expanded(
            child: TextField(
              controller: chatMessageController,
              style: TextStyle(color: Colors.white),
              keyboardType: TextInputType.multiline,
              minLines: 1,
              maxLines: 5,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                hintText: 'Type a message',
                hintStyle: TextStyle(color: Colors.blueGrey),
                border: InputBorder.none,
              ),
              onChanged: (value) {
                setState(() {
                  isSendEenabled = value.isNotEmpty;
                });
              },
            ),
          ),
          IconButton(
            onPressed: isSendEenabled ? onSendButtonPressed : null,
            icon: Icon(Icons.send),
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
