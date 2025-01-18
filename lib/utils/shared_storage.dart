import 'package:shared_preferences/shared_preferences.dart';

class SharedStorage {
    static const String _onboardingKey = 'isOnboardingComplete';
    
  static Future<void> setOnboardingComplete(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_onboardingKey, value);
  }

  static Future<bool> isOnboardingComplete() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_onboardingKey) ?? false;
    }
}