import 'dart:convert';
import 'dart:math';

import 'package:chat_app/widgets/chat_input.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
    var query = await FirebaseFirestore.instance.collection("messages").get();

    _messages =
        query.docs.map((doc) {
          var id = doc.id;
          var data = doc.data();
          data.update("id", (_) => id);
          print("data : $data");
          return ChatMessageEntity.fromJson(data);
        }).toList();

    setState(() {
      _messages = _messages;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadInitialMessages();
  }

  @override
  Widget build(BuildContext context) {
    final String username = FirebaseAuth.instance.currentUser!.email ?? "User";
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
          ChatInput(onSendMessage: addMessage),
        ],
      ),
    );
  }

  void addMessage(ChatMessageEntity message) {
    setState(() {
      _messages.add(message);
    });
  }
}
