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
    var isAuther = chatMessageEntity.author.username == "Assaf";
    return Align(
      alignment: alignment,
      child: Container(
        constraints: BoxConstraints(
          maxWidth:
              MediaQuery.of(context).size.width *
              0.5, // Max 50% of screen width
        ),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(50),
        decoration: BoxDecoration(
          color: isAuther ? Colors.blue : Colors.black,
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
              Container(
                height: 120,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(chatMessageEntity.imageUrl!),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
