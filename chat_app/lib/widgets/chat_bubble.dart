import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/models/chat_message_entity.dart';

class ChatBubble extends StatefulWidget {
  ChatMessageEntity chatMessageEntity;
  Alignment alignment;
  ChatBubble({
    super.key,
    required this.chatMessageEntity,
    required this.alignment,
  });

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () async {
        ChatMessageEntity updatedMessage = ChatMessageEntity(
          id: widget.chatMessageEntity.id,
          text: widget.chatMessageEntity.text + "# ",
          createdAt: widget.chatMessageEntity.createdAt,
          author: widget.chatMessageEntity.author,
          imageUrl: widget.chatMessageEntity.imageUrl,
          image64base: widget.chatMessageEntity.image64base,
        );
        await FirebaseFirestore.instance
            .collection("messages")
            .doc(widget.chatMessageEntity.id)
            .update(updatedMessage.toJson());
        setState(() {
          widget.chatMessageEntity = updatedMessage;
        });
      },
      child: Align(
        alignment: widget.alignment,
        child: Container(
          constraints: BoxConstraints(
            maxWidth:
                MediaQuery.of(context).size.width *
                0.5, // Max 50% of screen width
          ),
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
                widget.chatMessageEntity.text,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              if (widget.chatMessageEntity.imageUrl != null &&
                  widget.chatMessageEntity.imageUrl!.isNotEmpty)
                Image.network(widget.chatMessageEntity.imageUrl!, height: 120),
              if (widget.chatMessageEntity.image64base != null &&
                  widget.chatMessageEntity.image64base!.isNotEmpty &&
                  widget.chatMessageEntity.image64base!.length > 100)
                Image.memory(
                  base64Decode(widget.chatMessageEntity.image64base!),
                  height: 120,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
