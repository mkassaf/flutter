
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {

  static late SharedPreferences prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  void loginUser(String username) {
    try {
      prefs.setString("userName", username);
    } catch (e) {
      //TODO handle error
      print("Error saving user name: $e");
    }
  }

  void logoutUser() {
    prefs.remove("userName");
  }

  String getUserName() {
    //TODO in case of null, throw an exception, ask for login again or return a default value
    return prefs.getString("userName") ?? "Guest";
  }

  void updateUserName(String newUserName) {
    //TODO: Update shared preferences with the new username
  }

}