import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../data/models/slider_models.dart';
import '../data/repo/home_repo.dart';    // You need this import to use HomeRepo

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  // Using HomeInitial() to match the screenshot
  HomeCubit() : super(HomeInitial());

  getSlider() async {
    emit(SliderLoadingState());

    // Calling the static method from your repository
    final response = await HomeRepo.getSlider();

    if (response != null) {
      emit(SliderSuccessState(response.data?.sliders ?? []));
    } else {
      emit(SliderErrorState());
    }
  }
}