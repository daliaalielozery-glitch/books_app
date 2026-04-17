import 'package:bloc/bloc.dart';
import 'package:books_app/features/home/data/models/best_seller_response.dart';
import 'package:flutter/material.dart';
import '../data/models/slider_models.dart';
import '../data/repo/home_repo.dart'; // You need this import to use HomeRepo

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  // Using HomeInitial() to match the screenshot
  HomeCubit() : super(HomeInitial()) {
    // لازم تنادي عليهم هنا عشان يشتغلوا أول ما الكيوبيت يتكون
    getSlider();
    getBestSeller();
  }
  Future<void> getSlider() async {
    emit(SliderLoadingState());

    // Calling the static method from your repository
    final response = await HomeRepo.getSlider();
    print("Slider Response: ${response?.data?.sliders}");

    if (response != null) {
      emit(SliderSuccessState(response.data?.sliders ?? []));
    } else {
      emit(SliderErrorState());
    }
  }
Future<void> getBestSeller() async {
  emit(BestSellerLoadingState()); 

  try {
    final response = await HomeRepo.getBestSeller();

    if (response != null) {
      // بنبعت القائمة مرة واحدة بس للـ Constructor الجديد
      emit(BestSellerSuccessState(response.data?.products ?? []));
    } else {
      emit(BestSellerErrorState());
    }
  } catch (e) {
    emit(BestSellerErrorState());
  }
}
}
