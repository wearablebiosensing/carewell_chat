import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class HelperFunctions {
  static String sharedPreferenceUserLoggedInKey = "ISLOGGEDIN";
  //static String sharedPreferenceUserNameKey = "USERNAMEKEY"; Dont need this one till we save username
  static String sharedPreferenceUserEmailKey = "ISLOGGEDIN";

  static Future<bool> saveUserLoggedInSharedPreference(
      bool isUserLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(sharedPreferenceUserLoggedInKey, isUserLoggedIn);
  }

  //Can place a similar function here to save the username to shared preferences once figured out

  static Future<bool> saveUserEmailSharedPreference(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(sharedPreferenceUserEmailKey, email);
  }

  //Get data from shared preference nalso missing username getter

  static Future<bool?> getUserLoggedInSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getBool(sharedPreferenceUserLoggedInKey);
  }

  static Future<String?> getUserEmailSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // ignore: await_only_futures
    //Leave this even though it throws an error. Not sure how to fix nothing works
    return await prefs.getString(sharedPreferenceUserEmailKey);
  }
}
