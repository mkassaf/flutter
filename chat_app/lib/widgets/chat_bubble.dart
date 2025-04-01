import 'package:flutter/material.dart';
import 'package:chat_app/models/chat_message_entity.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessageEntity chatMessageEntity;
  final Alignment alignment;
  const ChatBubble({
    super.key,
    required this.chatMessageEntity,
    required this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        //TODO: Fix the chat bubble width
        padding: EdgeInsets.all(24),
        margin: EdgeInsets.all(50),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              chatMessageEntity.text,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            if (chatMessageEntity.imageUrl != null)
              Image.network(chatMessageEntity.imageUrl!, height: 120),
          ],
        ),
      ),
    );
  }
}
