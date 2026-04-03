import 'package:books_app/core/networking/api_constants.dart';
import 'package:books_app/core/networking/dio_helper.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {


  static login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await DioHelper.dio?.post(
        ApiConstants.login,
        data: {
          "email": email,
          "password": password,
        },
      );

      if (response?.statusCode == 200) {
        saveUserToken(response?.data["data"]["token"]);
        return response?.data;
      } else {
        return {
          "error": "Login failed",
        };
      }

    } catch (e) {
      return {
        "error": e.toString(),
      };
    }
  }
  static Future<void> saveUserToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);
    print("Token Saved successfully!");

  }
}
