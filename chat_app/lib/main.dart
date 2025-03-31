import 'package:flutter/material.dart';
import 'login_page.dart';
import 'package:chat_app/chat_page.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          //TODO: Add your primary and secondary colors
          primary: Colors.green,
          secondary: Colors.blue,
        ),
        appBarTheme: AppBarTheme(
          foregroundColor: Colors.black,
          backgroundColor: Colors.blue,
        ),
        useMaterial3: true,
      ),
      home: LoginPage(), // this equls to '/'
      routes: {'/chat': (context) => ChatPage()},
    );
  }
}
