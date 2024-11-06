import 'package:bloc/bloc.dart';
import 'package:coffee_api/features/home/presentation/viewmodel/cubit/home_state.dart';
import 'package:coffee_api/models/model.dart';
import 'package:dio/dio.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitialHomeState());

  List<Coffee> _coffeeList = [];
  bool isLoading = true;

  Future<void> getHttp() async {
    emit(LoadingHomeState());
    final dio = Dio();
    try {
      final response = await dio.get("https://fake-coffee-api.vercel.app/api");
      _coffeeList =
          (response.data as List).map((item) => Coffee.fromJson(item)).toList();
      isLoading = false;
      emit(
          SuccessHomeState(_coffeeList.isNotEmpty ? _coffeeList[0] : Coffee()));
    } catch (e) {
      isLoading = false;
      emit(ErrorHomeState('Error fetching coffee data: $e'));
      print('Error fetching coffee data: $e');
    }
  }

  List<Coffee> get coffeeList => _coffeeList;

  void selectCoffee(Coffee coffee) {
    emit(SuccessHomeState(coffee));
  }
}
