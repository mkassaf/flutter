import 'package:chat_app/utils/brand_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media_buttons/social_media_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:chat_app/widgets/login_text_field.dart';
import 'package:chat_app/utils/spaces.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final Uri _url = Uri.parse('https://flutter.dev');
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isButtonEnabled = false;
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  void loginUser() async {
    if (_formKey.currentContext != null && _formKey.currentState!.validate()) {
      try {
        var cred = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userNameController.text,
          password: passwordController.text,
        );
        if (cred.user?.emailVerified == false) {
          // Handle email not verified
          showDialog(
            context: context,
            builder:
                (context) => AlertDialog(
                  title: Text("Email Not Verified"),
                  content: Text("Please verify your email before logging in."),
                  actions: [
                    TextButton(
                      onPressed: () => cred.user?.sendEmailVerification(),
                      child: Text('Send Verification Email'),
                    ),
                  ],
                ),
          );
          return;
        }

        if (cred.user == null) {
          // Handle user not found
          print("User not found");
          return;
        }

        Navigator.pushReplacementNamed(
          context,
          '/chat',
          arguments: userNameController.text,
        );
      } catch (e) {
        // Handle login error
        print("Login error: $e");
      }
    } else {
      // Validation failed, show error messages
      print("Login failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Let\'s sign you in!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Welcome back!\n You've been missed!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Image.asset("assets/login_logo.png", height: 200),

                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Username field
                      LoginTextField(
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return 'Please enter some text';
                          }
                          if (value!.length < 5) {
                            return 'Username must be at least 5 characters long';
                          }
                          return null;
                        },
                        controller: userNameController,
                        hintText: "Add your username",
                      ),
                      verticalSpacing(24),
                      // Password field
                      LoginTextField(
                        controller: passwordController,
                        hasAsterisks: true,
                        hintText: "Type your password",
                      ),
                    ],
                  ),
                ),
                verticalSpacing(
                  24,
                ), // Adds space between form fields and buttons

                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.resolveWith((states) {
                      // Check if the button is pressed or hovered
                      if (states.contains(WidgetState.pressed)) {
                        return Colors.blue; // Color when pressed
                      } else if (states.contains(WidgetState.hovered)) {
                        return Colors.green; // Color when hovered
                      } else if (states.contains(WidgetState.disabled)) {
                        return Colors.grey; // Color when disabled
                      }
                      return BrandColors.primary; // Default color
                    }),
                  ),
                  onPressed: loginUser,
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),

                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Do have an account?',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      horizontalSpacing(8),
                      Text(
                        'Sign up',
                        style: TextStyle(fontSize: 18, color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    FirebaseAuth.instance.sendPasswordResetEmail(
                      email: userNameController.text,
                    );
                    showDialog(
                      context: context,
                      builder:
                          (context) => AlertDialog(
                            title: Text("Password Reset"),
                            content: Text(
                              "Check your email for password reset.",
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: Text('OK'),
                              ),
                            ],
                          ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Forget password?',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      horizontalSpacing(8),
                      Text(
                        'Reset password!',
                        style: TextStyle(fontSize: 18, color: Colors.blue),
                      ),
                    ],
                  ),
                ),

                Material(
                  child: InkWell(
                    splashColor: Colors.red, // Adds a red ripple effect on tap
                    onDoubleTap: () {
                      print('Double Tap Detected');
                    },
                    onLongPress: () {
                      print('Long Press Detected');
                    },
                    onTap: _launchUrl,
                    child: Column(
                      children: [
                        Text(
                          "Find more about Flutter",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialMediaButton.twitterX(
                      url: "https://twitter.com/flutterdev",
                    ),
                    SocialMediaButton.google(
                      url: "https://google.com",
                      color: Colors.red,
                    ),
                    SocialMediaButton.linkedin(
                      url: "https://linkedin.com",
                      color: Colors.blue,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
