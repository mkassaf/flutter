import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/signup_patge.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
      home: getHomePage(), // this equls to '/'
      routes: {
        '/chat': (context) => ChatPage(),
        '/signup': (context) => SignUpPage(),
      },
    );
  }

  Widget getHomePage() {
    // if the user is logged in, show the chat page
    // else show the login page
    var currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      print(currentUser.emailVerified);
      return ChatPage();
    }
    return LoginPage();
  }
}
