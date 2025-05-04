import 'package:chat_app/models/chat_message_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatInput extends StatelessWidget {
  Function(ChatMessageEntity) onSend;
  ChatInput({super.key, required this.onSend});

  final chatMessageController = TextEditingController();

  void onSendButtonPressed() {
    print("Message sent: ${chatMessageController.text}");
    final newChatMessage = ChatMessageEntity(
      id: "123",
      text: chatMessageController.text,
      createdAt: DateTime.now(),
      author: Author(username: FirebaseAuth.instance.currentUser!.email!),
      imageUrl: "https://shorturl.at/PkTiO",
    );
    onSend(newChatMessage);
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
            ),
          ),
          IconButton(
            onPressed: onSendButtonPressed,
            icon: Icon(Icons.send),
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
