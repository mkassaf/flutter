import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final Uri _url = Uri.parse('https://flutter.dev');

  bool isButtonEnabled = true;

  void Function()? loginUser() {
    return isButtonEnabled ? () => print('Login Successful') : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
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

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: loginUser,
                  child: Text(
                    'Click Me',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
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
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
