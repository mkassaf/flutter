import 'dart:convert';

import 'package:chat_app/widgets/chat_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'models/image_model.dart';
import 'widgets/chat_bubble.dart';
import 'models/chat_message_entity.dart';
import 'package:http/http.dart' as http;


class ChatPage extends StatefulWidget {
  ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  //Initial messages
  List<ChatMessageEntity> _messages = [];

  _loadInitialMessages() {
    rootBundle.loadString('assets/mock_messages.json').then((response) {
      final decodedList = jsonDecode(response) as List;
      List<ChatMessageEntity> messages =
          decodedList.map((e) {
            return ChatMessageEntity.fromJson(e);
          }).toList();
      setState(() {
        _messages = messages;
      });
    });
    print("Messages loading request is sent successfully");
  }


  _getNetworkImage() async {
    final endpointUrl = Uri.parse('https://picsum.photos/v2/list');

    // Make the GET request
    final response = await http.get(endpointUrl);
    if (response.statusCode != 200) {
      print("Error: ${response.statusCode}");
      return;
    }

    final decodedList = jsonDecode(response.body) as List;
    List<PixelFormImage> imageList = decodedList.map((item) {
       return PixelFormImage.fromJson(item);
    }).toList();
    print(imageList[0].downloadUrl);
  }

  @override
  void initState() {
    super.initState();
    _loadInitialMessages();
  }

  @override
  Widget build(BuildContext context) {
    _getNetworkImage();
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
          ChatInput(onSend: onMessageSent),
        ],
      ),
    );
  }

  void onMessageSent(ChatMessageEntity newMessage) {
    setState(() {
      _messages.add(newMessage);
    });
  }
}
