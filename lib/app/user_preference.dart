
import 'package:shared_preferences/shared_preferences.dart';

const String _usernameKey = "username";

class UserPreference {
  final SharedPreferences prefs;

  UserPreference(this.prefs);

  setUsername(String newToken) async {
    await prefs.setString(_usernameKey, newToken);
  }

  String? getUsername() {
    return prefs.getString(_usernameKey);
  }


}