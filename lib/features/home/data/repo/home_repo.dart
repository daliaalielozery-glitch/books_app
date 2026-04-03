import 'package:books_app/core/networking/api_constants.dart';
import 'package:books_app/core/networking/dio_helper.dart';
import '../models/slider_models.dart';

class HomeRepo {
  static Future<HomeResponse?> getSlider() async {
    try {
      final response = await DioHelper.dio?.get(ApiConstants.slider);

      if (response?.statusCode == 200) {
        HomeResponse data = HomeResponse.fromJson(response?.data);
        return data;
      } else {
        return null;
      }
    } catch (error) {
      print("Repo Error: $error");
      return null;
    }
  }
}