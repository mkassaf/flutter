import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'login_page.dart';
import 'package:chat_app/chat_page.dart';
import 'package:chat_app/utils/brand_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await AuthService.init(); // Initialize SharedPreferences
  runApp(
    ChangeNotifierProvider(create: (_) => AuthService(), child: ChatApp()),
  );
}

class ChatApp extends StatefulWidget {
  @override
  State<ChatApp> createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  User? currentUser = null;

  Future<void> _createNewAccount() async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: "mustsaf@gmail.com",
            password: "cap@2025",
          );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        currentUser = user;
        context.read<AuthService>().loginUser(user.email!);
        print('User is signed in! User: ${user.displayName} ');
      }
    });
    //_createNewAccount();
    super.initState();
    // Initialize Firebase Auth
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App for learning purposes',
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
      home: isLogin() ? ChatPage() : LoginPage(),
      routes: {
        '/chat': (context) => ChatPage(),
        '/signup': (context) => SignUpPage(),
      },
    );
  }

  bool isLogin() {
    if (FirebaseAuth.instance.currentUser == null) {
      return false;
    }
    if (!FirebaseAuth.instance.currentUser!.emailVerified) {
      FirebaseAuth.instance.currentUser!.sendEmailVerification();
      print("Email verification sent");
      return false;
    }
    return true;
  }
}
