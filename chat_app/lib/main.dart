import 'package:flutter/material.dart';
import 'login_page.dart';
import 'package:chat_app/chat_page.dart';
import 'package:chat_app/statefull/counter_statefull_demo.dart';
import 'package:chat_app/statefull/stateless_demo.dart';
import 'package:chat_app/statefull/stateless_to_statefull.dart';

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
          primary: Colors.green, // Primary color
          secondary: Colors.blue, // Secondary color
        ),
        appBarTheme: AppBarTheme(
          foregroundColor: Colors.black,
          backgroundColor: Colors.blue,
        ),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}
