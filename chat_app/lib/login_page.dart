import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:chat_app/widgets/login_text_field.dart';

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

  void loginUser() {
    if (_formKey.currentContext != null && _formKey.currentState!.validate()) {
      Navigator.pushReplacementNamed(
        context,
        '/chat',
        arguments: userNameController.text,
      );
      print("Login successful");
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
                Image.network("https://shorturl.at/RqyFD", height: 200),

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
                      SizedBox(
                        height: 24,
                      ), // Adds space between form fields and buttons
                      // Password field
                      LoginTextField(
                        controller: passwordController,
                        hasAsterisks: true,
                        hintText: "Type your password",
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24,
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
                      //TODO to define a default color
                      return Colors.green; // Default color
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

                OutlinedButton(
                  onPressed: () {},
                  child: FlutterLogo(), // Using a logo instead of text
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
