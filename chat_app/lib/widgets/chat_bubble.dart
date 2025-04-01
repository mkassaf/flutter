import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final Alignment alignment;
  final String? imageUrl;
  final String authorName;
  //TODO: Create a class model for the chat bubble
  const ChatBubble({
    super.key,
    required this.message,
    this.imageUrl,
    required this.authorName,
    required this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
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
            Text(message, style: TextStyle(fontSize: 20, color: Colors.white)),
            Image.network(imageUrl!, height: 120),
          ],
        ),
      ),
    );
  }
}
