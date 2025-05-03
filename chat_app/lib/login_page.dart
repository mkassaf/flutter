import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/utils/brand_colors.dart';
import 'package:flutter/material.dart';
import 'package:social_media_buttons/social_media_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:chat_app/widgets/login_text_field.dart';
import 'package:chat_app/utils/spaces.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  Future<bool> loginFireBase(String userName, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userName,
        password: password,
      );
      // User is signed in
      print('User signed in: ${credential.user?.email}');
      return true;
    } on FirebaseAuthException catch (e) {
      print('Error signing in: ${e.code}');
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    return false;
  }

  void loginUser() async {
    if (_formKey.currentContext != null && _formKey.currentState!.validate()) {
      var userName = userNameController.text;
      var password = passwordController.text;

      bool isValid = await loginFireBase(userName, password);
      if (!isValid) {
        print("Login failed");
        return;
      }
      context.read<AuthService>().loginUser(userNameController.text);

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

  Widget _buildHeader(context) {
    return Column(
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
      ],
    );
  }

  Widget _buildFooter() {
    return Column(
      children: [
        Material(
          child: InkWell(
            splashColor: Colors.red,
            // Adds a red ripple effect on tap
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
            SocialMediaButton.twitterX(url: "https://twitter.com/flutterdev"),
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
    );
  }

  Widget _buildForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
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
        verticalSpacing(24), // Adds space between form fields and buttons

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
          onPressed: () async {
            try {
              await FirebaseAuth.instance.sendPasswordResetEmail(
                email: userNameController.text,
              );
            } catch (e) {
              print('Error sending password reset email: $e');
              AwesomeDialog(
                context: context,
                dialogType: DialogType.error,
                animType: AnimType.rightSlide,
                title: 'Error',
                desc: 'Failed to send password reset email. ${e.toString()}',
                btnCancelOnPress: () {},
                btnOkOnPress: () {},
              ).show();
            }
            AwesomeDialog(
              context: context,
              dialogType: DialogType.info,
              animType: AnimType.rightSlide,
              title: 'Reset password',
              desc: 'A password reset link has been sent to your email.',
              btnCancelOnPress: null,
              btnOkOnPress: () {},
            ).show();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Forgot password?',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              horizontalSpacing(8),
              Text('Reset', style: TextStyle(fontSize: 18, color: Colors.blue)),
            ],
          ),
        ),
        // Sign up button
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
        verticalSpacing(24),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: SingleChildScrollView(
            child: LayoutBuilder(
              builder: (context, BoxConstraints constraints) {
                if (constraints.maxWidth > 1000) {
                  return Row(
                    children: [
                      Spacer(flex: 1),
                      Expanded(
                        child: Column(
                          children: [_buildHeader(context), _buildFooter()],
                        ),
                      ),
                      Spacer(flex: 1),
                      Expanded(child: _buildForm()),
                      Spacer(flex: 1),
                    ],
                  );
                }
                return Column(
                  children: [
                    _buildHeader(context),
                    _buildForm(),
                    _buildFooter(),
                  ],
                );
              },
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
