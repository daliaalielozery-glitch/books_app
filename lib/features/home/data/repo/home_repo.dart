import 'package:books_app/core/networking/api_constants.dart';
import 'package:books_app/core/networking/dio_helper.dart';
import 'package:books_app/features/home/data/models/best_seller_response.dart';
import 'package:flutter/material.dart';
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
      debugPrint("Repo Error: $error");

      return null;
    }
  }

  static Future<BestSellerResponse?> getBestSeller() async {
    try {
      final response = await DioHelper.dio?.get(ApiConstants.bestSeller);
      if (response?.statusCode == 200) {
        BestSellerResponse data = BestSellerResponse.fromJson(response?.data);
        return data;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
