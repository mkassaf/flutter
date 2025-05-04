import 'package:chat_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'package:chat_app/chat_page.dart';
import 'package:chat_app/utils/brand_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: BrandColors.primary, // Primary color
          secondary: BrandColors.secondary, // Secondary color
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
