import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {

  static SharedPreferences? sharedPreferences;

  static initial() async{

    sharedPreferences= await SharedPreferences.getInstance();

  }

  static Future<bool> setDataBool({
    required String key,
    required bool value,
}) async{
   return await sharedPreferences!.setBool(key, value);
  }


  static bool? getDataBool({
    required String key,
}){

    return sharedPreferences!.getBool(key);
  }


  static Future<bool> setDataString({
    required String key,
    required String value,
}) async{

    return await sharedPreferences!.setString(key, value);
  }


  static String? getDataString({
    required String key,
  }){

    return sharedPreferences!.getString(key);
  }
}