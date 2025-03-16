import 'package:chat_app/widgets/chat_input.dart';
import 'package:flutter/material.dart';
import 'widgets/chat_bubble.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Hi CAP students!"),),
        actions: [
          IconButton(onPressed: () {
            print("Search clicked!");
          }, icon: Icon(Icons.logout)),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            //TODO: Create a dynamic list sized list of ChatBubble widgets
            child: ListView(
              children: [
                ChatBubble(message: "Hi!", alignment: Alignment.centerRight),
                ChatBubble(message: "Hello!", alignment: Alignment.centerLeft),
                ChatBubble(message: "Hi this is your message!", alignment: Alignment.centerRight),
              ],
            ),
          ),
          ChatInput(),
        ],
      ),
    );
  }
}
