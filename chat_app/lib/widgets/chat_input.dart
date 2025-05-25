import 'dart:io';

import 'package:chat_app/models/chat_message_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ChatInput extends StatefulWidget {
  void Function(ChatMessageEntity message) onSendMessage;

  ChatInput({super.key, required this.onSendMessage});

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  bool isSendEenabled = false;
  File? galleryFile;
  final picker = ImagePicker();

  final chatMessageController = TextEditingController();

  void onSendButtonPressed() async {
    final storageRef = FirebaseStorage.instance
        .ref()
        .child("images")
        .child(DateTime.now().millisecondsSinceEpoch.toString());
    try {
      if (galleryFile != null) {
        await storageRef.putFile(galleryFile!);
        print("Image uploaded successfully");
      }
    } catch (e) {
      print("Error uploading image: $e");
    }
    ChatMessageEntity newMessage = ChatMessageEntity(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: chatMessageController.text,
      createdAt: DateTime.now(),
      author: Author(username: "User"),
      imageUrl: galleryFile != null ? await storageRef.getDownloadURL() : null,
    );

    try {
      print("Sending message: ${newMessage.toJson()}");
      await FirebaseFirestore.instance
          .collection("messages")
          .add(newMessage.toJson());
      widget.onSendMessage(newMessage);
      setState(() {
        isSendEenabled = false;
        galleryFile = null; // Clear the image after sending
      });
      chatMessageController.clear();
    } catch (e, s) {
      print("Error sending message: $e $s");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 65),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              _showPicker(context: context);
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
                  onChanged: (value) {
                    setState(() {
                      isSendEenabled = value.isNotEmpty;
                    });
                  },
                ),
                if (galleryFile != null)
                  Image.file(
                    galleryFile!,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
              ],
            ),
          ),
          IconButton(
            onPressed: isSendEenabled ? onSendButtonPressed : null,
            icon: Icon(Icons.send),
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  void _showPicker({required BuildContext context}) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Photo Library'),
                onTap: () {
                  getImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  getImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future getImage(ImageSource img) async {
    // pick image from gallary
    final pickedFile = await picker.pickImage(source: img);
    // store it in a valid variable
    XFile? xfilePick = pickedFile;
    setState(() {
      if (xfilePick != null) {
        // store that in global variable galleryFile in the form of File
        galleryFile = File(pickedFile!.path);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          // is this context <<<
          const SnackBar(content: Text('Nothing is selected')),
        );
      }
    });
  }
}
