import 'dart:convert';

import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/widgets/chat_input.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgets/chat_bubble.dart';
import 'models/chat_message_entity.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  //Initial messages
  List<ChatMessageEntity> _messages = [];
  ScrollController _scrollController = ScrollController();

  _loadInitialMessages() async {
    var query = await FirebaseFirestore.instance.collection("messages").get();
    query.docs.forEach((doc) {
      var message = ChatMessageEntity.fromJson(doc.data());
      _messages.add(message);
      setState(() {});
    });

    print("Messages loading request is sent successfully");
  }

  @override
  void initState() {
    super.initState();
    _loadInitialMessages();
  }

  @override
  Widget build(BuildContext context) {
    final String username = context.watch<AuthService>().getUserName();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Hi $username"),
        actions: [
          IconButton(
            onPressed: () {
              context.read<AuthService>().updateUserName("Updated!!");
            },
            icon: Icon(Icons.refresh),
          ),
          IconButton(
            onPressed: () async {
              await context.read<AuthService>().logoutUser();
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
              controller: _scrollController,
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

  void onMessageSent(ChatMessageEntity newMessage) async {
    var currentUser = await FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance
        .collection("messages")
        .add({
          "id": newMessage.id,
          "text": newMessage.text,
          "createdAt": newMessage.createdAt.millisecond,
          "imageUrl": newMessage.imageUrl,
          "author": {"username": currentUser!.email},
        })
        .then(
          (DocumentReference doc) =>
              print('DocumentSnapshot added with ID: ${doc.id}'),
        );

    setState(() {
      _messages.add(newMessage);
    });
    // Ensure UI updates before scrolling
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }
}
