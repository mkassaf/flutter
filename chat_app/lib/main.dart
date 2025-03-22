import 'package:flutter/material.dart';

import 'package:chat_app/home_page.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //TODO: customize colors, typography, button styles, and more using ThemeData.
    return MaterialApp(title: 'Flutter Demo', home: HomePage());
  }
}
