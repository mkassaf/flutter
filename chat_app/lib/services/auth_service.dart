
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> loginUser(String username) async {
    try {
      final SharedPreferences prefs = await _prefs;
      await prefs.setString("userName", username);
    } catch (e) {
      //TODO handle error
      print("Error saving user name: $e");
    }
  }

  Future<void> logoutUser() async {
    final SharedPreferences prefs = await _prefs;
    await prefs.remove("userName");
  }

  Future<String?> getUserName() async {
    final SharedPreferences prefs = await _prefs;
    //TODO in case of null, throw an exception, ask for login again or return a default value
    return prefs.getString("userName") ?? "Guest";
  }

}