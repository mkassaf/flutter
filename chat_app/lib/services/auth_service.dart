
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends ChangeNotifier {

  static late SharedPreferences prefs;
  static const String _userNameKey = "userName";

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  void loginUser(String username) {
    try {
      prefs.setString(_userNameKey, username);
    } catch (e) {
      //TODO handle error
      print("Error saving user name: $e");
    }
  }

  void logoutUser() {
    prefs.remove(_userNameKey);
  }

  String getUserName() {
    //TODO in case of null, throw an exception, ask for login again or return a default value
    return prefs.getString(_userNameKey) ?? "Guest";
  }

  void updateUserName(String newUserName) {
    prefs.setString(_userNameKey, newUserName);
    notifyListeners(); // Notify listeners about the change
  }

}