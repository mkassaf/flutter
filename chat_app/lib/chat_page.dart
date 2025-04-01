import 'package:chat_app/widgets/chat_input.dart';
import 'package:flutter/material.dart';
import 'widgets/chat_bubble.dart';
import 'models/chat_message_entity.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});

  final List<ChatMessageEntity> _messages = [
    ChatMessageEntity(
      id: "1",
      text: "Hello",
      createdAt: DateTime.now(),
      author: Author(username: 'Assaf'),
    ),
    ChatMessageEntity(
      id: "2",
      text: "Could you please send me the image?",
      createdAt: DateTime.now(),
      author: Author(username: 'Assaf'),
    ),
    ChatMessageEntity(
      id: "3",
      text: "Hello Assaf",
      createdAt: DateTime.now(),
      author: Author(username: 'Ahmad'),
    ),
    ChatMessageEntity(
      id: "4",
      text: "this is the image",
      createdAt: DateTime.now(),
      imageUrl: "https://shorturl.at/PkTiO",
      author: Author(username: 'Ahmad'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final String username =
        ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Hi $username")),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, "/");
            },
            icon: Icon(Icons.logout),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ChatBubble(
                  chatMessageEntity: _messages[index],
                  alignment:
                      _messages[index].author.username == username
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                );
              },
            ),
          ),
          ChatInput(),
        ],
      ),
    );
  }
}
