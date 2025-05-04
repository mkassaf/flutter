import 'dart:convert';

import 'package:chat_app/widgets/chat_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgets/chat_bubble.dart';
import 'models/chat_message_entity.dart';

class ChatPage extends StatefulWidget {
  ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  //Initial messages
  List<ChatMessageEntity> _messages = [];

  _loadInitialMessages() async {
    //TODO load messages from firebase
    final response = await rootBundle.loadString('assets/mock_messages.json');

    final decodedList = jsonDecode(response) as List;

    print(decodedList);
    List<ChatMessageEntity> messages =
        decodedList.map((e) {
          return ChatMessageEntity.fromJson(e);
        }).toList();
    setState(() {
      _messages = messages;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadInitialMessages();
  }

  @override
  Widget build(BuildContext context) {
    final String username = FirebaseAuth.instance.currentUser!.email!;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Hi $username")),
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
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
          ChatInput(onSend: onMessageSent),
        ],
      ),
    );
  }

  void onMessageSent(ChatMessageEntity newMessage) {
    //TODO: send message to firebase cloud
    setState(() {
      _messages.add(newMessage);
    });
  }
}
