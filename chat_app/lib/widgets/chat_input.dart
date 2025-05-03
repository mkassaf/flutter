import 'package:chat_app/models/chat_message_entity.dart';
import 'package:chat_app/widgets/picker_body.dart';
import 'package:flutter/material.dart';

class ChatInput extends StatefulWidget {
  Function(ChatMessageEntity) onSend;

  ChatInput({super.key, required this.onSend});

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  String? _selectedImageUrl;

  final chatMessageController = TextEditingController();

  void onSendButtonPressed() {
    print("Message sent: ${chatMessageController.text}");
    final newChatMessage = ChatMessageEntity(
      id: "123",
      text: chatMessageController.text,
      createdAt: DateTime.now(),
      imageUrl: _selectedImageUrl,
      author: Author(username: "User"),
    );
    widget.onSend(newChatMessage);
    setState(() {
      _selectedImageUrl = null;
      chatMessageController.clear();
    });
  }

  void onImagePicked(String imageUrl) {
    print("Image picked $imageUrl");
    setState(() {
      _selectedImageUrl = imageUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return NetworkImagePickerBody(onImageSelected: onImagePicked);
                },
              );
            },
            icon: Icon(Icons.add),
            color: Colors.white,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
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
                if (_selectedImageUrl != null)
                  Image.network(_selectedImageUrl!, width: 100),
              ],
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
